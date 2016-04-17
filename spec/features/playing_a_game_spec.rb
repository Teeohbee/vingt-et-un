feature "Playing a new game" do
  scenario "When I click 'hit', I pick up an extra card" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Play"
    click_button "Hit"
    expect(page).to have_css "p.playercard2"
  end

  scenario "When I click 'stick', the current player changes to dealer" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Play"
    click_button "Stick"
    expect(page).to have_content "Current player - Dealer"
    expect(page).to have_css "p.dealercard1"
  end

  scenario "When I click 'Dealer\'s turn', the dealer picks up a card" do
    visit "/"
    click_button "New Game"
    fill_in('playername', :with => 'Toby')
    click_button "Play"
    click_button "Stick"
    click_button "Dealer's turn"
    expect(page).to have_css "p.dealercard2"
  end
end
