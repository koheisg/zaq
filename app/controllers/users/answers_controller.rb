class Users::AnswersController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    @questions = @user.answers
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by!(name: params[:user_id][1..-1])
    end
end
