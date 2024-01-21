# frozen_string_literal: true

return if Post.any?

posts = [
  {
    title: Faker::Books::Dune.title,
    body: Faker::Books::Dune.quote,
    category: Category.first,
    creator: User.first
  },
  {
    title: Faker::Books::Dune.title,
    body: Faker::Books::Dune.quote,
    category: Category.last,
    creator: User.last
  }
]

posts.each { Post.create!(_1) }
