class AddDifficultyToSubjects < ActiveRecord::Migration
  def change
  	add_column :subjects, :difficulty, :string
  end
end
