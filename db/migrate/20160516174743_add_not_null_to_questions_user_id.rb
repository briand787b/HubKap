class AddNotNullToQuestionsUserId < ActiveRecord::Migration
  def change
  	change_column_null :questions, :user_id, false
  end
end
