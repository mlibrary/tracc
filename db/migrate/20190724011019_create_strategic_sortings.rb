class CreateStrategicSortings < ActiveRecord::Migration[5.2]
  def change
    create_table :strategic_sortings do |t|
      t.belongs_to :card, index: true
      t.integer :card_id	
      t.string :domain
      t.string :enthusiasm
      t.string :knowledge
      t.string :resource   
      t.string :comments 	
      t.datetime :recorded_on ,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
