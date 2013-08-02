class AddDefaultPrioridad < ActiveRecord::Migration
  def change
  	change_column :properties, :prioridad, :integer, :default => 1
  end
end
