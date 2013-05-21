#encoding: utf-8
ActiveAdmin.register Neighborhood do
  index do
    column :name
    default_actions
  end
  
  show do |product|
    attributes_table_with_images do
      row :name
      row :url_name
      row :description
      row :amenities
    end
  end
  
  form_with_images do |f|
    f.input :name
    f.input :url_name
    f.input :description, hint: "La descripción del barrio debería hablar acerca del mismo en lineas generales y acerca del hábitat (es una zona comercial? es un lugar tranquilo? un barrio exclusivo?).<br/>Para enumerar datos específicos puede usar el campo 'Amenities' de más abajo.".html_safe
    f.input :amenities, hint: "Los aménities son características específicas del barrio, se escriben de a uno por renglón. Se pueden usar dos puntos (:) para agrupar aménities o simplemnete dejar el nombre solo el en renglón, por ejemplo:<br/>Museos: Malba, Arquitectura</br>Colectivos: 15, 110, 128<br/>Plazas: Armenia, Costa Rica".html_safe
  end
end                                   
