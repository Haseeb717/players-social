class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :post, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
