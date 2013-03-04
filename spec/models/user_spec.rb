# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do

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

end