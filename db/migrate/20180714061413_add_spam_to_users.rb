class AddSpamToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :spam, :boolean
    add_column :posts, :spam, :boolean
  end
end
