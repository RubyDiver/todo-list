class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: [:destroy]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)

    redirect_to @todo_list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo List item was deleted"
    else
      flash[:error] = "Todo List item could not be deleted"
    end
    redirect_to @todo_list
  end


  private

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:body)
  end
end
