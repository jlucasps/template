require 'spec_helper'

describe ".home", :type => :feature do

  it "access home page" do
    create_logged_in_user(:user_bart)

    visit home_path
    page.should have_content I18n.t('my_todo_lists')
  end
end