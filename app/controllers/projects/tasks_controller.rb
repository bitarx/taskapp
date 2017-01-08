class Projects::TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, only: [:destroy]

  def create
    @task = Task.new(project: @project);
    @task.assign_attributes(task_params);
    if @task.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@task.project_id)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
