class CreateDependency < ActiveRecord::Migration[5.2]
  def change
    create_table :dependencies do |t|
    	t.integer :card_id
    	t.integer :dependent_on 
    	t.datetime :recorded_on,  default: -> { 'CURRENT_TIMESTAMP' }
        t.timestamps
    end
  end
end
