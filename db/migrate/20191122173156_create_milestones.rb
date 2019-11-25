class CreateMilestones < ActiveRecord::Migration[5.2]
  def change
    create_table :milestones do |t|
      t.integer :card_id
      t.string :milestone
      t.string :cycle
      t.integer :status
      t.datetime :recorded_on,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end

