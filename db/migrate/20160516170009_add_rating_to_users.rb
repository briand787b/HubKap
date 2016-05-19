class AddRatingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avg_rating, :float, default: 0
    add_column :users, :num_ratings, :integer, default: 0
  end
end
