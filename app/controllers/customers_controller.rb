class CustomersController < ApplicationController

  def index
    @customers = Customer.sorted
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end
  
  def create
    # Instantiate the object
    @customer = Customer.new(customer_params)
    # Save the object
    if @customer.save
    # If success redirect to show
      flash[:notice] = @customer.name + " was successfully created"
      redirect_to(:action=>'show', :id => @customer.id)
    else
    # If fail return to new for correction
      render('new')
    end
  end
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
    # If success redirect to show
      flash[:notice] = @customer.name + " was successfully updated"
      redirect_to(:action=>'show', :id => @customer.id)
    else
    # If fail return to new for correction
      render('edit')
    end
  end

  def delete
    @customer = Customer.find(params[:id])
  end
  
  def destroy
    customer = Customer.find(params[:id]).destroy
    flash[:notice] = customer.name + " was successfully destroyed."
    redirect_to(:action => 'index')
  end
  
  private
    def customer_params
      params.require(:customer).permit(:name, :phone, :email, :current)    
    end
end
