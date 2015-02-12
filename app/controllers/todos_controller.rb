class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo = Todo.new
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
    if todo.update_attributes(name: params[:name])
      redirect_to todos_path
    else
      render :back
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
