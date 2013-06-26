class AddFieldsEnglish < ActiveRecord::Migration
  def change
  	add_column :properties, :ambientes_en, :text
  	add_column :properties, :puntos_interes_en, :text
  	add_column :properties, :property_description_en, :text
  	add_column :properties, :property_amenities_en, :text
  	add_column :properties, :property_keywords_en, :string

  end
end
