class CreateStatus < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :status_id
      t.string :status
      t.string :cycle
      t.datetime :recorded_on,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
