class AddUserInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_info, :string
  end
end
