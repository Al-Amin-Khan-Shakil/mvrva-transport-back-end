class AddDefaultRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :role, :string, default: 'user'
  end
end
