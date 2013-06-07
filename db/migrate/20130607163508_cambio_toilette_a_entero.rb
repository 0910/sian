class CambioToiletteAEntero < ActiveRecord::Migration
  def change
  	change_column :properties, :toilette, :integer
  end
end
