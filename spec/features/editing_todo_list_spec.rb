require 'rails_helper'

RSpec.feature "Editing Todo list" do

  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")
    login_as @john
    @todo_list = TodoList.create(title: "Lorem", description: "lorem", user: @john)
  end

  scenario "A user updates todo list" do

    visit "/"

    click_link @todo_list.title
    click_link "Edit"

    fill_in "Title", with: "Update Title"
    fill_in "Description", with: "Update Description"
    click_button "Save"

    expect(page).to have_content("Todo list was successfully updated")
    expect(page.current_path).to eq(todo_list_path(@todo_list))
  end

  scenario "A user fails to updates todo list" do

    visit "/"

    click_link @todo_list.title
    click_link "Edit"

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_button "Save"

    expect(page).to have_content("Todo list has not been updated")
    expect(page.current_path).to eq(todo_list_path(@todo_list))
  end
end