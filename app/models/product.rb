class Product < ActiveRecord::Base
  include Payola::Sellable
end
