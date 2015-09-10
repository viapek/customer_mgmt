class AccessController < ApplicationController

  layout 'admin'
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
    
  end

  def login
    
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:email => params[:username]).first
      if found_user
        authorised_user = found_user.authenticate(params[:password])
      end
    end
    if authorised_user
      session[:user_id] = authorised_user.id
      session[:username] = authorised_user.email
      #session[:expires_at] = Time.current + 30.minutes
      flash[:notice] = "You are logged in now"
      redirect_to(:action => 'index')
    else
        flash[:notice] = "Invalid username/password combination"
        redirect_to(:action => 'login')
    end
  end

  def logout
     session[:user_id] = nil
     session[:username] = nil
     flash[:notice] = "Logged out of viaEnglish Admin"
    redirect_to(:action => 'login')
  end

end
