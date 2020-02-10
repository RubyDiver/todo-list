require 'rails_helper'

RSpec.feature "Deleteing Todo list" do
  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")
    login_as @john
    @todo_list = TodoList.create(title: "Lorem", description: "lorem", user: @john)
  end

  scenario "A user deletes a todo list" do

    visit "/"

    click_link @todo_list.title
    click_link "Delete"

    expect(page).to have_content("Todo list has been deleted")
    expect(current_path).to eq(todo_lists_path)
  end
end