require 'open-uri'

class ArrivalsController < ApplicationController
  def index
    source = 'http://localhost:3000/api/v1/arrivals/'
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    @arrivals = JSON.parse(data)
  end

  def show
  end
end
