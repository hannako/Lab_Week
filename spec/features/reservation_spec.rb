feature "booking a listing" do

  before(:each) do
    visit "/spaces"
    click_link "create a space"
    fill_in :name, with: "Nice Place"
    fill_in :description, with: "Very nice place"
    fill_in :price, with: "136.50"
    click_button "Create"
  end

  scenario "can book for a day" do
    visit "/spaces"
    click_link "Book"
    expect(page).to have_content("Nice Place")
    # fill_in :start_day , with: "09"
    # fill_in :end_day, with: "10"
    # click_button "Reserve it!"
    # expect(page).to have_content
  end
end
