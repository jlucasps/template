FactoryGirl.define do

  factory :favorite_john_public, :class => Favorite do
    list_id {FactoryGirl.find_or_create(:list_john_public_list).id }
    user_id { FactoryGirl.find_or_create(:user_john).id }
  end

  factory :favorite_john_private, :class => Favorite do
    list_id {FactoryGirl.find_or_create(:list_john_private_list).id }
    user_id { FactoryGirl.find_or_create(:user_john).id }
  end

  factory :favorite_john_bart_homework, :class => Favorite do
    list_id {FactoryGirl.find_or_create(:list_bart_homework).id }
    user_id { FactoryGirl.find_or_create(:user_john).id }
  end

  factory :favorite_bart_movies_to_watch, :class => Favorite do
    list_id {FactoryGirl.find_or_create(:list_bart_movies_to_watch).id }
    user_id { FactoryGirl.find_or_create(:user_bart).id }
  end

end