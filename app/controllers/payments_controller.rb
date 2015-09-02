class PaymentsController < ApplicationController

  before_action :getCustomer

  def index
    if !params[:customer_id].blank?
      @payments = Payment.byCustomer(params[:customer_id])
    else
      @payments = Payment.sorted
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new
  end
  
  def create
    @payment = Payment.new(payment_params)
    
    if @payment.save
       flash[:notice] = @payment.customer.name + "'s payment of &#8361;" + @payment.amount.to_s + " has created successfully"
       redirect_to(:controller => 'customers', :action => 'show', :id => @payment.customer_id) 
    else
       render('new')
    end

  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(payment_params)
       flash[:notice] = @payment.customer.name + "'s payment has been updated successfully"
       redirect_to(:controller => 'customers', :action => 'show', :id => @payment.customer_id)
    else
       render('edit')
    end
  end
  
  def delete
    @payment = Payment.find(params[:id])
  end
  
  def destroy
    payment = Payment.find(params[:id]).destroy
    @customer = Customer.find(payment.customer_id)
    flash[:notice] = payment.customer.name + "'s payment has been destroyed successfully"
    redirect_to(:action => 'index', :customer_id => @customer.id)    
  end
  
private
  def payment_params
    params.require(:payment).permit(:customer_id, :date, :amount, :classes_paid_for)
  end
end
