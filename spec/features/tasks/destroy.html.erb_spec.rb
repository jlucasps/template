require 'spec_helper'

describe ".create", :type => :feature, :js => true do

  it "removes a task in list_john_private_list" do
    create_logged_in_user(:user_john)
    user_john = FactoryGirl.find_or_create(:user_john)
    list_john_public_list = FactoryGirl.find_or_create(:list_john_public_list)
    task_john_public_first = FactoryGirl.find_or_create(:task_john_public_first)
    task_john_public_second = FactoryGirl.find_or_create(:task_john_public_second)

    visit home_path
    visit user_list_path(user_john, list_john_public_list)

    click_link "delete_#{task_john_public_first.id}"
    page.driver.browser.switch_to.alert.accept

    page.should have_content I18n.t('flash.actions.destroy.notice', :resource_name => Task.to_s)
    page.should have_content task_john_public_second.description

  end

end