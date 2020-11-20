class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, only: :id, include: [:bird, :location]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, only: :id, include: [:bird, :location]
            # {
            #     id: sighting.id,
            #     bird: sighting.bird,
            #     location: sighting.location
            # }
        else
            render json: { message: 'No sighting found with that id' }
        end
    end

end
