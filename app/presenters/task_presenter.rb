class TaskPresenter
  def initialize(task)
    @task = task
  end

  def call
    @task.as_json(only: [:id,:name,:content])
  end
end
