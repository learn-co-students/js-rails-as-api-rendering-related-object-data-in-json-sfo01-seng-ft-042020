class SightingsController < ApplicationController
  def index 
    sightings = Sighting.all 
    render json: sightings, include: [:bird, :location], except: [:updated_at, :created_at]
  end
  
  def show 
    sighting = Sighting.find(params[:id])
    if sighting
      render json: sighting, :include => {
        :bird => {
          :only => [:name, :species]
        },
        :location => {
          :only => [:longitude, :latitude]
        }
      }, :except => [:updated_at, :created_at]
    else 
      render json: {message: 'no sighting found with that id'}
    end
  end

end
