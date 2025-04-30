class TasksController < ApplicationController
  before_action :set_task, only: :show

  def index
    @tasks = Task.all
    render json: TaskPresenter.new(@tasks).call
  end

  def show
    return task_does_not_exist unless @task.present?
    render json: TaskPresenter.new(@task).call
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_does_not_exist
    render json: { message: "task doesn't exist!" }, status: :bad_request
  end
end
