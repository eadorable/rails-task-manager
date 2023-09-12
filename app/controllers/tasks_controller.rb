class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # this will find a task refering to the unique id
    @task = Task.find(params[:id])
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

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
