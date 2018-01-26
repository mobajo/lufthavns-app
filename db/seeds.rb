# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'

puts "Getting data"
puts
puts "Fetching departures..."

html_departure = open('https://www.cph.dk/flyinformation/afgange/')
doc = Nokogiri::HTML(html_departure)

departures = doc.css('.stylish-table__row--body')

# For at forhindre duplikeret data
departures.each do |flight|
  time = flight.css('.flights__table__col--time>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }
  destination = flight.css('.flights__table__col--destination>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }
  terminal = flight.css('.flights__table__col--terminal>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }
  gate = flight.css('.flights__table__col--gate>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }

  departure = Departure.find_or_initialize_by(plane: destination[3])
  departure.time = time[0]
  departure.city = destination[0]
  departure.airport = destination[1]
  departure.airline = destination[2]
  departure.terminal = terminal[0]
  departure.gate = gate[0]
  departure.save!
end

puts Departure.all

puts
puts "Departures fetched!"
puts
puts "Fetching arrivals..."
puts

html_arrivals = open('https://www.cph.dk/flyinformation/ankomster/')
doc = Nokogiri::HTML(html_arrivals)

arrivals = doc.css('.stylish-table__row--body')

# For at forhindre duplikeret data
arrivals.each do |flight|
  time = flight.css('.flights__table__col--time>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }
  destination = flight.css('.flights__table__col--destination>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }
  terminal = flight.css('.flights__table__col--terminal>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }
  gate = flight.css('.flights__table__col--gate>div>span').text.strip.gsub(/\r|\t|\n/, "  ").split("  ").reject { |str| str.empty? }

  arrival = Arrival.find_or_initialize_by(plane: destination[3])
  arrival.time = time[0]
  arrival.city = destination[0]
  arrival.airport = destination[1]
  arrival.airline = destination[2]
  arrival.save!
end

puts Arrival.all

puts
puts "Arrivals fetched!"
puts
puts "Seed complete!"