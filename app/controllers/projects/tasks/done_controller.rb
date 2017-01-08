class Projects::Tasks::DoneController < ApplicationController
  before_action :set_project
  before_action :set_task

  def update
    @task.update(task_params)
    head :ok
  end

  private

  def set_project
    @projects = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def task_params
    params.require(:task).permit(:done)
  end
end
