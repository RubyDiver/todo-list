class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_list = TodoList.where(:user_id => current_user)
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
  end

  # GET /todo_lists/new
  def new
    @todo_list = current_user.todo_lists.build
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html {redirect_to @todo_list, notice: "Successfully created new todo"}
        format.json {render :show, status: :created, location: @todo_list}
      else
        format.html {render :new}
        format.json {render json: @todo_list.errors, status: :unprocessable_entity}
      end
    end
  end


  # PATCH/PUT /todo_lists/1
  # PATCH/PUT /todo_lists/1.json
  def update
    if @todo_list.update(todo_list_params)
      flash[:success] = "Todo list has been updated"
      redirect_to @todo_list
    else
      flash.now[:danger] = "Todo list has not been updated"
      render :edit
    end
  end


  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy
    redirect_to root_url, notice: 'Todo list has been deleted.'
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Todo item completed"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end
end

