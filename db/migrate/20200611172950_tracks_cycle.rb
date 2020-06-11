class TracksCycle < ActiveRecord::Migration[5.2]
  def change
  	add_column :tracks, :cycle,   :string	
  end
end
