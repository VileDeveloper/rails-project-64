# frozen_string_literal: true

return if Post.any?

posts = [
  {
    title: Faker::Movies::HarryPotter.spell,
    body: Faker::Books::Lovecraft.fhtagn(number: 20),
    category: Category.first,
    creator: User.first
  },
  {
    title: Faker::Movies::HarryPotter.spell,
    body: Faker::Books::Lovecraft.fhtagn(number: 20),
    category: Category.last,
    creator: User.last
  }
]

posts.each { Post.create!(_1) }
