class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def gave_unique_answer_to? question 
  	self.answers.each do |a|
  		if a.question_id == question.id
  			return false
  		end
  	end
  	return true
  end

end
