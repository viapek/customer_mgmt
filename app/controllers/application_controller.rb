class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def getCustomer
    if params[:customer_id].blank? || params[:customer_id] == 'true'
      @viewForAllCustomers = true
    else
      @viewForAllCustomers = false
      @customer = Customer.find(params[:customer_id])
    end
  end

  def dashboard
    redirect_to(:controller => 'customers', :action => 'index')   
  end


end
