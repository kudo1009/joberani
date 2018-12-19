class AddPeriodToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :period, :string
  end
end
