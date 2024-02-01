# frozen_string_literal: true

module ApplicationHelper
  def alert_class_by_type(type)
    types = {
      notice: 'info',
      error: 'danger',
      success: 'success'
    }

    types[type.to_sym] || 'info'
  end

  def action_to_css_class_color(name = action_name)
    name = name.dup.downcase.to_s unless action_name == name
    if %w[new edit update create].include?(name)
      'success'
    elsif %w[show index].include?(name)
      'primary'
    elsif name == 'destroy'
      'warning'
    else
      'default'
    end
  end
end
