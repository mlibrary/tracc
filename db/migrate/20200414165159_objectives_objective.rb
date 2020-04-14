class ObjectivesObjective < ActiveRecord::Migration[5.2]
  def change
  	change_column :objectives, :objective,  :text
  end
end
