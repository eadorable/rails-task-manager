class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # this will find a task refering to the unique id
    @task = find_index
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    # task = Task.new(params[:task])
    task = Task.new(task_params)
    task.save
    redirect_to task_path(task)
  end

  def edit
    @task = find_index
  end

  def update
    find_index.update(task_params)
    redirect_to task_path(find_index)
  end

  def destroy
    find_index.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def find_index
    Task.find(params[:id])
  end
end
