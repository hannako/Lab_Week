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

def add_space
  visit "/users/spaces"
  click_link "create a space"
  fill_in :name, with: "Nice Place"
  fill_in :description, with: "Very nice place"
  fill_in :price, with: "136.50"
  click_button "Create"
end

def sign_up_2(username: 'user2', email: 'user2@gmail.com',
  password: 'password2',
  password_confirmation: 'password2')
  visit '/'
  click_button 'sign_up'
  fill_in :username,         with: username
  fill_in :email,            with: email
  fill_in :password,         with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'add_user'
end
