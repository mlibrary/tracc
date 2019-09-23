class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.belongs_to :card, index: true
      t.integer :card_id	
      t.string :assessment_type	
      t.string :cycle
      t.string :q1
      t.string :q2
      t.string :q3
      t.string :q4
      t.string :q5
      t.string :q6
      t.string :q7
      t.string :q8
      t.string :user_email
      t.timestamps
    end
  end
end
