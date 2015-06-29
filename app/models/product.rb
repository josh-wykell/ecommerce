class Product < ActiveRecord::Base
  has_many :cart_items
  mount_uploader :picture, PictureUploader

  def price
    price_in_cents
  end

  def price_in_dollars
    price_in_cents / 100.0
  end

  def price=(dollars)
    self.price_in_cents = dollars * 100
  end
  
end
