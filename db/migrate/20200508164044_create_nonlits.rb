class CreateNonlits < ActiveRecord::Migration[5.2]
  def change
    create_table :nonlits do |t|
      t.string :fname
      t.string :lname
      t.string  :dept
      t.timestamps
    end
  end
end
