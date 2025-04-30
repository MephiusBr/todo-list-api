class TasksController < ApplicationController
  before_action :set_task, only: :show

  def index
    @tasks = Task.all
    render json: TaskPresenter.new(@tasks).call
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: TaskPresenter.new(task).call, status: :created
    else
      render json: task.errors, status: :bad_request
    end
  end

  def show
    return task_does_not_exist unless @task.present?
    render json: TaskPresenter.new(@task).call
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params.permit(:name, :content)
  end

  def task_does_not_exist
    render json: { message: "task doesn't exist!" }, status: :bad_request
  end
end
