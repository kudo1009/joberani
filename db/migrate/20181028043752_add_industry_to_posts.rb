class AddIndustryToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :industry, :string
  end
end
