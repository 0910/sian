class CambiosEnCamposPropiedades < ActiveRecord::Migration
  def change
  	add_column :properties, :type_of_property, :string
  	add_column :properties, :country, :string
  	add_column :properties, :type_of_operation, :string
  end
end
