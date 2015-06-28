class Product < ActiveRecord::Base
  has_many :cart_items
  mount_uploader :picture, PictureUploader

  def price
  end

  def price_in_dollars
    price / 100.0
  end

  def price=(dollars)
    self.price = dollars * 100
  end
  
end
