require 'spec_helper'

describe ListsController do

  let(:user_john) { FactoryGirl.find_or_create(:user_john)}
  before(:each) do
    sign_in user_john
  end

  describe "GET home" do
    it "assigns @other_users" do
      other_users = [FactoryGirl.find_or_create(:user_bart), FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                     FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]
      get :home
      assigns(:other_users).should eq(other_users)
    end
  end

  describe "GET index" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                   FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

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

    it "redirects to home_path" do
      get :index, {:user_id => user_john.id}
      assigns(:user).should eq(user_john)
      response.should redirect_to home_path
    end
  end

  describe "GET new" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

    it "assigns @user" do
      get :new, {:user_id => user_john.id}
      assigns(:user).should eq(user_john)
    end

    it "assigns @list and @list.user" do
      get :new, {:user_id => user_john.id}
      assigns(:list).should be_new_record
      assigns(:list).should be_a_kind_of(List)
      assigns(:list).user.should eq(user_john)
    end
  end

  describe "POST create" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

    it "creates a new list" do
      list_name = "List Name"
      create_params = {:user_id => user_john.id, :list => {:name => list_name, :private => false}}

      post :create, create_params
      assigns(:user).should eq(user_john)
      assigns(:list).should be_valid
      assigns(:list).name.should eq(list_name)
    end
  end

  describe "GET show" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

    it "shows to user his own list" do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
      list_params = {:user_id => user_bart.id, :id => list_bart_homework.id}
      get :show, list_params
      assigns(:list).should eq(list_bart_homework)
    end
  end

  describe "GET edit" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

    it "allows user to access edit of his own lists" do
      list_john_public = FactoryGirl.find_or_create(:list_john_public_list)
      list_params = {:user_id => user_john.id, :id => list_john_public.id}
      get :edit, list_params
      assigns(:list).should eq(list_john_public)
    end
  end

  describe "PUT update" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

    it "allows user to update his own lists" do
      list_john_public = FactoryGirl.find_or_create(:list_john_public_list)
      new_list_name = "New list name"
      list_params = {:id => list_john_public.id, :user_id => user_john.id, :list => {:name => new_list_name, :private => list_john_public.private}}

      put :update, list_params
      assigns(:list).name.should eq(new_list_name)
    end
  end

  describe "DELETE update" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}

    it "allows user to delete his own lists" do
      list_john_public = FactoryGirl.find_or_create(:list_john_public_list)
      list_params = {:id => list_john_public.id, :user_id => user_john.id}

      expect {
        delete :destroy, list_params
      }.to change(List, :count).by(-1)
    end
  end

  context "when user tries to access other user's list" do
    let(:user_bart) {FactoryGirl.find_or_create(:user_bart)}
    let(:other_users) {[user_bart, FactoryGirl.find_or_create(:user_homer), FactoryGirl.find_or_create(:user_lisa),
                        FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]}


    it "blocks access to :new action" do
      get :new, {:user_id => user_bart.id}
      response.should redirect_to home_path
      flash[:alert].should eq(I18n.t('messages.you_can_only_see_other_users_lists'))
      assigns(:user).should be_nil
      assigns(:list).should be_nil
    end

    it "blocks access to :create action" do
      create_params = {:user_id => user_john.id, :list => {:name => "List Name", :private => false, :user_id => user_bart.id}}
      post :create, create_params
      response.should redirect_to home_path
      flash[:alert].should eq(I18n.t('messages.you_can_only_see_other_users_lists'))
      assigns(:user).should be_nil
      assigns(:list).should be_nil
    end

    it "allows access to :show action of public list" do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
      list_params = {:user_id => user_bart.id, :id => list_bart_homework.id}
      get :show, list_params
      assigns(:list).should eq(list_bart_homework)
    end

    it "block access to :show action of private list" do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_movies_to_watch)
      list_params = {:user_id => user_bart.id, :id => list_bart_homework.id}
      get :show, list_params
      response.should redirect_to home_path
      flash[:alert].should eq(I18n.t('messages.not_allowed_action_in_private_list'))
    end

    it "blocks user to access :edit action from other user's list" do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
      list_params = {:user_id => user_bart.id, :id => list_bart_homework.id}

      get :edit, list_params
      response.should redirect_to home_path
      flash[:alert].should eq(I18n.t('messages.you_can_only_see_other_users_lists'))
    end

    it "blocks user to access :update from other user's lists changing :user_id parameter" do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
      new_list_name = "New list name"
      list_params = {:id => list_bart_homework.id, :user_id => user_john.id,
                     :list => {:user_id => user_bart.id, :name => new_list_name, :private => list_bart_homework.private}}

      put :update, list_params
      response.should redirect_to home_path
      flash[:alert].should eq(I18n.t('messages.you_can_only_see_other_users_lists'))
    end

    it "blocks user to access :update from other user's lists changing :list[:user_id] parameter" do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
      new_list_name = "New list name"
      list_params = {:id => list_bart_homework.id, :user_id => user_bart.id,
                     :list => {:user_id => user_john.id, :name => new_list_name, :private => list_bart_homework.private}}

      put :update, list_params
      response.should redirect_to home_path
      flash[:alert].should eq(I18n.t('messages.you_can_only_see_other_users_lists'))
    end

    it "blocks user to access :delete from other user's lists " do
      list_bart_homework = FactoryGirl.find_or_create(:list_bart_homework)
      list_params = {:id => list_bart_homework.id, :user_id => user_bart.id}

      expect {
        delete :destroy, list_params
      }.to_not change(List, :count)
    end

  end

end
