class AddPricesToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :sale_price, :decimal
    add_column :properties, :rent_price, :decimal
  end
end
