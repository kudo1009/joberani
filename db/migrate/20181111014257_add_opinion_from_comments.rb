class AddOpinionFromComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :opinion, :text
  end
end
