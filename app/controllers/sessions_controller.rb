class SessionsController < ApplicationController
  def create
    uid = request.env['omniauth.auth']['uid']
    info = request.env['omniauth.auth']['info']

    begin
      twitter_authentication = TwitterAuthentication.create!(uid: uid)
      user = User.create!(name: info['nickname'])
      UserAuthentication.create!(user: user, authenticationable: twitter_authentication)
    rescue ActiveRecord::RecordNotUnique
      twitter_authentication = TwitterAuthentication.find_by(uid: uid)
    end

    reset_session
    session[:user_id] = twitter_authentication.user_id

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
