# -*- coding: utf-8 -*-
require 'spec_helper'

describe Favorite do

  it { should allow_mass_assignment_of :list_id }
  it { should_not allow_mass_assignment_of :user_id }

  it "check mandatory fields" do
    list = Favorite.new

    list.should have(1).error_on(:list_id)
    list.should have(1).error_on(:user_id)
  end

  it "creates a valid Favorite" do
    user_john = FactoryGirl.find_or_create(:user_john)
    list_john_public_list = FactoryGirl.find_or_create(:list_john_public_list)

    favorite = Favorite.new(:list_id => list_john_public_list.id)
    favorite.user = user_john

    favorite.save.should be_true
  end

  it ".user" do
    favorite_john_public = FactoryGirl.find_or_create(:favorite_john_public)
    user_john = FactoryGirl.find_or_create(:user_john)
    list_john_public_list = FactoryGirl.find_or_create(:list_john_public_list)

    favorite_john_public.user.should eq(user_john)
    favorite_john_public.list.should eq(list_john_public_list)
  end

  it "checks default_scope order" do
    user_john = FactoryGirl.find_or_create(:user_john)
    favorite_john_public = FactoryGirl.find_or_create(:favorite_john_public)
    favorite_john_private = FactoryGirl.find_or_create(:favorite_john_private)
    favorite_john_bart_homework = FactoryGirl.find_or_create(:favorite_john_bart_homework)

    user_john.favorites.should eq([favorite_john_bart_homework, favorite_john_private, favorite_john_public])
  end

  it "validates_uniqueness_of :list_id in :user_id scope" do
    user_john = FactoryGirl.find_or_create(:user_john)
    list_john_public_list = FactoryGirl.find_or_create(:list_john_public_list)
    favorite = Favorite.new(:list_id => list_john_public_list.id)
    favorite.user = user_john

    favorite.save.should be_true

    second_favorite = Favorite.new(:list_id => list_john_public_list.id)
    second_favorite.user = user_john
    second_favorite.save.should be_false
  end

end