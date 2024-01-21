# frozen_string_literal: true

return if PostLike.any?

post = Post.last

likes = [
  {
    post:,
    user: User.first
  },
  {
    post:,
    user: User.last
  }
]

likes.each { PostLike.create!(_1) }
