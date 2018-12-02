module Private
  class BaseController < ApplicationController
    before_action :auth_member!
  end
end
