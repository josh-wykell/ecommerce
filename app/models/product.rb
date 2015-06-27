class Product < ActiveRecord::Base
  include Payola::Sellable
  acts_as_shopping_cart_item
  mount_uploader :picture, PictureUploader
  
  
end
