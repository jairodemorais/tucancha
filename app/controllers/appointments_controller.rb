class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    puts "XXXXXXXXXXXXXXXXX"
    puts params.inspect
    puts "XXXXXXXXXXXXXXXXX"
    @place = params["place"]
    @date = params["date"]
    @free_hours = params["free_hours"]
    render :layout => true
  end

  def new
    @appointment = Appointment.create
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search
    num = 7
    @hours = []
    while num < 24 do
      @hours << num
      num += 1
    end
    @hours.freeze

    @appointments = Appointment

    @appointments = @appointments.where(date: params["date"]) if params["date"]
    @appointments = @appointments.where(hour: params["time"]) if params["time"]
    @appointments = @appointments.where(place: params["place"]) if params["place"]

    busy_hours = @appointments.map { |a| a.hour }

    redirect_to appointments_path(free_hours: @hours - busy_hours, date: params["date"], place: params["place"])
  end
end
