class CartItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :shopping_cart

  def price
    quantity * product.price
  end

  def price_in_dollars
    price / 100.0
  end

end
