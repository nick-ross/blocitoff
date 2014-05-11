class Api::TodosController < ApplicationController

 before_filter :check_auth
 respond_to :json

  def check_auth
    authenticate_or_request_with_http_basic do |email,password|
      user = User.where(email: email).first
      !user.nil? && user.valid_password?(password)
    end
    warden.custom_failure! if performed?
  end

  def index
    return permission_denied_error unless conditions_met

    todos = Todo.all
    respond_with todos
#    render json: todos, each_serializer: InsecureUserSerializer 
  end

  def show
   respond_with Todo.find(params[:id])
  end

  def create
    respond_with current_user.todos.build(params[:todo])

    #if @todo.save
    #redirect_to root_path, notice: 'Your new TODO was saved'
    #else
    #  render "new"
    #end
    #respond_with Todo.create(params[:todo])
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

  private

  def conditions_met
    true # We're not calling this an InsecureUserSerializer for nothing
  end
end