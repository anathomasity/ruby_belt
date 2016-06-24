class SongsController < ApplicationController

  def index
  	@songs = Song.all
  end

  def create
  	song = Song.new(song_params)
		if song.save
			flash[:song] = 'Successfully added, thanks!'
			redirect_to '/songs'
		else
			flash[:errors] = song.errors.full_messages
			redirect_to '/songs'
		end
  end

  def show
  	@song = Song.find(params[:id])
  	@users = @song.users
  end

  def create_add
  	add = Add.where(add_params).first
  	if add
  		added = Add.increment_counter(:times_added, add)
  	else
  		add = Add.create(add_params)
  		added = Add.increment_counter(:times_added, add)
  	end
  	redirect_to '/songs'
  end

  private
	def song_params
		params.require(:song).permit(:artist, :title)
	end
	def add_params
		params.require(:song).permit(:user_id, :song_id)
	end
end
