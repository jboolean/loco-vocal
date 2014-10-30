class UsersController < ApplicationController
  def new
    @user = User.new
    @mdparser = @@mdparser
  end

  def create
    @mdparser = @@mdparser

    @user = User.new(params.require(:user).permit(:email, :yob, :password, :gender))

    @errors = []

    if (params[:user][:email] != params[:email_confirm])
      @errors << 'Email addresses do not match'
    end

    if (params[:user][:password] != params[:password_confirm])
      @errors << 'Passwords do not match'
    end

    if (params[:tos] != 'accepted')
      @errors << 'Please read and agree to the Terms & Conditions'
    end

    if @errors.empty?
      @user.save
    end

    unless @user.errors.empty?
      @errors.concat(@user.errors.full_messages)
    end

    if @errors.empty?
      redirect_to root_url
    else
      render 'new'
    end

  end

  def edit
    @mdparser = @@mdparser

    @user = User.find(params[:id])
  end

  def update
    @mdparser = @@mdparser

    @errors = []


    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:email, :yob, :password, :gender)

    if (user_params[:email] != @user.email && 
      user_params[:email] != params[:email_confirm])
      @errors << 'Email addresses do not match'
    else
      @user.email = user_params[:email]
    end

    @user.yob = user_params[:yob]
    @user.gender = user_params[:gender]

    unless user_params[:password].blank?
      if @user.pass_eql?(params[:password_old])
        @user.password = user_params[:password]
      else
        @errors << 'Old password incorrect'
      end
    end

    if @errors.empty?
      @user.save
    end

    unless @user.errors.empty?
      @errors.concat(@user.errors.full_messages)
    end

    @success = @errors.empty?

    render 'edit'

  end

  private
end
