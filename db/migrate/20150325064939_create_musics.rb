class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :song_name
      t.string :type
      t.string :singer

      t.timestamps
    end
  end
end
