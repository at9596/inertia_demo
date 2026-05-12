class TasksController < ApplicationController
  def index
    tasks= Task.order(created_at: :desc).as_json
    render inertia: 'Tasks/Index', props: {
      tasks: tasks
    }
  end
end
