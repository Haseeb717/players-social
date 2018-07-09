class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.text :about
      t.attachment :image

      t.timestamps
    end
  end
end
