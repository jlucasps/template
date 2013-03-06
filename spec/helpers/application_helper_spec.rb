require 'spec_helper'
require 'haml'

describe ApplicationHelper do
  before :each do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
  end

  context "when width and height are the same" do
    it ".icon_128x128" do
      image_tag = "<img alt=\"Lock\" height=\"128px\" src=\"/assets/icons/128x128/lock.png\" width=\"128px\" />"
      helper.icon_128x128('lock').should == image_tag
    end

    it ".icon_24x24" do
      image_tag = "<img alt=\"Favorites\" height=\"24px\" src=\"/assets/icons/24x24/favorites.png\" width=\"24px\" />"
      helper.icon_24x24('favorites').should == image_tag
    end
  end

  context "when width and height has changed" do
    it ".icon_128x128 changed to 64x64" do
      image_tag = "<img alt=\"Lock\" height=\"64px\" src=\"/assets/icons/128x128/lock.png\" width=\"64px\" />"

      helper.icon_128x128('lock', :width => "64px", :height => "64px").should == image_tag
    end

    it ".icon_24x24 change to 12x12" do
      image_tag = "<img alt=\"Favorites\" height=\"12px\" src=\"/assets/icons/24x24/favorites.png\" width=\"12px\" />"

      helper.icon_24x24('favorites', :width => "12px", :height => "12px").should == image_tag
    end
  end


end
