#encoding: utf-8
ActiveAdmin.register Property do
  filter :name
  filter :address
  filter :type_of_property
  filter :created_at

  index do
    column :name
    column :address
    column :type_of_operation, :label => 'Tipo de operación'
    default_actions
  end
  
  show do |product|
    attributes_table_with_images do
      row :name
      row :type_of_property
      row :type_of_operation
      row :price
      row :covered_square_meters
      row :uncovered_square_meters
      row :rooms
      row :bathrooms
      row :amenities do |property|
        property.amenities.split("\n").join("<br/>").html_safe
      end
      row :keywords
    end
  end
  
  form_with_images do |f|
    f.input :name, hint: "El nombre debe ser único para cada propiedad, y puede ser algo como: <strong>Lujoso departamento cerca de Plaza Serrano</strong>".html_safe
    f.input :type_of_property, :label => "Tipo de propiedad", :as => :select, :collection => ["Luxury Properties", "Urban Properties", "Commercial Properties", "Developments", "Campos & Counrty Clubs"]
    f.input :country, :label => "País", :as => :select, :collection => ["Argentina", "Uruguay", "USA"]
    f.input :location, :label => "Ubicación", :as => :select, :collection => ["CABA", "Zona Norte", "Gran Buenos Aires", "Interior del País", "Punta del Este", "Montevideo", "Miami", "New York", "Otras" ]
    f.input :type_of_operation, :label => "Tipo de operación", :as => :select, :collection => ["Todos", "Venta", "Alquiler", "Desarrollos"]
    f.input :address, hint: "La dirección real de la propiedad, en base a esta dirección se mostrará el mapa de la misma, debe contener la calle, la altura, el barrio y la ciudad, por ejemplo:</br>Pringles 1395, Palermo, Buenos Aires, Argentina.".html_safe
    f.input :public_address, hint: "La dirección pública de esta propiedad, será mostrada directamente a los visitantes del sitio, no necesita ser exacta y puede incluir el piso y departamento:<br/>Pringles y Cabrera 4to 17, Palermo".html_safe
    f.input :price, :label => "Precio"
    
    f.inputs :name => "Características generales" do
      f.input :covered_square_meters
      f.input :uncovered_square_meters
      f.input :rooms
      f.input :bathrooms
      f.input :toilette
      f.input :ubicacion_en_planta
      f.input :estado
      f.input :luminosidad
    end

    f.inputs :name => "Características del edificio" do
      f.input :categoria
      f.input :pisos
    end
    f.input :ambientes,:input_html => {:rows => 10}, hint: "Los ambientes son ...ver texto, se escriben de a uno por renglón. Se pueden usar dos puntos (:) para agrupar ambientes o simplemnete dejar el nombre solo el en renglón, por ejemplo:<br/>Gimnasio<br/>Lavadero<br/>Cocina: 3x5".html_safe
    f.input :ambientes_en, :label => 'Ambientes en ingles', :input_html => {:rows => 10}
    f.inputs :name => "Servicios" do
      f.input :agua_caliente
      f.input :calefaccion
      f.input :aire_acondicionado
    end
    f.input :puntos_interes,:input_html => {:rows => 5}
    f.input :puntos_interes_en, :label => 'Puntos de interes en Ingles', :input_html => {:rows => 5}
    f.input :description, :input_html => {:rows => 5}
    f.input :property_description_en, :label => 'Descripción en Ingles', :input_html => {:rows => 5}
    f.input :amenities, :input_html => {:rows => 10}, hint: "Los aménities son características específicas de la propiedad y su zona, se escriben de a uno por renglón. Se pueden usar dos puntos (:) para agrupar aménities o simplemnete dejar el nombre solo el en renglón, por ejemplo:<br/>Gimnasio<br/>Lavadero<br/>Colectivos: 15, 110, 128<br/>Plazas: Armenia, Costa Rica".html_safe
    f.input :property_amenities_en, :label => 'Amenities en Ingles', :input_html => {:rows => 10}
    f.input :keywords, hint: 'Las palábras clave son útiles al momento de buscar propiedades, pero pueden dejarse vácias. Un ejemplo de palabras clave: Departamento, Loft, Belgrano, Tigre'
    f.input :property_keywords_en, :label => 'Palabras clave en ingles'
    f.input :code
  end
end                               
