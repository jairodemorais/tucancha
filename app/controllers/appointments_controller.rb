class AppointmentsController < ApplicationController

  def index
    date_from_ajax = params[:matched_date]
    reduce = Appointment.where(:date => date_from_ajax)
    hour_on_date = reduce.collect {|x| x.hour}
    @new_dates = hour_on_date
    @appointment = Appointment.new
    render :layout => true
  end

  def new
    @appointments = Appointment.create
    respond_to do |format|
      format.html
      format.js
    end
  end


  def create
    @appointment = Appointment.create(appointments_params)
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

  private
  def appointments_params
    params.require(:appointment).permit(:date, :hour, :done)
  end
end
