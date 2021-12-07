class AddCheckboxColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :checkbox, :boolean
  end
end
