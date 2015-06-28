class Cart < ActiveRecord::Base
  include Payola::Sellable
  
  has_many :cart_items

  before_validation on: :create do
    self.permalink = SecureRandom.hex
    self.name = "Your Cart"
  end

  def price
    cart_items.map { |item| item.price }.sum
  end

  def price_in_dollars
    price / 100.0
  end

  def redirect_path(sale)
    '/cart/delete'
  end
end

