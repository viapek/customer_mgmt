class AppointmentsController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  before_action :getCustomer

  def index
    if !params[:customer_id].blank?
      @appointments = Appointment.byCustomer(params[:customer_id])
    else
      @appointments = Appointment.sorted
    end
    @teaching_total = 0
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @customers = Customer.sorted
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
       flash[:notice] = @appointment.customer.name + "'s appointment on " + Date::DAYNAMES[@appointment.day] + ", " + @appointment.start_time.strftime('%H:%M') + "-" + @appointment.finish_time.strftime('%H:%M') + " has updated successfully"
       redirect_to(:controller => 'customers', :action => 'show', :id => @appointment.customer_id) 
    else
       render('new')
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    
    if @appointment.update_attributes(appointment_params)
       flash[:notice] = @appointment.customer.name + "'s appointment on " + Date::DAYNAMES[@appointment.day] + ", " + @appointment.start_time.strftime('%H:%M') + "-" + @appointment.finish_time.strftime('%H:%M') + " has been updated successfully"
       redirect_to(:controller => 'customers', :action => 'show', :id => @appointment.customer_id)
    else
       render('edit')
    end
  end

  def delete
    @appointment = Appointment.find(params[:id])
  end

  def destroy
    appointment = Appointment.find(params[:id]).destroy
    @customer = Customer.find(appointment.customer_id)
    flash[:notice] = @customer.name + "'s " + Date::DAYNAMES[appointment.day] + " appointment has been destroyed."
    redirect_to(:action => 'index', :customer_id => @customer.id)

  end
  
 private
  def appointment_params
    params.require(:appointment).permit(:customer_id, :day, :start_time, :finish_time, :location)
  end


end
