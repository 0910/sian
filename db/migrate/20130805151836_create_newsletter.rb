class CreateNewsletter < ActiveRecord::Migration
  def change
  	create_table :newsletter do |t|
  		t.string :name, :null => false
  		t.string :apellido
  		t.string :email, :null => false
  		t.timestamps
  	end
  end
end
