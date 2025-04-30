require 'rails_helper'

RSpec.describe "Tasks API", type: :request do
  describe "GET /tasks" do
    before { create_list(:task, 10, :with_content) }

    it "returns all the tasks" do
      get tasks_path 

      expect(response).to have_http_status(:ok)
      expect(parsed_body).to all(
        match(a_hash_including("id" => be_an(Integer), "name" => be_a(String), "content" => be_a(String)))
      )
    end
  end

  describe "POST /tasks" do
    let(:task) { build(:task, :with_content) }

    context "when the payload is valid" do
      it "creates and return a new task" do
        expect {
          post tasks_path, params: { name: task.name, content: task.content }
        }.to change { Task.count }.by(1)

        expect(response).to have_http_status(:created)
        expect(parsed_body).to match(
          a_hash_including("id" => be_an(Integer), "name" => task.name, "content" => task.content)
        )
      end
    end

    context "when the payload is invalid" do
      it "returns a 400 bad request with an error message" do
        expect {
          post tasks_path, params: { name: nil, content: task.content }
        }.to change { Task.count }.by(0)

        expect(response).to have_http_status(:bad_request)
        expect(parsed_body).to include("name" => ["can't be blank"])
      end
    end
  end

  describe "GET /tasks/:id" do
    context "when the task exists" do
      let!(:task) { create(:task, :with_content) }

      it "returns the requested task" do
        get task_path(task.id)

        expect(response).to have_http_status(:ok)
        expect(parsed_body).to include("id","name","content")
        expect(parsed_body).to match(
          a_hash_including("id" => task.id, "name" => task.name, "content" => task.content)
        )
      end
    end

    context "when the task doesn't exist" do
      it "returns a 400 bad request with an error message" do
        get task_path(-1)

        expect(response).to have_http_status(:bad_request)
        expect(parsed_body).to include("message" => "task doesn't exist!")
      end
    end
  end
end
