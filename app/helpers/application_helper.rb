module ApplicationHelper
  def title(*parts, delimiter: ' | ')
    parts.compact.join delimiter
  end

  def settings
    content_for :setting if content_for? :settings
    yield if block_given?
  end
end
