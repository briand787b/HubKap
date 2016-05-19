class AddSubjectToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :topic, :string
    add_column :questions, :difficulty, :string
  end
end
