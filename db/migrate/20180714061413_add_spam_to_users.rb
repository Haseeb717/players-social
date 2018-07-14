class AddSpamToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :spam, :boolean,:default=>false
    add_column :posts, :spam, :boolean,:default=>false
  end
end
