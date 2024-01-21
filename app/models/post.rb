# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  body        :text
#  likes_count :integer          default(0)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  creator_id  :bigint           not null
#
# Indexes
#
#  index_posts_on_category_id  (category_id)
#  index_posts_on_creator_id   (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (creator_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :category, inverse_of: :posts
  belongs_to :creator, class_name: 'User', optional: true
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :body, presence: true, length: { minimum: 3 }

  def liked(user)
    return nil if !user || !user.id

    @liked = likes.find_by(user_id: user.id) if @liked.nil? || user.id != @liked.user_id

    @liked
  end
end
