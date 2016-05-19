class AddTitleToQuestions < ActiveRecord::Migration
  def up
  	add_column :questions, :title, :string
  	change_column_null :questions, :title, :false
  end

  def down
  	remove_column :questions, :title, :string
  end
end
