require 'rails_helper'

RSpec.feature "Listing Todo lists" do

  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")
    @todo_list1 = TodoList.create(title: "THE FIRST ARTICLE", description: "Lorem Ipsum dolor sit amet", user: @john)
    @todo_list2 = TodoList.create(title: "THE SECOND ARTICLE", description: "Lorem Ipsum 2", user: @john)
  end

  scenario "With todo lists created and user not signed in" do

    visit "/"

    expect(page).to have_content("No Todo lists Created")
  end

  scenario "With todo lists created and user signed in" do
    login_as @john
    visit "/"

    expect(page).to have_content(@todo_list1.title)
    expect(page).to have_content(@todo_list1.description)

    expect(page).to have_content(@todo_list2.title)
    expect(page).to have_content(@todo_list2.description)

    expect(page).to have_link(@todo_list2.title)
    expect(page).to have_link(@todo_list1.title)
    expect(page).to have_link("New Todo")
  end
end