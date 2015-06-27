class ShoppingCart < ActiveRecord::Base
  acts_as_shopping_cart

  def tax_pct
    7.00
  end

end
