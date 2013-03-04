class ListsController < ApplicationController

  before_filter :load_other_users

  def home
  end

  def index
    @user_viewed = User.find(params[:user_id])
  end


private
  def load_other_users
    @other_users = current_user.other_users
  end

end
