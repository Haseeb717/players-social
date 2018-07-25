class CreateTagUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_users do |t|
      t.string :tag_id
      t.string :tag_type
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
