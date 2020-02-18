require 'rails_helper'

RSpec.feature "User signing in" do
  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")
  end

  scenario "with valid credentials" do

    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page.current_path).to eq(root_path)
  end
end