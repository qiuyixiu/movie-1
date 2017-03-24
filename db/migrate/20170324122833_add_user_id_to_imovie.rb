class AddUserIdToImovie < ActiveRecord::Migration[5.0]
  def change
    add_column :imovies, :user_id, :integer
  end
end
