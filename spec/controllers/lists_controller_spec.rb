require 'spec_helper'

describe ListsController do

  let(:user_john) { FactoryGirl.create(:user_john)}
  before(:each) do
    sign_in user_john
  end

  describe "GET home" do
    it "assigns @other_users" do
      other_users = [FactoryGirl.create(:user_bart), FactoryGirl.create(:user_homer), FactoryGirl.create(:user_lisa),
                     FactoryGirl.create(:user_maggie),FactoryGirl.create(:user_marge)]
      get :home
      assigns(:other_users).should eq(other_users)
    end
  end

  describe "GET index" do
    let(:user_bart) {FactoryGirl.create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.create(:user_homer), FactoryGirl.create(:user_lisa),
                   FactoryGirl.create(:user_maggie),FactoryGirl.create(:user_marge)]}

    it "assigns @other_users" do
      get :index, {:user_id => user_bart.id}
      assigns(:other_users).should eq(other_users)
      assigns(:user).should eq(user_bart)
    end

    it "assigns @user_viewed" do
      get :index, {:user_id => user_bart.id}
      assigns(:other_users).should eq(other_users)
      assigns(:user).should eq(user_bart)
    end

  end

end
