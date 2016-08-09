feature "listing spaces" do
  scenario "can see spaces" do
    expect(page).to_not have_content("Title:")
  end
end
