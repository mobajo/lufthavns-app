class ArrivalsSerializer < ActiveModel::Serializer  
  attributes :id, :time, :city, :airport, :airline, :plane
end