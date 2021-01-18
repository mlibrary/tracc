class AddCycleToChips < ActiveRecord::Migration[5.2]
  def change
    add_column :chips, :cycle, :string
  end
end
