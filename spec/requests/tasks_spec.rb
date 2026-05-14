require "rails_helper"

RSpec.describe "Tasks", type: :request do
  describe "GET /index" do
    let!(:task1) { create(:task, title: "First Task") }
    let!(:task2) { create(:task, title: "Second Task") }

    it "returns a successful response" do
      get tasks_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "renders new page successfully" do
      get new_task_path

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid params" do
      let(:valid_params) do
        {
          task: {
            title: "Learn Rails",
            completed: false
          }
        }
      end

      it "creates a new task" do
        expect {
          post tasks_path, params: valid_params
        }.to change(Task, :count).by(1)
      end

      it "redirects to tasks index" do
        post tasks_path, params: valid_params

        expect(response).to redirect_to(tasks_path)
      end

      it "sets success flash message" do
        post tasks_path, params: valid_params

        expect(flash[:notice]).to eq("Task created successfully")
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          task: {
            title: nil,
            completed: false
          }
        }
      end

      it "does not create task" do
        expect {
          post tasks_path, params: invalid_params
        }.not_to change(Task, :count)
      end

      it "returns unprocessable entity status" do
        post tasks_path, params: invalid_params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:task) { create(:task) }

    it "deletes the task" do
      expect {
        delete task_path(task)
      }.to change(Task, :count).by(-1)
    end

    it "redirects to tasks index" do
      delete task_path(task)

      expect(response).to redirect_to(tasks_path)
    end

    it "sets success flash message" do
      delete task_path(task)

      expect(flash[:notice]).to eq("Task deleted successfully")
    end
  end
end
