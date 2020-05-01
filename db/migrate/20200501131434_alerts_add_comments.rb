class AlertsAddComments < ActiveRecord::Migration[5.2]
  def change
  	add_column :alerts, :comments,  :text
  end
end
