require 'spec_helper'

feature "Starting a new game" do
  scenario "I am asked to enter my name" do
    visit "/"
    click_button "New Game"
    expect(page).to have_content "Please enter your name"
  end

  scenario "Once I enter my name, I can see my name" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Submit"
    expect(current_path).to eq "/game"
    expect(page).to have_content "Welcome Toby"
  end

  scenario "If I don't enter a name, the page reloads" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => '')
    click_button "Submit"
    expect(current_path).to eq "/gamesetup"
    expect(page).to have_content "Please enter your name"
  end
end
