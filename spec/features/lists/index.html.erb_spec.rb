require 'spec_helper'

describe ".home", :type => :feature do

  let(:user_bart) {FactoryGirl.create(:user_bart)}
  let(:other_users) {
    [user_bart, FactoryGirl.create(:user_homer), FactoryGirl.create(:user_lisa),
     FactoryGirl.create(:user_maggie),FactoryGirl.create(:user_marge)]
  }

  it "show home page" do
    create_logged_in_user(:user_john)

    visit user_lists_path(user_bart)
    page.should have_content I18n.t('user_name_todo_lists', :user_name => user_bart.name)
  end
end