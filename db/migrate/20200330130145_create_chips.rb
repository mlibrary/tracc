class CreateChips < ActiveRecord::Migration[5.2]
  def change
    create_table :chips do |t|
      t.string :fname
      t.string :lname
      t.string :uniqname
      t.integer :project
      t.integer :project_dev
      t.integer :project_mgr
      t.integer :project_design
      t.integer :project_support
      t.integer :project_data
      t.integer :ops
      t.integer :ops_dev
      t.integer :ops_mgr
      t.integer :project_ops
      t.integer :project_ops
      t.integer :project_ops
      t.string  :dept
      t.timestamps
    end
  end
end
