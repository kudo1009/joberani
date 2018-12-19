class AddTownUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :town, :string
  end
end
