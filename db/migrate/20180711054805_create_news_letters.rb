class CreateNewsLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :news_letters do |t|
      t.text :description
      t.boolean :visible

      t.timestamps
    end
  end
end
