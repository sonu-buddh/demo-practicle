class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @answer = Answer.new
    @questions = Question.all
  end
  
  def my_questions
    @question = Question.new
    @questions = current_user.questions
  end

end
