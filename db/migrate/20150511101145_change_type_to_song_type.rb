class ChangeTypeToSongType < ActiveRecord::Migration
  def change
    rename_column :songs , :type , :song_type
  end
end
