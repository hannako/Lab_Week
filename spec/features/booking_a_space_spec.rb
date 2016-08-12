feature "Attempt to book a space" do
  before do
    sign_in
    add_space
    click_link "Request to Book"
  end


  scenario "user can request to book a space" do
    fill_in :day, with: "01"
    fill_in :month, with: "02"
    fill_in :year, with: "03"
    click_button "Request"
    expect(page).to have_content("Request for Nice Place for 01/02/03 has been sent ")
  end
end
