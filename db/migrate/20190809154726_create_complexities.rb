class CreateComplexities < ActiveRecord::Migration[5.2]
  def change
    create_table :complexities do |t|
      t.belongs_to :card, index: true
      t.integer :card_id
      t.string :status
      t.string :comments
      t.datetime :recorded_on,  default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps  
    end
  end
end
