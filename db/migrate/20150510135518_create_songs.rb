class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :type
      t.string :singer
      t.string :img

      t.timestamps
    end
  end
end
