class DropTableNeighborhoods < ActiveRecord::Migration
  def change
  	drop_table :neighborhoods
  end
end
