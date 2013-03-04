class ListsController < ApplicationController

  before_filter :load_other_users

  def home
    @user = current_user
  end

  def index
    @user = User.find(params[:user_id])
    redirect_to home_path if @user == current_user
  end

  def new
    @user = User.find(params[:user_id])
    @list = List.new
    @list.user = @user
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.create(params[:list])
    respond_with @user, @list
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
    redirect_to home_path if !@list.owner?(current_user)
    @user = @list.user
  end

  def update
    @list = List.find(params[:id])
    redirect_to home_path unless @list.owner?(current_user)
    @list.update_attributes(params[:list])
    respond_with @list.user, @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_with @list.user, @list
  end

private
  def load_other_users
    @other_users = current_user.other_users
  end

end
