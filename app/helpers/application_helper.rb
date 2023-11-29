# frozen_string_literal: true

module ApplicationHelper
  def to_date(date)
    date.strftime('%d/%m/%Y')
  end

  def backward_path
    request.referer || root_path
  end
end
