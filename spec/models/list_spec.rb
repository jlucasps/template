# -*- coding: utf-8 -*-
require 'spec_helper'

describe List do

  it { should allow_mass_assignment_of :name }
  it { should allow_mass_assignment_of :private }
  it { should_not allow_mass_assignment_of :user_id }
  it { should_not allow_mass_assignment_of :crated_at }
  it { should_not allow_mass_assignment_of :updated_at }

  it "check mandatory fields" do
    list = List.new

    list.should have(1).error_on(:name)
    list.should have(1).error_on(:user_id)
  end

  it "creates a valid List" do
    list = FactoryGirl.build(:list_john_public_list)

    list.save.should be_true
  end

  describe ".is_the_owner?" do
    it "returns true when the user is the owner" do
      user_john = FactoryGirl.find_or_create(:user_john)
      list = FactoryGirl.find_or_create(:list_john_public_list)

      list.is_the_owner?(user_john).should be_true
    end

    it "is returns false when the user is not the owner" do
      user_bart = FactoryGirl.find_or_create(:user_bart)
      list = FactoryGirl.find_or_create(:list_john_public_list)

      list.is_the_owner?(user_bart).should be_false
    end

  end

end