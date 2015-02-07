module ApplicationHelper
  def title(*parts)
    parts.compact.join ' | '
  end
end
