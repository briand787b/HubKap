class AddActiveToAnswers < ActiveRecord::Migration
  def up
    add_column :answers, :active, :boolean
  	change_column_default :answers, :active, false
  end

  def down
  	remove_column :answers, :active, :boolean
  end
end
