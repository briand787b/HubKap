class SetDefaultDurationAnswersTable < ActiveRecord::Migration
  def change
  	change_column_default :answers, :duration, 0
  end
end
