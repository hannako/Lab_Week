feature "Creation of spaces" do
  scenario "creates a space" do
    visit "/spaces"
    click_link "create a space"
    fill_in :name, with: "Nice Place"
    fill_in :description, with: "Very nice place"
    fill_in :price, with: "136.50"
    click_button "Create"
    expect(page).to have_content("Nice Place")
  end
end
