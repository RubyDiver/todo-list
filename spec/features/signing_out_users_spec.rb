require 'rails_helper'

RSpec.feature "User signing out" do
  before do
    @john = User.create(name: "john", email: "john@example.com", password: "password")

    visit "/"
    click_link "Sign In"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end

  scenario do
    visit "/"
    click_link "Sign Out"

    expect(page).to have_content("Signed out successfully")
    expect(page).not_to have_content("Sign out")
    expect(page.current_path).to eq(root_path)
  end
end