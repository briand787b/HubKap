class AddNotNullToAnswersUserId < ActiveRecord::Migration
  def change
  	change_column_null :answers, :user_id, :false
  end
end
