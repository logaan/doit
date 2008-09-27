class TasksController < ApplicationController
  def index
    @tasks = if params[:user_id]
      User.find(params[:user_id]).tasks
    else
      Task.find(:all)
    end
  end

  def new
    @task = Task.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
