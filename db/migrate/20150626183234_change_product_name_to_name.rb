class ChangeProductNameToName < ActiveRecord::Migration
  def change
    rename_column :products, :product_name, :name
  end
end
