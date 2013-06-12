class AgregamosCodigoPropiedades < ActiveRecord::Migration
  def change
  	add_column :properties, :code, :string
  end
end
