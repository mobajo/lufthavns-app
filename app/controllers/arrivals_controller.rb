require 'open-uri'

class ArrivalsController < ApplicationController
  def index
    source = 'https://infinite-woodland-15476.herokuapp.com/api/v1/arrivals'
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    @arrivals = JSON.parse(data)
  end

  def show
  end
end
