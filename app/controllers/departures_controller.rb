require 'open-uri'

class DeparturesController < ApplicationController
  def index
   source = 'http://localhost:3000/api/v1/departures/'
   resp = Net::HTTP.get_response(URI.parse(source))
   data = resp.body
   @departures = JSON.parse(data)
  end

  def show

  end
end
