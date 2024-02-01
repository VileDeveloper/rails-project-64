# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'check action_to_css_class_color' do
    actions = {
      new: 'success',
      create: 'success',
      edit: 'success',
      update: 'success',
      show: 'primary',
      index: 'primary',
      destroy: 'warning',
      other: 'default'
    }

    actions.each_pair do |action, color|
      assert_equal(action_to_css_class_color(action), color)
    end
  end
end
