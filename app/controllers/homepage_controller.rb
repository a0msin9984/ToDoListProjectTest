class HomepageController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.active
  end

  def create
    @task = Task.new(task_params)
    @task.deleted = false
    if @task.save
       @tasks = Task.active.order(created_at: :desc)
      @task = Task.new
      render :index
    else
      @tasks = Task.active.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private
  def task_params
    params.require(:task).permit(:title)
  end
end
