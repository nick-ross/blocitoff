class TodosController < ApplicationController

    def index
      @todos = current_user.todos.where(completed: false)

    end

    def new
      @todo = Todo.new
    end

    def show
      @todo = Todo.find(params[:id])
    end

    def create
      @todo = current_user.todos.build(params[:todo])

      if @todo.save
      redirect_to root_path, notice: 'Your new TODO was saved'
      else
        render "new"
      end
    end

    def edit
      @todo = Todo.find(params[:id])

      if @todo.update_attribute(:completed, true)
        flash[:notice] = "Item."
        redirect_to todo_index_path, :notice => "Item marked as completed."
      else
        redirect_to todo_index_path, :error => "Unable to mark item as completed."
      end
    end

    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy

      redirect_to root_path :notice => "Item deleted."
    end
end