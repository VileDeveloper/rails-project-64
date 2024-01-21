# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post_with_comments = posts(:one)
  end

  test 'visiting the index' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
  end

  test 'should create post' do
    visit posts_url
    click_link 'New post'

    fill_in 'Body', with: @post_with_comments.body
    fill_in 'Category', with: @post_with_comments.category_id
    fill_in 'Creator', with: @post_with_comments.creator_id
    fill_in 'Title', with: @post_with_comments.title
    click_link 'Create Post'

    assert_text 'Post was successfully created'
    click_link 'Back'
  end

  test 'should update Post' do
    visit post_url(@post_with_comments)
    click_link 'Edit this post', match: :first

    fill_in 'Body', with: @post_with_comments.body
    fill_in 'Category', with: @post_with_comments.category_id
    fill_in 'Creator', with: @post_with_comments.creator_id
    fill_in 'Title', with: @post_with_comments.title
    click_link 'Update Post'

    assert_text 'Post was successfully updated'
    click_link 'Back'
  end

  test 'should destroy Post' do
    visit post_url(@post_with_comments)
    click_link 'Destroy this post', match: :first

    assert_text 'Post was successfully destroyed'
  end
end
