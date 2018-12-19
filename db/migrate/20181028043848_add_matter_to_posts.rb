class AddMatterToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :matter, :string
  end
end
