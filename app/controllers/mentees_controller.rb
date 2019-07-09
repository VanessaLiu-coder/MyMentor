class MenteesController < ApplicationController
  def index
    @user = current_user
    @matches = Match.all
  end
  
  def show
    @user = current_user
    @courses = @user.courses
  end
  
  def new
    @user = current_user
    @course = Course.find(params[:course_id])
  end
  
  def create
    # require 'pry'
    # binding.pry #problem!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    @user = current_user
    @match = @user.matches.new
    @match.mentor_id = params[:mentor_id]
    @match.user_id = params[:user_id]
    if @match.save
      redirect_to user_mentees_path(current_user)
    else 
      flash.now[:danger] = 'unsuccesful'
    end
  end
  
  def edit
    @user = current_user
    @matched = Match.find(params[:id])
  end
  
  def update
    # require 'pry'
    # binding.pry
    @user = current_user
    @matched = Match.find(params[:id])
    @matched.feedback = params[:review][:rating]
    # @matched = Match.find(params[:id].permit(:feedback))
    @mentor = Mentor.find(@matched.mentor_id)
    if @mentor.review
      @old = @mentor.review
      @mentor.review = (@old * @mentor.finished_student + @matched.feedback)/(@mentor.finished_student + 1)
      @mentor.review = ActionController::Base.helpers.number_with_precision(@mentor.review, :precision => 1) 
      @mentor.finished_student = @mentor.finished_student + 1
    else
      @mentor.review = @matched.feedback
      @mentor.finished_student = 1
    end
    
    if @mentor.save
      @matched.destroy
      # change the value of review in mentor : new = (old*finished_student + @matched.feedback)/(finished_student+1)
      # change the value of finished_student in mentor table +1
      redirect_to user_mentees_path
    else
      flash.now[:danger] = 'unsuccesful'
    end  
  end
end
