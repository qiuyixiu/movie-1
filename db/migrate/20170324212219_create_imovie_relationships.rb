class CreateImovieRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :imovie_relationships do |t|
      t.integer :imovie_id
      t.integer :user_id

      t.timestamps
    end
  end
end
