class ShoppingCart < ActiveRecord::Base
  include Payola::Sellable
  
  has_many :cart_items

  before_validation on: :create do
    self.permalink = SecureRandom.hex
    self.name = "Cart on Buy it!"
  end


  def price
    cart_items.map { |item| item.price }.sum
  end

  def price_in_dollars
    price / 100.0
  end

  def redirect_path(sale)
    '/shoppint_cart/delete'
  end
end
