class FlightsController < ApplicationController
    def index
        @flight_dates ||= Flight.all.order(:departure_date).distinct.pluck(:departure_date).map! {|date| [date.strftime("%B %d %Y"), date] }
        @airports = Airport.all.map{ |f| [f.city.to_s + ", " + f.state + " - " + f.code.to_s, f.id] }

        if params[:flight_data]
            @matching_flights = Flight.where(
                                                                        departure_date:           search_params[:departure_date], 
                                                                        departure_airport_id:  search_params[:departure_airport_id],
                                                                        arrival_airport_id:         search_params[:arrival_airport_id] 
                                                                        )
        end
        byebug
    end

    def show
    end

    def search_params
        params.require(:flight_data).permit(:departure_airport_id, :arrival_airport_id, :departure_date)
    end
end