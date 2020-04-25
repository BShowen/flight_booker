# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


require 'faker'
require_relative 'airport_data'
include AirportData

Airport.destroy_all

#convert string into array of hash data
def format_airport_data(str)
    formatted_airports = str.gsub(",","").split("\n").map do |ap| 
    airport_data = ap.split(" ")
    hsh = Hash.new
    hsh[:city] = airport_data[0]
    hsh[:state] = airport_data[1]
    hsh[:country] = airport_data[2]
    hsh[:code] = airport_data[3]
    hsh
    end
end

#create airports
def create_airport_objects(arr, number_of_airports: nil)
    arr.sample(number_of_airports).each do |hash_details|
        Airport.create hash_details
    end
end

#create flights
def create_flight_objects(number_of_flights: nil)
    @airport_objs = Airport.all
    number_of_flights.times do
        Flight.create(departure_date:"#{Faker::Date.between(from: Date.today, to: 1.month.from_now)}", duration: rand(3..7), flight_number: rand(2500..3500), departure_airport: @airport_objs[0], arrival_airport: @airport_objs[1])
        end
end


airport_data = format_airport_data(AirportData::airports)
create_airport_objects(airport_data, number_of_airports: 2)
create_flight_objects number_of_flights: 1000 