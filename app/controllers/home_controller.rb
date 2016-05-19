class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:welcome]

  def welcome
  	#First page upon visit
  	#Only page that can be viewed without signing in
    #No data is associated with this action
  end

  def main
  	#Central point of application
  	#Where user will spend most of his time
  	#User can initiate both ask and answer pathways from this page

    #@questions --> will need some sort of method to search for active and recent questions
    #@questions --> may need to be limited to some number
    @questions = Question.relevant

    #@answers --> will need some sort of method to search for active and recent answers for current user
    @answers = Answer.from_user current_user
  end

  def alert_user
    @answer = Answer.check_acceptance current_user
    @questions = Question.since_refresh
  end

  private

  def home_params
    #params.permit(:user_id)
  end
end
