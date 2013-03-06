class ListsController < ApplicationController

  before_filter :validate_current_user, :only => [:new, :create]
  before_filter :validate_owner, :only => [:edit, :update, :destroy]

  def home
    @user = current_user
    @other_users = current_user.other_users
  end

  def index
    @user = User.find(params[:user_id])
    @other_users = current_user.other_users
    redirect_to home_path if @user == current_user
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.new
    @list.user = @user
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.new(params[:list])
    @list.user_id = current_user.id
    @list.save
    respond_with @user, @list
  end

  def show
    @list = List.find(params[:id])
    if !@list.is_the_owner?(current_user) and @list.private
      flash[:alert] = t('messages.not_allowed_action_in_private_list') 
      redirect_to home_path
    else
      respond_with @list
    end
  end

  def edit
    @list = List.find(params[:id])
    respond_with @list.user, @list
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes(params[:list])
    respond_with @list.user, @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_with @list.user, @list
  end

private
  def validate_current_user
    if (params[:user_id] and User.find(params[:user_id]) != current_user) or
       (params[:list] and params[:list][:user_id] and User.find(params[:list][:user_id]) != current_user)
      flash[:alert] = t('messages.you_can_only_see_other_users_lists')
      redirect_to home_path
    end
  end

  def validate_owner
    if params[:id] and !List.find(params[:id]).is_the_owner?(current_user)
      flash[:alert] = t('messages.you_can_only_see_other_users_lists')
      redirect_to home_path
    end
  end

end
