class AddSomeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :region, :string
    add_column :users, :prof, :text
  end
end
