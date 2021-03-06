require 'spec_helper'

feature "Starting a new game" do
  scenario "I am asked to enter my name" do
    visit "/"
    click_link "New Game"
    expect(page).to have_content "Please enter your name"
  end

  scenario "Once I enter my name, I can see my name" do
    visit "/"
    click_link "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Play"
    expect(current_path).to eq "/play"
    expect(page).to have_content "Toby"
  end

  scenario "If I don't enter a name, the page reloads" do
    visit "/"
    click_link "New Game"
    fill_in('playername', :with => '')
    click_button "Play"
    expect(current_path).to eq "/gamesetup"
    expect(page).to have_content "Please enter your name"
  end
end
