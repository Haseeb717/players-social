class AddReadToTagUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :tag_users, :read, :boolean,:default=>false
  end
end
