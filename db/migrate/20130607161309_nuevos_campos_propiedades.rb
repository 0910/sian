class NuevosCamposPropiedades < ActiveRecord::Migration
  def change
  	add_column :properties, :toilette, :string
  	add_column :properties, :ubicacion_en_planta, :string
  	add_column :properties, :estado, :string
  	add_column :properties, :luminosidad, :string
  	add_column :properties, :categoria, :string
  	add_column :properties, :pisos, :integer
  	add_column :properties, :ambientes, :text
  	add_column :properties,:agua_caliente, :string
  	add_column :properties,:calefaccion, :string
  	add_column :properties,:aire_acondicionado, :string
  	add_column :properties, :puntos_interes, :text
  end
end
