class TasksController < ApplicationController
  before_action :set_task, only: :show

  def index
    @tasks = Task.all
    render json: @tasks.as_json(only: [:id, :name, :content])
  end

  def show
    unless @task.present? then
      return render json: { message: "task doesn't exist!" }, status: :bad_request
    end

    render json: @task.as_json(only: [:id,:name,:content])
  end

  private

  def set_task
    @task = Task.find_by(id: params[:id])
  end
end
