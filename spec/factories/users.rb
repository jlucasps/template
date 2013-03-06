FactoryGirl.define do
  factory :user_john, :class => User do
    name "John Doe"
    email "johndoe@email.com"
    password "secret"
    password_confirmation "secret"
    encrypted_password BCrypt::Password.create("secret", :cost => 10)
  end

  factory :user_bart, :class => User do
    name "BartSimpson"
    email "bart@simpson.com"
    password "dirty_boy"
    password_confirmation "dirty_boy"
    encrypted_password BCrypt::Password.create("dirty_boy", :cost => 10)
  end

  factory :user_homer, :class => User do
    name "Homer Simpson"
    email "homer@simpson.com"
    password "duff_beer"
    password_confirmation "duff_beer"
    encrypted_password BCrypt::Password.create("duff_beer", :cost => 10)
  end

  factory :user_lisa, :class => User do
    name "Lisa Simpson"
    email "lisa@simpson.com"
    password "smart_girl"
    password_confirmation "smart_girl"
    encrypted_password BCrypt::Password.create("smart_girl", :cost => 10)
  end

  factory :user_maggie, :class => User do
    name "Maggie Simpson"
    email "maggie@simpson.com"
    password "nursing_nipple"
    password_confirmation "nursing_nipple"
    encrypted_password BCrypt::Password.create("nursing_nipple", :cost => 10)
  end

  factory :user_marge, :class => User do
    name "Marge Simpson"
    email "marge@simpson.com"
    password "blue_power"
    password_confirmation "blue_power"
    encrypted_password BCrypt::Password.create("blue_power", :cost => 10)
  end

end