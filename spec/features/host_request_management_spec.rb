feature 'view request in my space management' do

  scenario 'when no requests have been made' do
    sign_up
    add_space
    click_button 'Manage spaces'
    expect(page).to have_content 'You have 0 requests'
  end

  scenario 'when you have a request' do
    sign_up
    add_space
    click_button 'sign out'
    sign_up_2
    click_button 'Manage spaces'
    expect(page).to have_content 'You have 1 request'
  end
end
