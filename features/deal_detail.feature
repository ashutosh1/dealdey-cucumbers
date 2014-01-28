Feature: Deal Detail page
  As user i should be able to add deals in my cart

Background:
  Given I visit home page
  And I close the subscription popup

Scenario: User should be able to add more than one deal to cart
  And I add a deal to my cart
  And I add a another deal to my cart
  Then I should see 2 products in my cart on cart page
  Then I should see 2 in cart icon on cart page

Scenario: User should not be able to add more than deals per user
  And I add a with quantity greater than max allowed per user 
  And I add it to cart
  Then I should see flash error "Black Slazenger Mens Polo Shirt is sold out OR the quantities you have selected are not available."
  