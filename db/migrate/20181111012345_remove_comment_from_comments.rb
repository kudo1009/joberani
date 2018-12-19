class RemoveCommentFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :comment, :string
  end
end
