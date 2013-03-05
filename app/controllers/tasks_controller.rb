class TasksController < ApplicationController

  def create
    @task = Task.create(params[:task])
    respond_with @task.list.user, @task.list, @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with @task
  end

  def edit
    @task = Task.find(params[:id])
    respond_with @task
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with @task
  end


end
