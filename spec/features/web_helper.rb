def sign_up(username: 'user1', email: 'user1@gmail.com',
  password: 'password1',
  password_confirmation: 'password1')
  visit '/'
  click_button 'sign_up'
  fill_in :username,         with: username
  fill_in :email,            with: email
  fill_in :password,         with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'add_user'
end


def sign_in(username: 'prashant1', password: 'secret1234')
  visit '/'
  click_button 'sign in'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'submit'
end
