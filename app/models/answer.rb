class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	def minutes_ago 
		return ((Time.now - self.created_at) / 60).floor
	end

	def self.recent_to_question question
		return_arr = Array.new
		time_limit = Time.now - 10 #10 seconds for question/show, 1800 for home/main
		return_arr = Answer.where(["created_at > ? and question_id = ?", time_limit, question.id])
	end

	def self.from_user user
		return_arr = Array.new
		time_limit = Time.now - 1800
		return_arr = Answer.joins(:question).where(["answers.created_at > ? and answers.user_id = ? and questions.answered = ?", time_limit, user.id, false])
	end

	def self.to_question question
		return Answer.where(question_id: question.id)
	end

	def self.check_acceptance user
		user.answers.each do |a|
			if a.accepted && !a.question.answered 
				puts "************************"
				puts "#{a} was accepted"
				puts "*************************"
				return a
			end
		end
		return nil
	end
end
