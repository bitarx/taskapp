class Projects::TasksController < ApplicationController
  before_action :set_project
#  before_action :set_task

  def create
  	@project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to project_path(@project)
    #render 'projects/show'
  end

  private

  def set_project
    @projects = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
