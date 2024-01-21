# frozen_string_literal: true

require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test 'visiting the index' do
    visit categories_url

    assert_selector 'h1', text: 'Categories'
  end

  test 'should create category' do
    visit categories_url
    click_link 'New category'

    fill_in 'Name', with: @category.name
    click_link 'Create Category'

    assert_text 'Category was successfully created'
    click_link 'Back'
  end

  test 'should update Category' do
    visit category_url(@category)
    click_link 'Edit this category', match: :first

    fill_in 'Name', with: @category.name
    click_link 'Update Category'

    assert_text 'Category was successfully updated'
    click_link 'Back'
  end

  test 'should destroy Category' do
    visit category_url(@category)
    click_link 'Destroy this category', match: :first

    assert_text 'Category was successfully destroyed'
  end
end
