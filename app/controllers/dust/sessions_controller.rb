module Dust
  class SessionsController < AuthenticationController

    layout "sessions"

    def new
      @session = Dust::Session.new
    end

    def create
      @user = login(params[:dust_session][:username], params[:dust_session][:password], params[:dust_session][:remember_me])
      if @user
        redirect_back_or_to Dust.config.after_login_path, :notice => "Logged In!"
      else
        @session = Dust::Session.new(params[:dust_session], @user)
        @session.valid?
        render :action => 'new'
      end
    end

    def destroy
      logout
      redirect_to root_url, :notice => "Logged Out!"
    end
  end
end
