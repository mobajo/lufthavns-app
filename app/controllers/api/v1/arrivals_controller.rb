class Api::V1::ArrivalsController < ApplicationController

  def index
    render json: Arrival.all
  end

  def show
    render json: arrivals
  end

  def create
    render json: Arrival.create(departures_params)
  end

  # def update
  #   render json: arrivals.update(departures_params)
  # end

  # def destroy
  #   render json: arrivals.destroy
  # end


  private

  def arrivals
    Arrival.find(params[:id])
  end

  def departures_params
    params.require(:arrivals).permit(:id, :time, :city, :airport, :airline, :plane)
  end
end  