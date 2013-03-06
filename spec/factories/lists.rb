FactoryGirl.define do

  factory :list_john_public_list, :class => List do
    name "My Public List"
    user_id { FactoryGirl.find_or_create(:user_john).id }
    private false
  end

  factory :list_john_private_list, :class => List do
    name "My Private List"
    user_id { FactoryGirl.find_or_create(:user_john).id }
    private true
  end

  factory :list_bart_homework, :class => List do
    name "Do my homework"
    user_id { FactoryGirl.find_or_create(:user_bart).id }
    private false
  end

  factory :list_bart_movies_to_watch, :class => List do
    name "Movies to Watch"
    user_id { FactoryGirl.find_or_create(:user_bart).id }
    private true
  end

end