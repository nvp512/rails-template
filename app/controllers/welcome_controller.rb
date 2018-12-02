class WelcomeController < ApplicationController

  def index
    @identity = Identity.new
  end
end
