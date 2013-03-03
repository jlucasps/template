FactoryGirl.define do
  factory :user_john, :class => User do
    name "John Doe"
    email "johndoe@email.com"
    password "secret"
  end
end