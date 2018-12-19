class AddEpisodeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :episode, :string
  end
end
