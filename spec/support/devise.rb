
include Warden::Test::Helpers
def create_logged_in_user(user_sym)
  user = FactoryGirl.build(user_sym)
  login_as(user, scope: :user)
  user
end
