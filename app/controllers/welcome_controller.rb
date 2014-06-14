class WelcomeController < ApplicationController

  def index
    if current_user
      render 'users/index'
    end
  end

end