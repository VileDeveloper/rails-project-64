# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_with_comments = posts(:one)
    @category_two = categories(:two)
    get '/users/sign_in'
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
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: @post_with_comments.body,
                                        category_id: @post_with_comments.category_id,
                                        creator_id: @post_with_comments.creator_id,
                                        title: @post_with_comments.title } }
    end

    assert_response :redirect
  end

  test 'should show post' do
    get post_url(@post_with_comments)

    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post_with_comments)

    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post_with_comments), params: { post: { category_id: @category_two.id } }

    assert_redirected_to post_url(@post_with_comments)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post_with_comments)
    end

    assert_redirected_to posts_url
  end
end
