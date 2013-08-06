#encoding: utf-8
ActiveAdmin.register Newsletter do
  filter :name
  filter :email
  filter :created_at

  index do
    column :name
    column :email
    default_actions
  end
  
  show do |product|
    attributes_table_with_images do
      row :name
      row :apellido
      row :email
    end
  end
  
  form do |f|
    f.inputs "Newsletter" do
      f.input :name
      f.input :apellido
      f.input :email
    end
    f.actions 
  end
end                               
