class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by!(name: params[:id][1..-1])
    end
end
