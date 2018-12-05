class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false, unique: true
      t.string :artist
      t.string :album
      t.integer :year

      t.timestamps
    end
  end
end
