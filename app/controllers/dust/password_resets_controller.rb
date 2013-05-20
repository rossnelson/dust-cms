module Dust
  class PasswordResetsController < AuthenticationController
    
    before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]

    layout 'user_sessions'

    def new
    end

    def create
      @user = Dust::User.find_by_email(params[:email])
      if @user
        @user.deliver_password_reset_instructions!
        flash[:notice] = "Instructions to reset your password have been emailed to you"
        redirect_to root_path
      else
        flash.now[:error] = "No user was found with email address #{params[:email]}"
        render :action => :new
      end
    end

    def edit
    end

    def update
      @user.password = params[:password]
      @user.password_confirmation = params[:password]
      if @user.save
        flash[:notice] = "Your password was successfully updated"
        redirect_to dashboard_url
      else
        render :action => :edit
      end
    end


    private

    def load_user_using_perishable_token
      @user = Dust::User.find_using_perishable_token(params[:id])
      unless @user
        flash[:error] = "We're sorry, but we could not locate your account"
        redirect_to root_url
      end
    end
  end
end
