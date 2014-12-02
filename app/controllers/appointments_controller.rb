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


  def create
    puts ""
    @appointment = Appointment.create(date: params["date"], hour: params["time"], place: params["place"])
    if @appointment.save
      redirect_to new_appointment_path
    else
      err = ''
      @appointment.errors.full_messages.each do |m|
        err << m
      end
    end

    redirect_to new_appointment_path, :flash => { :alert => "#{err}, please try again" }
  end
end
