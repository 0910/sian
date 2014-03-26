class AddPdfs < ActiveRecord::Migration
  def change
  	create_table :documents do |t|
    	t.references :property
    	t.has_attached_file :file
		t.timestamps
    end
  end
end
