require 'spec_helper'

describe ".create", :type => :feature, :js => true do

  it "creates a task in list_john_private_list" do
    create_logged_in_user(:user_john)
    user_john = FactoryGirl.find_or_create(:user_john)
    list_john_private_list = FactoryGirl.find_or_create(:list_john_private_list)

    visit home_path
    visit user_list_path(user_john, list_john_private_list)

    page.should have_content I18n.t('no_tasks_yet')

    fill_in I18n.t('activerecord.attributes.task.description'), :with => "Description"

    click_button I18n.t('save')

    page.should have_content I18n.t('flash.actions.create.notice', :resource_name => Task.to_s)

  end

end