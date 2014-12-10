class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = Appointment.all
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
    @appointments = Appointment

    @appointments = @appointments.where(date: params["date"]) if params["date"]
    @appointments = @appointments.where(hour: params["time"]) if params["time"]
    @appointments = @appointments.where(place: params["place"]) if params["place"]

    redirect_to appointments_path, :flash => { :alert => "#{err}, please try again" }
  end
end
