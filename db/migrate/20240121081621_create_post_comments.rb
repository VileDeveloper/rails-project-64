# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.1]
  def change
    create_table :post_comments do |t|
      t.text :content
      t.references :post, foreign_key: true, null: false, index: true
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
