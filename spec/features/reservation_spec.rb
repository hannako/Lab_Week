
feature "booking a listing" do
  scenario "can book for a day" do
    sign_up
    add_space
    click_link "Book"
    expect(page).to have_content("Nice Place")
  end
end
