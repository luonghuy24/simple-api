require 'rails_helper'
require 'rspec_api_documentation/dsl'
require 'acceptance_helper'

resource "Todos" do
  # get "/todos" do
  #   example "Listing todos" do
  #     do_request

  #     status.should == 200
  #   end
  # end

  let!(:todos) { create_list(:todo, 10) }
  let(:todo) { todos.first }

  get "/todos" do
    parameter :page, "Current page of orders"

    let(:page) { 1 }

    example_request "Getting a list of todos" do
      expect(response_body).to eq(Todo.all.to_json)
      expect(status).to eq(200)
      expect(JSON.parse(response_body)).not_to be_empty
      expect(JSON.parse(response_body).size).to eq(10)
    end
  end

  get "/todos/:id" do
    let(:id) { todo.id }

    example_request "Getting a specific todo" do
      expect(response_body).to eq(todo.to_json)
      expect(status).to eq(200)
    end
  end

  delete "/todos/:id" do
    let(:id) { todo.id }

    example_request "Deleting a todo" do
      expect(status).to eq(204)
    end
  end

  put "/todos/:id" do
    parameter :title, "Title of a todo", :scope => :todo

    let(:id) { todo.id }
    let(:title) { "Updated title" }

    let(:raw_post) { params.to_json }

    example_request "Updating a todo" do
      expect(status).to eq(204)
    end
  end

  post "/todos" do
    parameter :title, "Title of todo", :required => true, :scope => :todo
    parameter :created_by, "Created_by", :required => true, :scope => :todo

    response_field :id, "Id of todo", :scope => :todo, "Type" => "Integer"
    response_field :created_by, "Id of creator", :scope => :todo, "Type" => "Integer"
    response_field :title, "Title of todo", :scope => :todo, "Type" => "String"

    let(:title) { "new todo" }
    let(:created_by) { 1 }

    let(:raw_post) { params.to_json }

    example_request "Creating a new todo" do
      explanation "First, create an order, then make a later request to get it back"

      # todo = JSON.parse(response_body)
      # expect(todo.except("created_at", "updated_at")).to eq({
      #   "title" => title
      # })
      # expect(status).to eq(201)

      # client.get(URI.parse(response_headers["location"]).path, {}, headers)
      # expect(status).to eq(200)
    end
  end
end