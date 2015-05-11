class Song < ActiveRecord::Base
   mount_uploader :img, SongsUploader
end
