class FixDefaultAnswered < ActiveRecord::Migration
  def change
  	change_column_default :questions, :answered, false
  end
end
