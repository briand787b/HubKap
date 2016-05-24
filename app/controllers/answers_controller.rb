class AnswersController < ApplicationController
  def index
  	#Shows all answers specific to one question
    @answers = Answer.where("user_id = ?", current_user.id)
  end

  def destroy
    answer = Answer.find(params[:id])
    if answer.destroy
      flash[:notice] = "Answer was successfully deleted"
    else
      flash[:notice] = "There was an issue, answer could not be deleted"
    end
    redirect_to main_path
  end

  def start_timer
    session[:start] = Time.now
    @answer = Answer.find(params[:answer_id])
    @answer.update(active: true)

    #Render a start_timer.js file
    #DEBUG
    puts "********************************"
    puts Time.now
    puts session[:start]
    puts params[:answer_id]
    puts "********************************"
  end

  def end_timer
    puts "*****************************"
    puts session[:start]
    puts Time.now
    puts Time.now - Time.parse(session[:start])
    puts "*****************************"

    @answer = Answer.find(params[:answer_id])
    @answer.duration += (Time.now - Time.parse(session[:start]))
    @answer.active = false
    @answer.save



    #DEbug
    puts "************************"
    puts @answer.duration
    puts "************************"
  end

  def show
  	#Shows one answer
  	#This is the screen from which the asker can call the answerer
  	#Only screen where user's skype username is publicly visible
   @answer = Answer.find(params[:id])
  end

  def create
  	#if current user has already answered this question, don't do anything
    #i.e. if current_user.answers contains answer with answer.question_id == :question_id, do nothing
    if current_user.gave_unique_answer_to? Question.find(params[:question_id])
      answer = Answer.new(whitelist_params)
      answer.user_id = current_user.id
      if answer.user_id != answer.question.user_id && answer.save
        flash[:notice] = "Submission Successful.  Your Answer is pending acceptance"
        redirect_to main_path
      else
        flash[:notice] = "You cannot answer your own questions"
        redirect_to main_path
      end
    else
      redirect_to main_path
    end
    #Prob should just make the 'redirect_to main_path' thing go outside the if-statements
  end

  def update
    #Gonna need to update the attributes of answers at points.  They are initially created with values
    #that will change once they are accepted, etc...
    answer = Answer.find(params[:answer_id])
    #if params[:start]

    #end
    if answer.update(accepted: true)
      redirect_to answer 
    else 
      redirect_to Question.find(params[:question_id])
    end
  end

  private

  def whitelist_params
    params.permit(:question_id, :answer_id)
  end
end
