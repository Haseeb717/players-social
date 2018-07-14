class AddAnotherUserId < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :another_user_id,:integer
  end
end
