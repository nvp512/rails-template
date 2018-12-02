class ActivationsController < ApplicationController
  before_action :token_required, only: [:edit]

  def edit
    @token.is_used!
    session[:member_id] = @token.member_id
    current_user.activated!

    return redirect_to mypages_path, notice: "Login Successfull"
  end
end