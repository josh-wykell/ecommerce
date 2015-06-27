class Product < ActiveRecord::Base
  include Payola::Sellable

  mount_uploader :picture, PictureUploader

  include PgSearch
  pg_search_scope :search_products,
                  against: :name,
                  :using => {
                    :tsearch => {:dictionary => "english",
                                 :prefix => true
                    }
                  }
 


  def price_in_dollars
    price / 100.0
  end

  def price=(dollars)
    self.price = dollars * 100
  end 
  
end
