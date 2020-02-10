require 'rails_helper'

RSpec.feature "Creating Todo List" do

  before do
    @john = User.create!(name: "John", email: "john@example.com", password: "password")
    login_as @john
  end

  scenario "A user creates a new Todo list" do
    visit "/"

    click_link "New Todo"

    fill_in "Title", with: "Creating Todo list"
    fill_in "Description", with: "Lorem Ipsum"

    click_button "Save"

    expect(TodoList.last.user).to eq(@john)
    expect(page).to have_content("Successfully created new todo")
    expect(page.current_path).to eq(todo_lists_path)
    expect(page).to have_content("Submitted by #{@john.name}")
  end
end
