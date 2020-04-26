class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.includes(:departure_airport, :arrival_airport).find_by(id: booking_params[:flight_id])
        num_of_passengers = booking_params[:passengers].to_i
        num_of_passengers > 0 ? num_of_passengers.times { @booking.passengers.build } : @booking.passengers.build
    end

    def create
        @flight = Flight.find_by(id: params_for_create[:flight][:id])
        @flight.bookings.build
        @booking = @flight.bookings.last
        params_for_create[:passengers_attributes].each_value do |passenger_info|
            @booking.passengers.build(passenger_info)
        end
        @flight.save
        redirect_to @booking
    end

    def show
        @booking = Booking.includes(:passengers, flight: [:departure_airport, :arrival_airport]).find_by(id: params_for_show[:id])
    end

    private
    def booking_params
        params.require(:booking).permit(:passengers, :flight_id)
    end

    def params_for_create
        params.require(:booking).permit(flight: [:id], passengers_attributes: [:name, :email])
    end

    def params_for_show
        params.permit(:id)
    end
end
