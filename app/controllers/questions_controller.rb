class QuestionsController < ApplicationController
  def new
  	#First page visible after clicking on 'Ask a Question' button on Main Page
  	@question = Question.new
  end

  def show
  	#Necessary because only a portion of large questions will be shown on Main Page
    #Look at full question before user decides if he wants to answer it
  	@question = Question.find(params[:id])

    respond_to do |format|
      format.html do 
        @answers = Answer.to_question @question
      end
      format.js do 
        @answers = Answer.recent_to_question @question
      end
    end
  end

  def create
  	#Attempts to save new question
  	#Sends user to answers/index if save successful
  	#Sends user back to questions/new if save unsuccessful
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def index
    @questions = Question.where("user_id = ?", current_user.id)
  end

  def update
  	#To update 'answered' attribute for when the question asker either goes 'Back to Home' or 'Back to Answers'
  	#'Back to Home' causes 'answered' attribute to become 'true' in this action
  end

  def destroy
    #Rather than duplicate code to end the timer and log the duration here, i'll simply hide the 'terminate' button
    #while the timer is running
    question = Question.find(params[:id])
    question.update(answered: true)
    redirect_to main_path
  end

  private

  def question_params
    params.require(:question).permit(:body, :topic, :difficulty, :user_id, :title)
  end
end
