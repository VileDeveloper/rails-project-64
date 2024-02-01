# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_with_comments = posts(:one)
    @category_two = categories(:two)
    @second_post_title = 'second post title'

    sign_in(users(:one))
  end

  test 'should get index' do
    get posts_url

    assert_response :success
  end

  test 'should get new' do
    get new_post_url(Post.new)

    assert_response :success
  end

  test 'should create post' do
    post posts_url, params:
      {
        post: {
          body: @post_with_comments.body,
          category_id: @post_with_comments.category_id,
          creator_id: @post_with_comments.creator_id,
          title: @second_post_title
        }
      }

    assert_response :redirect

    created_post =
      Post.find_by(
        body: @post_with_comments.body,
        category_id: @post_with_comments.category_id,
        creator_id: @post_with_comments.creator_id,
        title: @second_post_title
      )

    assert(created_post)
  end

  test 'should show post' do
    get post_url(@post_with_comments)

    assert_response :success
  end
end
