class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :auth_member!, only: [:destroy]
  before_action :auth_anybody!, only: [:new]

  def new
    @identity = request.env['omniauth.identity'] || Identity.new
  end

  def create
    @member = Member.from_auth(auth_hash)
    if @member.activated?
      session[:member_id] = @member.id
      return redirect_to mypages_path, notice: "Login Successfull"
    end

    redirect_to signin_path, notice: "Please confirm active link in emails!"
  end

  def failure
    redirect_to signin_path, alert: "Login fails!"
  end

  #logout
  def destroy
    # clear_all_sessions current_user.id
    reset_session
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
