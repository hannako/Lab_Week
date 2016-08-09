feature 'user sign_up' do
  scenario ' user can sign up' do
    visit '/'
    click_button 'sign_up'
    # expect(page).to have_content('enter email')

    fill_in :username,        with: 'user1'
    fill_in :email,            with: 'user1@gmail.com'
    fill_in :password,         with: 'password1'
    fill_in :confirm_password, with: 'password1'

    click_button 'add_user'
    expect(page).to have_content('Welcome, user1')


  end
end
