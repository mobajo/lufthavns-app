class DeparturesSerializer < ActiveModel::Serializer  
  attributes :id, :time, :city, :airport, :airline, :plane, :terminal, :gate
end