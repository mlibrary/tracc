class CardsShortDescription < ActiveRecord::Migration[5.2]
  def change
  		change_column :cards, :short_description,  :text
  end

end
