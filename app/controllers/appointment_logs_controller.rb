class AppointmentLogsController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  before_action :getCustomer

  def index
    if !params[:customer_id].blank?
      @appointment_logs = AppointmentLog.byCustomer(params[:customer_id])
    else
      @appointment_logs = AppointmentLog.sorted
    end
  end

  def show
    @appointment_log = AppointmentLog.find(params[:id])
  end

  def new
    @appointment_log = AppointmentLog.new
  end

  def create
    @appointment_log = AppointmentLog.new(appointment_log_params)
    
    if @appointment_log.save
       flash[:notice] = @appointment_log.customer.name + "'s class (" + @appointment_log.date.strftime('%d %B') + ") has created successfully"
       redirect_to(:controller => 'customers', :action => 'show', :id => @appointment_log.customer_id) 
    else
       render('new')
    end
  end


  def edit
    @appointment_log = AppointmentLog.find(params[:id])
  end

  def update
    @appointment_log = AppointmentLog.find(params[:id])
    
    if @appointment_log.update_attributes(appointment_log_params)
       flash[:notice] = @appointment_log.customer.name + "'s class log (" + @appointment_log.date.strftime('%d %B') + ") has been updated successfully"
       redirect_to(:action => 'show', :customer_id => @appointment_log.customer_id, :id => @appointment_log.id)
    else
       render('edit')
    end

  end

  def delete
    @appointment_log = AppointmentLog.find(params[:id])
  end
  
  def destroy
    appointment_log = AppointmentLog.find(params[:id]).destroy
    @customer = Customer.find(appointment_log.customer_id)
    flash[:notice] = @customer.name + "'s class (" + appointment_log.date.strftime('%d %B') + ") has been destroyed."
    redirect_to(:action => 'index', :customer_id => @customer.id)
    
  end
  
private
  def appointment_log_params
    params.require(:appointment_log).permit(:customer_id, :chargeable, :notes, :date)
  end

end
