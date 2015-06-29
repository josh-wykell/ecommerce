class AddPermalinkToProducts < ActiveRecord::Migration
  def change
    add_column :products, :permalink, :string
    change_column :products, :price, :integer
  end
end
