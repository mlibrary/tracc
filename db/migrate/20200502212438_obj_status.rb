class ObjStatus < ActiveRecord::Migration[5.2]
  def change
  	add_column :objectives, :status1,  :integer
	add_column :objectives, :status2,  :integer
  	add_column :objectives, :status3,  :integer
  	add_column :objectives, :status4,  :integer
  end
end
