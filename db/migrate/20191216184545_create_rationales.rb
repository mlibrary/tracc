class CreateRationales < ActiveRecord::Migration[5.2]
  def change
    create_table :rationales do |t|
      t.integer :rationale_id
      t.string :rationale
      t.datetime :recorded_on,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
