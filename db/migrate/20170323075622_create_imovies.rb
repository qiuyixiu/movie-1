class CreateImovies < ActiveRecord::Migration[5.0]
  def change
    create_table :imovies do |t|
      t.string :电影名称
      t.text :简介

      t.timestamps
    end
  end
end
