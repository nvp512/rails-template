class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :set_timezone

  # def auth_anybody!
  #   redirect_to root_path if current_user
  # end

  def auth_anybody!
    redirect_to mypages_path if current_user
  end

  def auth_admin!
  end

  def auth_member!
    unless current_user
      redirect_to root_path, notice: "Please login!"
    end
  end

  def current_user
    @current_user ||= Member.current = Member.enabled.where(id: session[:member_id]).first
  end

  def token_required
    if not @token = Token.available.where(token: params[:id]).first
      redirect_to root_path, :alert => t('.alert')
    end
  end

  def set_timezone
    Time.zone = ENV['TIMEZONE'] if ENV['TIMEZONE']
  end

  # def clear_all_sessions(member_id)
  #   if redis = Rails.cache.instance_variable_get(:@data)
  #     redis.keys("app:sessions:#{member_id}:*").each {|k| Rails.cache.delete k.split(':').last }
  #   end
  #
  #   Rails.cache.delete_matched "app:sessions:#{member_id}:*"
  # end
end
