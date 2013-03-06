# -*- coding: utf-8 -*-
require 'spec_helper'

describe Task do

  it { should allow_mass_assignment_of :list_id }
  it { should allow_mass_assignment_of :description }

  it "check mandatory fields" do
    task = Task.new

    task.should have(1).error_on(:list_id)
    task.should have(1).error_on(:description)
  end

  it "creates a valid Favorite" do
    FactoryGirl.find_or_create(:user_john)
    list_john_public_list = FactoryGirl.find_or_create(:list_john_public_list)
    task = Task.new(:list_id => list_john_public_list.id, :description => "Description")

    task.save.should be_true
  end

  it "checks default_scope order" do
    user_john = FactoryGirl.find_or_create(:user_john)
    list_john_public_list = FactoryGirl.find_or_create(:list_john_public_list)
    task_john_public_first = FactoryGirl.find_or_create(:task_john_public_first)
    task_john_public_second = FactoryGirl.find_or_create(:task_john_public_second)

    list_john_public_list.tasks.should eq([task_john_public_first, task_john_public_second])
  end

end