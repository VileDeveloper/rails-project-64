# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
    @parent_comment = post_comments(:one)
  end
  test '#create' do
    post_comment_params = {
      content: Faker::Lorem.sentence,
      parent_id: @parent_comment.id
    }
    sign_in @user

    post post_comments_url(@post, post_comment: post_comment_params)

    post_comment = PostComment.find_by({
                                         user: @user,
                                         post: @post,
                                         ancestry: @parent_comment.id,
                                         content: post_comment_params.fetch(:content)
                                       })

    assert { post_comment }
  end
end
