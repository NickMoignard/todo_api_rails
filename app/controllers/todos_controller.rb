class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]

    # GET /todos
    def index
       @todos = Todo.all
       json_response(@todos) # Helper Method defined > app/controllers/concerns/response.rb
    end

    # POST /todos
    def create
        @todo = Todo.create!(todo_params)
        # NOTE
        # 'create!' instead of 'create'.
        # The model will raise an exception ActiveRecord::RecordInvalid
        # handling this in the ExceptionHandler module avoids deep nested conditional statements-
        #- inside the controller
        json_response(@todo, :created)
    end

    # GET /todos/:id
    def show
        json_response(@todo)
    end

    # PUT /todo/:id
    def update
        @todo.update(todo_params)
        head :no_content
    end

    # DELETE /todos/:id
    def destroy
        @todo.destroy
        head :no_content
    end

    private
    def todo_params
        # whitelist params
        params.permit(:title, :created_by)
    end

    def set_todo
        @todo = Todo.find(params[:id])
    end
end

