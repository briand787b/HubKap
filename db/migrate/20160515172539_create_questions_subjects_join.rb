class CreateQuestionsSubjectsJoin < ActiveRecord::Migration
  def change
    create_table :questions_subjects, :id => false do |t|
    	t.integer :question_id
    	t.integer :subject_id
    end
    add_index :questions_subjects, [:question_id, :subject_id]
  end
end
