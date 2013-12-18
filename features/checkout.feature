Feature: Checkout Page
  should be able to checkout with non shippable product and wallet payment
  
@non_shippable
Scenario: add product to cart
  Given I am on deatil page of deal 'limited-time-offer'
  And I click 'buy' button
  Then I should see 'Add To Cart' popup
  And I click 'Add To Cart' button
  Then I should see flash notice "Limited - Time offer was successfully added to your cart"

Scenario: on cart detail page
  Given I am on cart detail page for non shippable item
  Then I should see 'Continue shopping' link
  And I click 'Proceed to Payment' link
  And I am logged in as user
  And I wait for 5 seconds
  And I proceed
  Then I should be on 'checkout' page

Scenario: on checkout page
  Given I am on cart detail page for non shippable item
  And I click 'Proceed to Payment' link
  And I am logged in as user
  And I wait for 5 seconds
  And I proceed
  And I click 'Complete Order' button
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'

@shippable
Scenario: options for shippable product on detail page
  Given I am on deatil page of shippable deal
  Then I should see available cod options
  Then I should see delivery detail
  And I click 'View available area'
  Then I should see states to select in popup

Scenario: add shippable product to cart
  Given I am on deatil page of shippable deal
  And I add it to cart
  Then I should see flash notice "Black Slazenger Men's Polo Shirt was successfully added to your cart"

Scenario: on checkout of shippable item
  Given I am on cart detail page for shippable item
  And I click 'Proceed to Payment' link
  And I am logged in as user
  And I wait for 5 seconds
  Then I should see addresses to select
  And I select first address
  And I click 'Proceed to Payment' link
  Then I should be on 'checkout' page
  And I click 'Complete Order' button
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'

@shippable_pod
Scenario: shippable pod deals
  Given I am on deatil page of shippable pod deal
  And I close the subscription popup
  Then I should see pay on delivery section
    
Scenario: add shippable pod deals to cart
  Given I am on deatil page of shippable pod deal
  And I click 'buy' button
  And I add it to cart
  Then I should see flash notice "Beaudy Professional Hair Straightene was successfully added to your cart"

Scenario: on checkout of shippable pod
  Given I am on deatil page of shippable pod deal
  And I click 'buy' button
  And I add it to cart
  And I click 'Proceed to Payment' link
  And I am logged in as user
  And I wait for 5 seconds
  Then I should see addresses to select
  And I select first address
  And I click 'Proceed to Payment' link
  Then I should be on 'checkout' page

Scenario: checkout for shippable pod with address
  Given I am on checkout page of shippable pod deal
  And I am logged in as user
  And I select first address
  And I click 'Proceed to Payment' link
  And I selcet Pay on Delivery and click complete button
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'

@non_shippable_pod
Scenario: non shippable pod deals
  Given I am on deatil page of non shippable pod deal
  Then I should see pay on delivery section
  
Scenario: add shippable pod deals to cart
  Given I am on deatil page of non shippable pod deal
  And I click 'Buy' link
  Then I should see flash notice "PoD Service Deal 1 was successfully added to your cart"

Scenario: on checkout of non shippable pod
  Given I am on deatil page of non shippable pod deal
  And I click 'Buy' link
  And I am logged in as user
  And I wait for 5 seconds
  And I proceed
  Then I should be on 'checkout' page

Scenario: checkout for non shippable pod with selecting address
  Given I am on checkout page of non shippable pod deal
  And I am logged in as user
  And I wait for 5 seconds
  And I proceed
  And I selcet Pay on Delivery
  And I click 'select/add your shipping address'
  And I select first pod address
  And I proceed with pod address
  And I click complete order button for pod
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'

Scenario: checkout for non shippable pod with new address
  Given I am on checkout page of non shippable pod deal
  And I am logged in as user
  And I wait for 5 seconds
  And I proceed
  And I selcet Pay on Delivery
  And I click 'select/add your shipping address'
  And I fill new shipping address for pod
  And I proceed with new pod address
  And I click complete order button for pod
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'

Scenario: checkout for non shippable pod without selecting address
  Given I am on checkout page of non shippable pod deal
  And I am logged in as user
  And I wait for 5 seconds
  And I proceed
  And I selcet Pay on Delivery
  And I click 'select/add your shipping address'
  And I proceed with pod address
  Then I should see error message on pod popup "Please select a shipping address"

@rencredit_deals  
Scenario: rencredit deals
  Given I visit page "rencreditmax_deal"
  And I close the subscription popup
  Then I should see "Available for installmental payments"

Scenario: add rencredit deals to cart
  Given I am on deatil page of rencredit max deal
  And I add it to cart
  Then I should see flash notice "Its a rencredit deal was successfully added to your cart"

Scenario: proceed to payment on cart page for rencredit deals
  Given I am on cart deatil page of rencredit max deal
  And I select first address
  And I click 'Proceed to Payment' link
  Then I should be on 'checkout' page

Scenario: Pay in Installments option on checkout page for rencredit deals
  Given I am on checkout page of rencredit max deal
  Then I should see 'Pay in Installments' option

Scenario: Choose Pay in Installments option on checkout page for rencredit deals
  Given I am on checkout page of rencredit max deal
  And I select 'Pay in Installments' option
  And I click continue
  Then I should see flash notice "Only below listed items are available under Rencredit Installment Payment Option."

Scenario: Complete order for rencredit deals
  Given I am on checkout page of rencredit max deal
  And I select 'Pay in Installments' option
  And I click continue
  And I click 'Complete Order' button
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'

Scenario: Order sum is greter than 500000 rencredit deals to cart
  Given I am on checkout page of rencredit max deal with sum greater than max limit
  And I select 'Pay in Installments' option
  And I click continue payment
  Then I should see "Your order cost exceeds the maximum limit allowed for a Rencredit order which is N 500000. Please remove some items from your cart to proceed with the order."

Scenario: Order sum is less than 30000 for rencredit deals 
  Given I am on checkout page of rencredit deal
  Then I should not see 'Pay in Installments' option

Scenario: rencredit deals with multiple order
  Given I am on deatil page of rencredit max deal
  And I add it to cart
  And I am on cart detail page for non shippable item
  Then I should see two products in my cart on cart page

Scenario: rencredit deals with multiple order
  Given I am on checkout page with rencredit and normal product
  And I select 'Pay in Installments' option
  And I click continue payment
  Then I should see flash notice "Only below listed items are available under Rencredit Installment Payment Option."
  Then I should see only rencredit product
