class RemoveSubjects < ActiveRecord::Migration
  def up
  	drop_table :subjects
  end

  def down 
  	create_table :subjects do |t|
  		t.string :topic
  		t.string :difficulty
  	end
  end
end
