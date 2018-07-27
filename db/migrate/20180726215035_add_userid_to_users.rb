class AddUseridToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :username, :string
  end
end
