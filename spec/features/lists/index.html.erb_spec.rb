require 'spec_helper'

describe ".index", :type => :feature do

  let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
  let(:other_users) {
    [user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
     FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]
  }

  it "access bart's index page containing one public list" do
    list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
    create_logged_in_user(:user_john)

    visit user_lists_path(user_bart)
    page.should have_content I18n.t('user_name_todo_lists', :user_name => user_bart.name)
    page.should have_content list_bart_homework.name
  end

  it "access bart's index page containing no public lists" do
    FactoryGirl.find_or_create(:list_bart_movies_to_watch)
    create_logged_in_user(:user_john)

    visit user_lists_path(user_bart)
    page.should have_content I18n.t('user_name_todo_lists', :user_name => user_bart.name)
    page.should have_content I18n.t('no_lists_yet')
  end

end