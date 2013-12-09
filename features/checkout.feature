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
  Given I am on deatil page of shippable deal 'black-slazenger-mens-polo-shirt'
  Then I should see available cod options
  Then I should see delivery detail
  And I click 'View available area'
  Then I should see states to select in popup

Scenario: add shippable product to cart
  Given I am on deatil page of shippable deal 'black-slazenger-mens-polo-shirt'
  And I add it to cart
  Then I should see flash notice "Black Slazenger Men's Polo Shirt was successfully added to your cart"

Scenario: on checkout of shippable item
  Given I am on cart detail page for shippable item 'black-slazenger-mens-polo-shirt'
  And I click 'Proceed to Payment' link
  And I am logged in as user
  And I wait for 5 seconds
  Then I should see addresses to select
  And I select first address
  And I click 'Proceed to Payment' link
  And I proceed
  Then I should be on 'checkout' page
  And I click 'Complete Order' button
  Then Order should be successful
  Then I should see 'Thanks for shopping on DealDey!'