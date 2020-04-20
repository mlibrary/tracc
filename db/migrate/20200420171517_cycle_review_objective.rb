class CycleReviewObjective < ActiveRecord::Migration[5.2]
  def change
  	change_column :cycle_reviews, :notes,  :text
  	add_column :cycle_reviews, :obj_id,  :integer	
  end
end
