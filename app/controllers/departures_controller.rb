require 'open-uri'

class DeparturesController < ApplicationController
  def index
   source = 'https://infinite-woodland-15476.herokuapp.com/api/v1/arrivals'
   resp = Net::HTTP.get_response(URI.parse(source))
   data = resp.body
   @departures = JSON.parse(data)
  end

  def show

  end
end
