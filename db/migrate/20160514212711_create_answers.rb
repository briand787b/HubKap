class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :duration
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
