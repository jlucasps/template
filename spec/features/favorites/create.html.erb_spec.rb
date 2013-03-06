require 'spec_helper'

describe ".create", :type => :feature, :js => true do


  it "set list_bart_homework as favorite for user_john" do

    user_bart = FactoryGirl.create(:user_bart)
    list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
    create_logged_in_user(:user_john)

    visit home_path
    visit user_lists_path(user_bart)

    page.should have_content I18n.t('user_name_todo_lists', :user_name => user_bart.name)
    page.should have_content list_bart_homework.name

    click_link I18n.t('options')
    click_link I18n.t('favorite')

    page.should have_content I18n.t('flash.actions.create.notice', :resource_name => Favorite.to_s)

  end
end