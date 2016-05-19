class RemoveSubjectQuestionJoin < ActiveRecord::Migration
  def change
  	drop_table :questions_subjects
  end
end
