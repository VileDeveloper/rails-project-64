# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include PostsHelper

  setup do
    get '/users/sign_in'
    @user_one = users(:one)
    @post_one = posts(:one)
    @post_like_one = post_likes(:one)

    @user_two = users(:two)
    @post_two = posts(:two)

    sign_in(@user_one)
  end

  test 'should get create' do
    referer = post_url(@post_two.id)
    headers = { 'HTTP_REFERER' => referer }
    post post_likes_url(@post_two.id), headers:, params: { post_id: @post_two.id, user_id: @user_one.id }

    assert_response :redirect
  end

  test 'should get destroy' do
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@post_one.id, @post_like_one.id)
    end

    assert_response :redirect
  end
end
