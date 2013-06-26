class AddPriceProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :price, :integer
  end
end
