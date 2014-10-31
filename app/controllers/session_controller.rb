class SessionController < ApplicationController

  def login
  end
  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by_email_pass(email, password)

    if user.nil?
      flash[:login_error] = @login_error = true
      respond_to do |format| 
        format.json {render json: '{"error": "Incorrect login"}', status: :unauthorized}
        format.html {render 'login'}
      end
      return
      
    else
      session[:authenticated_user_id] = user.id
      respond_to do |format|
        format.json {render json: '{"success": true}', status: :created}
        format.html {redirect_to flash[:redirect_to] || root_url}
      end 
    end

  end

  def logout
    session[:authenticated_user_id] = nil
    respond_to do |format|
      format.json do 
        render json: '{"success": true}', status: :ok
      end
      format.html do
        redirect_to 
      end
    end
    
  end

end
