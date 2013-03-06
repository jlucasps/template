module ApplicationHelper

  # Returns a 128x128 pixels icon
  def icon_128x128(name, options = {})
    image_tag("icons/128x128/#{name}.png", {:width => '128px', :height => '128px'}.merge(options))
  end

  # Returns a 24x24 pixels icon
  def icon_24x24(name, options = {})
    image_tag("icons/24x24/#{name}.png", {:width => '24px', :height => '24px'}.merge(options))
  end

end
