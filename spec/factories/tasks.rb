FactoryGirl.define do

  factory :task_john_public_first, :class => Task do
    list_id {FactoryGirl.find_or_create(:list_john_public_list).id }
    description "First Description"
  end

  factory :task_john_public_second, :class => Task do
    list_id {FactoryGirl.find_or_create(:list_john_public_list).id }
    description "Second Description"
  end

end