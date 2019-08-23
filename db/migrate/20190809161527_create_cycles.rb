class CreateCycles < ActiveRecord::Migration[5.2]
  def change
    create_table :cycles do |t|
      t.string :cycle_name
      t.string :description
      t.date :start
      t.date :end
      t.boolean :current_cycle
      t.timestamps
    end
  end
end
