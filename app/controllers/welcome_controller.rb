class WelcomeController < ApplicationController
  skip_before_action :require_authenticate

  def show
  end
end
