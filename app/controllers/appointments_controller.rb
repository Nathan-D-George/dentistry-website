class AppointmentsController < ApplicationController
  $temp_app = nil
  def list
    clean_up_protocol
    create_new_day

    @appointments = Appointment.all
    @admin = User.first
    hashOfDates  = {}
    @arrayOfDates = []
    @arrayOfDays  = []
    @appointments.each {|ap|
      date = ap.start.to_date
      hashOfDates[date] = 1, @arrayOfDates.append(date) if hashOfDates[date].nil?
    }

    @arrayOfDates.sort.each {|arr|
      thisDay = []
      @group = Appointment.where("start like ?", "%#{arr}%").all
      @group.each {|g| thisDay.append(g)}
      @arrayOfDays.append(thisDay)
    }
    
  end

  def new
    @appointment = Appointment.new
    @appointment.start = params[:start].to_datetime
    @appointment.end   = params[:start].to_datetime + 30.minutes
    $temp_app = @appointment
    @users = User.all
  end

  def create
    @appointment = Appointment.where(start: $temp_app.start).first
    @appointment.user  = current_user
    t = params[:appointment][:app_type]
    t == 'Cleaning' ? @appointment.app_type = 0 : t == 'Root_Canal' ? @appointment.app_type = 1 : t == 'Extraction' ? @appointment.app_type = 2 :  @appointment.app_type = 3
    t == 'Cleaning' ? @appointment.cost = 300 : t == 'Root_Canal' ? @appointment.cost = 350 : t == 'Extraction' ? @appointment.cost = 150 :  @appointment.cost = 900
    @appointment.save
    redirect_to list_of_apps_path
  end

  def destroy
  end

  private
  def create_new_day
    dt  = Appointment.last.start.to_date+1
    if dt < Date.today+14
      dt += 1 while dt.on_weekend?
      dt += 8.hours
      for i in 0..17
        @appointment = Appointment.new
        @appointment.start = dt
        @appointment.end   = dt + 29.minutes + 59.seconds
        @appointment.user  = User.first
        @appointment.save
        dt += 30.minutes
      end
    end
  end

  def clean_up_protocol
    @appointments = Appointment.all
    hashOfDates  = {}
    @arrayOfDates = []
    @appointments.each {|ap|
      date = ap.start.to_date
      hashOfDates[date] = 1, @arrayOfDates.append(date) if hashOfDates[date].nil?
    }
    @arrayOfDates.sort.each {|arr|
      if arr < Date.today-1
        @group = Appointment.where("start like ?", "%#{arr}%").all
        @group.each {|g| g.delete}
      end
    }
  end
end
