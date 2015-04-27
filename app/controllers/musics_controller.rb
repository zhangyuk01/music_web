class MusicsController < ApplicationController
 #the action
 def index
  @musics=Music.all
 end

 def show
 end

 def edit
 end


 def new
   @music=Music.new
 end

 def create
   @music=Music.new
   @music.save
 end

 def update
 end

 def destroy
 end

end
