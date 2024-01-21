# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name)
#
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category_one = categories(:one)
    @name_valid = 'category'
    @name_too_long = 'a' * 51
    @name_too_short = ''
  end

  test 'valid name' do
    assert_predicate Category.new(name: @name_valid), :valid?
  end

  test 'invalid name' do
    assert_not_predicate Category.new(name: @name_too_long), :valid?
    assert_not_predicate Category.new(name: @name_too_short), :valid?
  end

  test 'duplicate name' do
    assert_not_predicate Category.new(name: @category_one.name), :valid?
  end
end
