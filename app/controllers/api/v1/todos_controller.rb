class Api::V1::TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index 
    todos = Todo.all 

    if todos
      render json: todos, status: :ok
    else
      render json: todos.errors, status: :bad_request
    end
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save 
      render json: todo
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params 
    params.require(:todo).permit(:id, :title, :completed)
  end
end
