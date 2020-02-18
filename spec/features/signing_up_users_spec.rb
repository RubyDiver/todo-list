require 'rails_helper'

RSpec.feature "User signing up" do

  scenario "with valid credentials" do

    visit "/"

    click_link "Sign Up"
    fill_in "Name", with: "Pawel"
    fill_in "Email", with: "Pawel@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page.current_path).to eq(root_path)
  end

  scenario "with invalid credentials" do

    visit "/"

    click_link "Sign Up"
    fill_in "Name", with: ""
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""

    click_button "Sign up"
  end
end