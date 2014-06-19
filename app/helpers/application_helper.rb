# encoding: UTF-8

# anyting in this helper is available application wide
module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  # this helper isn't utilized I prefer
  # using to_formatted_s(:long)
  def display_datetime(dt)
    dt.strftime('%m/%d/%Y %l:%M%P %Z')
  end
end
