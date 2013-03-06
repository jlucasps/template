# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }
  it { should allow_mass_assignment_of :password_confirmation }
  it { should allow_mass_assignment_of :remember_me }

  it { should_not allow_mass_assignment_of :encrypted_password }
  it { should_not allow_mass_assignment_of :reset_password_token }
  it { should_not allow_mass_assignment_of :reset_password_sent_at }
  it { should_not allow_mass_assignment_of :remember_created_at }
  it { should_not allow_mass_assignment_of :sign_in_count }
  it { should_not allow_mass_assignment_of :current_sign_in_at }
  it { should_not allow_mass_assignment_of :last_sign_in_at }
  it { should_not allow_mass_assignment_of :current_sign_in_ip }
  it { should_not allow_mass_assignment_of :last_sign_in_ip }
  it { should_not allow_mass_assignment_of :failed_attempts }
  it { should_not allow_mass_assignment_of :unlock_token }
  it { should_not allow_mass_assignment_of :locked_at }
  it { should_not allow_mass_assignment_of :authentication_token }
  it { should_not allow_mass_assignment_of :created_at }
  it { should_not allow_mass_assignment_of :updated_at }


  it "check mandatory fields" do
    user = User.new
    user.should have(1).error_on(:name)
  end

  it "creates a valid user" do
    user = FactoryGirl.build(:user_john)
    user.save.should be_true
  end

  describe ".other_users" do
    context "when there are no other users" do
      it "does not return users" do
        current_user = FactoryGirl.create(:user_john)
        current_user.other_users.should be_empty
      end
    end

    context "when there are other users" do
      let(:other_users) {
        [FactoryGirl.create(:user_bart), FactoryGirl.create(:user_homer),
         FactoryGirl.create(:user_lisa), FactoryGirl.create(:user_maggie),
         FactoryGirl.create(:user_marge)]
      }

      it "returns all other users" do
        current_user = FactoryGirl.create(:user_john)
        current_user.other_users().should eq(other_users)
      end

      it "asserts that current_user is not in other_users" do
        current_user = FactoryGirl.create(:user_john)
        current_user.should_not be_in(current_user.other_users)
      end

    end
  end

  describe ".lists" do
    it "checks the relation between user and lists" do
      user_bart = FactoryGirl.find_or_create(:user_bart)
      FactoryGirl.find_or_create(:list_bart_homework)
      FactoryGirl.find_or_create(:list_bart_movies_to_watch)

      user_bart.lists.should eq([FactoryGirl.find_or_create(:list_bart_movies_to_watch), FactoryGirl.find_or_create(:list_bart_homework)])
    end
  end

  describe ".favorites" do
    it "checks the relation between user and favorites" do
      user_john = FactoryGirl.find_or_create(:user_john)
      favorite_john_public = FactoryGirl.find_or_create(:favorite_john_public)
      favorite_john_private = FactoryGirl.find_or_create(:favorite_john_private)

      user_john.favorites.should eq([favorite_john_private, favorite_john_public])
    end
  end

  describe ".favorite?" do
    it "returns true when user has list in his favorites" do
      user_john = FactoryGirl.find_or_create(:user_john)
      favorite_john_public = FactoryGirl.find_or_create(:favorite_john_public)
      favorite_john_private = FactoryGirl.find_or_create(:favorite_john_private)

      user_john.favorite?(FactoryGirl.find_or_create(:list_john_private_list)).should be_true
    end

    it "returns true when user does not have list in his favorites" do
      user_john = FactoryGirl.find_or_create(:user_john)
      FactoryGirl.find_or_create(:favorite_john_public)
      FactoryGirl.find_or_create(:favorite_john_private)

      user_john.favorite?(FactoryGirl.find_or_create(:list_bart_movies_to_watch)).should be_false
    end
  end


  it "checks the default_scope order" do
    FactoryGirl.find_or_create(:user_john)
    FactoryGirl.find_or_create(:user_bart)
    FactoryGirl.find_or_create(:user_homer)
    FactoryGirl.find_or_create(:user_lisa)
    FactoryGirl.find_or_create(:user_maggie)
    FactoryGirl.find_or_create(:user_marge)

    correct_order = [FactoryGirl.find_or_create(:user_bart), FactoryGirl.find_or_create(:user_homer),FactoryGirl.find_or_create(:user_john),
                     FactoryGirl.find_or_create(:user_lisa), FactoryGirl.find_or_create(:user_maggie),FactoryGirl.find_or_create(:user_marge)]
    User.all.should eq(correct_order)
  end

end