class NonlitCycle < ActiveRecord::Migration[5.2]
  def change
  	add_column :nonlits, :cycle,   :string	
  	add_column :nonlits,:track_id, :integer
  	add_column :nonlits, :card_id,  :integer	
  end
end
