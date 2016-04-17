feature "Playing a new game" do
  scenario "When I click 'hit', I pick up an extra card" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Submit"
    click_button "Hit"
    expect(page).to have_css "p.card2"
  end
end
