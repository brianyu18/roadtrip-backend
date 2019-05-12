class TripsController < ApplicationController
  # GET /trips
  def index
    @trips = current_user.trips

    render json: {result:'success', data: @trips}
  end

  # GET /trips/1
  def show
    render json: @trip
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      @trip_user = TripUser.create(user_id: current_user.id, trip_id: @trip.id)
      render json: {trip: @trip, tripuser: @trip_user}, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    set_trip
    @trip.destroy
  end

  #GET /trips and /users
  def group
    @trips = Trip.find(current_trip).trip_users
    render json: {result:'success', data: @trips}
  end


  def friend
    trip = current_trip
    # byebug
    friends = trip.users
    render json: {result:'success', data: friends}
  end

  private

    def current_trip
      @destination = Trip.find(params[:trip_id])
      return @destination
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:destination)
    end
end
