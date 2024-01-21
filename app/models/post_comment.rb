# frozen_string_literal: true

# == Schema Information
#
# Table name: post_comments
#
#  id         :bigint           not null, primary key
#  ancestry   :string           default("/")
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_post_comments_on_ancestry  (ancestry)
#  index_post_comments_on_post_id   (post_id)
#  index_post_comments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_ancestry

  validates :content, presence: true, length: { minimum: 1 }
end
