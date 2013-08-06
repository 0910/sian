class ChangeNewletterName < ActiveRecord::Migration
  def change
  	rename_table :newsletter, :newsletters
  end
end
