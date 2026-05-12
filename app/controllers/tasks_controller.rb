class TasksController < ApplicationController
  before_action :find_task, only: %w(destroy)
  def index
    tasks= Task.order(created_at: :desc).as_json
    render inertia: 'Tasks/Index', props: {
      tasks: tasks
    }
  end

  def new
    render inertia: 'Tasks/Create'
  end

   def create
    task = Task.new(task_params)

    if task.save
      tasks= Task.order(created_at: :desc).as_json
      redirect_to tasks_path,
    notice: 'Task created successfully'
    else
      render inertia: 'Tasks/Create',
        props: {
          errors: task.errors
        },
        status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path,
    notice: 'Task deleted successfully'
  end

  private

  def task_params
    params.require(:task)
          .permit(:title, :completed)
  end
  def find_task
    @task = Task.find(params[:id])
  end
end
