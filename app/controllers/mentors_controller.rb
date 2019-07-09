class MentorsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @mentors= Mentor.all
  end
  
  def show
    # require 'pry'
    # binding.pry
    @user = current_user
    @mentor = Mentor.find(params[:id])
  end
  
  def new
    # require 'pry'
    # binding.pry
    @user = User.find(params[:user_id])
    @mentor = Mentor.new
  end
  
  def create
    # require 'pry'
    # binding.pry
    @user = User.find(params[:user_id])
    @mentor = @user.mentors.new(params[:mentor].permit(:enrolment_id,:hourly_rate,:mentor))
    if @mentor.save
      @enrolment = Enrolment.find(@mentor.enrolment_id)
      @enrolment.update_attributes(is_mentor: true)
      redirect_to user_mentors_path
    else 
      flash.now[:danger] = 'unsuccesful'
    end
  end
  
  def edit 
    # require 'pry'
    # binding.pry
    @user = current_user
    @matched = Match.find(params[:id])
  end
  
  def update
    # require 'pry'
    # binding.pry
    @user = current_user
    @matched = Match.find(params[:id])
    if @matched.update_attributes(if_finish: true)
      redirect_to user_mentors_path
    else
      flash.now[:danger] = 'unsuccesful'
    end      
  end
end
