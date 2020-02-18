require 'rails_helper'

RSpec.feature "Creating Todo List" do
  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")
    login_as @john
  end

  scenario "Creates new Todo list" do
    visit "/"

    click_link "New Todo"

    fill_in "Title", with: "Creating Todo list"
    fill_in "Description", with: "Lorem Ipsum"

    click_button "Save"

    expect(TodoList.last.user).to eq(@john)
    expect(page).to have_content("Successfully created new todo")
    expect(page).to have_content("Signed in as: #{@john.name}")
  end
end

