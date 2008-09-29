class TasksController < ApplicationController
  before_filter :login_required, :only => [ :new, :create, :edit, :update, :destroy ]

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
    @task = Task.new params['task']
    @task.user = current_user

    if @task.valid?
      @task.save
      flash[:notice] = "New task created successfully!"
      redirect_to tasks_path
    else
      render :action => 'new'
    end
  end

  def show
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    @task.update_attributes params[:task]

    if @task.valid?
      @task.save
      flash[:notice] = "Existing task updated successfully!"
      redirect_to tasks_path
    else
      render :action => 'edit'
    end
  end

  def destroy
  end

end
