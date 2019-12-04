class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
    	 t.integer :card_id
    	 t.string :resources
    	 t.datetime :recorded_on,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
