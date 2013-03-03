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

end