class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :sender_id
      t.string :reciever_id

      t.timestamps
    end
  end
end
