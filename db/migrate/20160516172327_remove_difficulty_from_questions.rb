class RemoveDifficultyFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :difficulty, :string
  end
end
