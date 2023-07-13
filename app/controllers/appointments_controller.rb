class AppointmentsController < ApplicationController
  $temp_app = nil
  def list
    @appointments = Appointment.all
    @admin = User.first
    hashOfDates  = {}
    @arrayOfDates = []
    @arrayOfDays  = []
    @appointments.each {|ap|
      date = ap.start.to_date
      hashOfDates[date] = 1, @arrayOfDates.append(date) if hashOfDates[date].nil?
    }
    @arrayOfDates.each {|arr|
      thisDay = []
      @group = Appointment.where("start like ?", "%#{arr}%").all
      @group.each {|g| thisDay.append(g)}
      @arrayOfDays.append(thisDay)
    }
    #debugger
    
  end

=begin
 arrayofAppointments.each {|ap|
   date = arrayOfAppointments.start.to_date
   hash[date] = 1, arrayOfDates.append(date) if h[date].nil?
 }
=end

  def new
    #create_many
    @appointment = Appointment.new
    @appointment.start = params[:start].to_datetime
    @appointment.end   = params[:start].to_datetime + 30.minutes
    $temp_app = @appointment
    @users = User.all
  end

  def create
    @appointment = Appointment.where(start: $temp_app.start).first
    # @appointment.start = params[:start]
    # @appointment.end   = params[:end]
    @appointment.user  = current_user
    @appointment.app_type = params[:appointment][:app_type]
    t = params[:appointment][:app_type]
    t == 'Cleaning' ? @appointment.cost = 300 : t == 'Root_Canal' ? @appointment.cost = 350 : t == 'Extraction' ? @appointment.cost = 150 :  @appointment.cost = 900
    @appointment.save
    redirect_to list_of_apps_path
  end

  def destroy
  end

  private
  # def create_many
  #   dt = DateTime.new(2023,2,14,8,0,0)
  #   for i in 0..9
  #     @appointment = Appointment.new
  #     @appointment.start = dt
  #     @appointment.end   = dt + 29.minutes + 59.seconds
  #     @appointment.user  = User.first
  #     @appointment.save
  #     dt += 30.minutes
  #   end
  # end
end
