class AddPrioridadAndEstadoPropiedad < ActiveRecord::Migration
  def change
  	add_column :properties, :prioridad, :integer
  end
end
