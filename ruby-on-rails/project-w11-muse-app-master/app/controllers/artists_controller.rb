class ArtistsController < ApplicationController
    def index
        @artists = Artist.all.order('name')
    end

    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs 
    end

    def new
        @artist = Artist.new
    end

    def create
        Artist.create(person_params)
        redirect_to artists_path
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        artist = Artist.find(params[:id])
        artist.update(person_params)

        redirect_to artist
    end

    def destroy
        Artist.find(params[:id]).destroy
        redirect_to artists_path
    end

    private
        def person_params
            params.require(:artist).permit(:name, :albums, :hometown, :img)
        end
end
