require File.expand_path(File.join(File.dirname(__FILE__), 'apps/dealdey_prep/current/config', 'environment'))
permalinks = ["black-slazenger-mens-polo-shirt", "limited-time-offer", "beaudy-professional-hair-straightene","pod-service-deal-1-2", "its-a-rencredit-deal-3", "its-a-rencredit-deal-2", "its-a-rencredit-deal"]

permalinks.each do |permalink|
  deal = Deal.where(permalink: permalink).first
  if deal
    p "Deal present................."
    if !deal.can_be_bought?
      if deal.current_status != CurrentStatus[:live]
        p "Deal(#{deal.permalink}) is not live................."
        deal.update_column(status: Deal::STATUS[:recent])
        deal.update_attributes(start_date: Time.now - 2.day, end_date: Time.now + 10.day, expiration_date: Time.now + 11.day)
        p "Status and date has been updated for Deal(#{deal.permalink})...................."
      elsif deal.is_flash_deal? && !deal.product_group.is_live?
        p "Deal(#{deal.permalink}) is a flash deal and not live........."
        if deal.product_group.active?
          deal.product_group.update_column(:status, true)
          p "Status has been updated for flash Deal(#{deal.permalink})...................."
        else
          deal.product_group.update_attributes(start_date: Time.now - 1.day, end_date: Time.now + 10.day)
          p "End and start date has been updated for flash Deal(#{deal.permalink})...................."
        end
      end
    elsif deal.sold_out_at?
      p "Deal(#{deal.permalink}) is sold out, updating bought_count and sold_out_at........."
      deal.update_attributes(bought_count: 1, sold_out_at: nil)
      p "bought_count and sold_out has been updated for Deal(#{deal.permalink})........."
    end
  else
    p "Deal with permalink #{permalink} is not found"
  end
end

user = User.where(email: "vijay@vinsol.com").first
p "User not present for email 'vijay@vinsol.com'" unless user
user.update_column(:balance, 100000) if user && user.balance <= 5000
