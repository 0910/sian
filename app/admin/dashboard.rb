#encoding: utf-8
ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div "Este es el panel de administración de Sian, use el menú superior para:"
    ul do
      li 'Administrar nuevos barrios'
      li 'Administrar nuevas propiedades'
      li 'Elegir quienes pueden acceder a este panel de administración'
    end
  end # content
end
