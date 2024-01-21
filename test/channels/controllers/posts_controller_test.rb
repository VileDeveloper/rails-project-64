# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @category = categories(:one)
  end

  test '#index' do
    sign_in @user
    get root_url

    assert_response :success
  end

  test '#show' do
    sign_in @user
    get post_url(@post)

    assert_response :success
  end

  test '#new' do
    sign_in @user
    get new_post_url

    assert_response :success
  end

  test '#create' do
    post_params = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars(number: 256),
      category_id: @category.id
    }
    sign_in @user
    post posts_url, params: { post: post_params }

    assert_response :redirect

    assert { Post.exists?(post_params.merge(creator: @user)) }
  end
end
