def sign_up
  visit '/'
  click_button 'sign_up'
  fill_in :username,        with: 'user1'
  fill_in :email,            with: 'user1@gmail.com'
  fill_in :password,         with: 'password1'
  fill_in :confirm_password, with: 'password1'
  click_button 'add_user'
end
