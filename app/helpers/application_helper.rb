module ApplicationHelper

  # Returns a 128x128 pixel icon
  def icon_128x128(name, options = {})
    image_tag("icons/128x128/#{name}.png", {:width => '128px', :height => '128px'}.merge(options))
  end

end
