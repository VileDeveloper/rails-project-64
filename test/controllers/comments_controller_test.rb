# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_one = users(:one)
    @post_with_comments = posts(:with_comments)
    @comment_one = post_comments(:one)
    @second_content = 'second post_comment content'

    sign_in(@user_one)
  end

  test 'should create comment' do
    post post_comments_url(@post_with_comments), params:
      {
        post_comment: {
          post_id: @comment_one.post_id,
          user_id: @comment_one.user_id,
          content: @second_content
        }
      }

    assert_response :redirect
    assert_redirected_to post_path(@post_with_comments)

    created_post_comment =
      PostComment.find_by(
        post_id: @comment_one.post_id,
        ancestry: @comment_one.ancestry,
        content: @second_content
      )

    assert(created_post_comment)
  end
end
