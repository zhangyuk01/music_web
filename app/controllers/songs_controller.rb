class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  def index
    @songs = Song.all
  end

  # GET /songs/1
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end


  # POST /songs
  def create
    @song = Song.new(song_params)
    puts "=======new ok ===="
    @song.save

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      redirect_to @song, notice: 'Song was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /songs/1
  def destroy
    @song.destroy
    redirect_to songs_url, notice: 'Song was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def song_params
      params.require(:song).permit(
        :name, :song_type, :singer, :img)
    end
end
