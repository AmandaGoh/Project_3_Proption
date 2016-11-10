class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :contact_number, :integer
  end
end
