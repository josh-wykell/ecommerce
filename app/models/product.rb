class Product < ActiveRecord::Base
  include Payola::Sellable
  mount_uploader :picture, PictureUploader
end
