feature "booking a listing" do

  scenario "can book for a day" do
    add_space
    visit "/spaces"
    click_link "Book"
    expect(page).to have_content("Nice Place")
    # fill_in :start_day , with: "09"
    # fill_in :end_day, with: "10"
    click_button "Reserve it!"
  end
end

feature "displays a calendar" do

  scenario "can book for a day" do
    add_space
    visit "/spaces"
    click_link "Book"
    # expect(page).to have_content("Calendar")
    # expect(page).to have_content("Monday")
    # fill_in :start_day , with: "09"
    # fill_in :end_day, with: "10"
    # click_button "Reserve it!"
    # expect(page).to have_content
  end
end
