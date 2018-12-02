class IdentitiesController < ApplicationController
  before_action :auth_anybody!, only: [:index]

  def index
    @identity = request.env['omniauth.identity'] || Identity.new
  end

  def new
    flash[:alert] = if params[:email].blank?
                        t('.email_not_blank')
                      elsif /\A\S+@.+\.\S+\z/.match(params[:email]).nil?
                        t('.invalid_email')
                      end
    # binding.pry

    flash[:alert] = t('.email_has_been_taken') if ::Member.find_by(email: params[:email]).present?
    flash[:alert] = t('.password_dont_match') if params[:password] != params[:password_confirmation]
    # flash[:warning] = t('.invalid_password') unless Identity::PASSWORD_FORMAT.match(params[:password])

    redirect_to signup_url
  end

  def edit

  end

  #change password
  def update

  end
end
