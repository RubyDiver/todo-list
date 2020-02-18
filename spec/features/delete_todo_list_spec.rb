require 'rails_helper'

RSpec.feature "Deleting Todo list" do
  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")
    login_as @john
    @todo_list = TodoList.create(title: "Loremm", description: "lorem", user: @john)
  end

  scenario "A user deletes a todo list" do

    visit "/"

    click_link @todo_list.title
    click_link "Delete"

  end
end