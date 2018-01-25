class Api::V1::DeparturesController < ApplicationController

  def index
    render json: Departure.all
  end

  def show
    render json: departures
  end

  def create
    render json: Departure.create(departures_params)
  end

  # def update
  #   render json: departures.update(departures_params)
  # end

  # def destroy
  #   render json: departures.destroy
  # end


  private

  def departures
    Departure.find(params[:id])
  end

  def departures_params
    params.require(:departures).permit(:id, :time, :city, :airport, :airline, :plane, :terminal, :gate)
  end
end  