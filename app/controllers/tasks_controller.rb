class TasksController < ApplicationController
  def index
    @tasks = Task.active # เอาเฉพาะที่ยังไม่ลบ
     @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.completed = false
    @task.deleted   = false
    respond_to do |format|
    if @task.save
      format.html { render :index }  # ไม่ redirect ไปไหน จะอยู่หน้าปัจจุบัน
    else
      format.html { render :index, alert: "Save failed" }
    end
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true)
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.update(deleted: true)

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Task was deleted." }
      format.json { render json: { id: @task.id } }
    end
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
