FactoryGirl.define do
  factory :user_john, :class => User do
    name "John Doe"
    email "johndoe@email.com"
    password "secret"
  end

  factory :user_bart, :class => User do
    name "BartSimpson"
    email "bart@simpson.com"
    password "dirty_boy"
  end

  factory :user_homer, :class => User do
    name "Homer Simpson"
    email "homer@simpson.com"
    password "duff_beer"
  end

  factory :user_lisa, :class => User do
    name "Lisa Simpson"
    email "lisa@simpson.com"
    password "smart_girl"
  end

  factory :user_maggie, :class => User do
    name "Maggie Simpson"
    email "maggie@simpson.com"
    password "nursing_nipple"
  end

  factory :user_marge, :class => User do
    name "Marge Simpson"
    email "marge@simpson.com"
    password "blue_power"
  end

end