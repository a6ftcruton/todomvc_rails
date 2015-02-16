class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def create
    todo = Todo.new(name: params[:todo][:name])
    if todo.save! 
      redirect_to todos_path
    else
      render :back
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(completed: params[:completed])
      redirect_to todos_path
    else
      render :index 
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      redirect_to todos_path
    else
      render :back
    end
  end
  
end
