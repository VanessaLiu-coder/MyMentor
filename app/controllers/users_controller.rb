class UsersController < ApplicationController
  def new
  end
  
  def show
    # require 'pry'
    # binding.pry
    @user = current_user
    @enrolments = @user.enrolments
  end

  def create
    @user = User.new(user_params)#User.new(params[:user])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to MyMentor!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, mentor: [:id, :enrolment_id, :hourly_rates, :review, :user_id])
    end
end
