# encoding: UTF-8

# anyting in this helper is available application wide
module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end
end
