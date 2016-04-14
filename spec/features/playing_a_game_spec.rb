feature "Playing a new game" do
  scenario "Once I enter my name, I can see my name" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Submit"
    click_button "Hit"
    expect(page).to have_css "p.card2"
  end
end
