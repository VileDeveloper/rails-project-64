# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :category, foreign_key: true, null: false, index: true
      t.references :creator, null: false

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :creator_id
  end
end
