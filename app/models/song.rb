class Song < ActiveRecord::Base
   mount_uploader :img, SongsUploader
   belongs_to :music
end
