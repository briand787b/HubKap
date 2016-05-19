class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers

	validates :body, :user_id, presence: true
	validates :body, length: {
		maximum: 500,
		minimum: 10,
		too_short: "must have at least 10 characters",
		too_long: "must have 500 or fewer charactes"
	}
	validates :title, length: {
		maximum: 50,
		minimum: 10, 
		too_long: "must have 50 or fewer characters",
		too_short: "must have at least 10 characters"
	}
	validates :topic, inclusion: QuestionsHelper::TOPICS
	validates :difficulty, inclusion: QuestionsHelper::DIFFICULTY_LEVEL

	def self.relevant
		arr = Array.new
		time_limit = Time.now - 1800
		arr = Question.where("created_at > ? and answered = ?", time_limit, false)
	end

	def self.since_refresh
		arr = Array.new
		refresh = Time.now - 10
		arr = Question.where("created_at > ? and answered = ?", refresh, false)
	end

end
