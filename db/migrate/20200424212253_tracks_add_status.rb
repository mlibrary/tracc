class TracksAddStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column :tracks, :status,  :string
  	add_column :tracks, :disp_order,  :integer
  	add_column :tracks, :rationale,  :string 	
  end
end
