feature 'user sign_up' do
  scenario ' user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user1')
    expect(User.first.username).to eq('user1')
  end

  scenario 'require a matching password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'cannot sign up if email already exists' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
  end
end

feature 'user sign_in' do

  let!(:user)do
    User.create(email: 'user@example.com',
                username: 'prashant1',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with corrent creds' do
    visit '/'
    click_button 'sign in'
    fill_in :username, with: 'prashant1'
    fill_in :password, with: 'secret1234'
    click_button 'submit'
    expect(page).to have_content 'Welcome, prashant1'
  end

  scenario 'with incorrect creds' do
    visit '/'
    click_button 'sign in'
    fill_in :username, with: 'prashant1'
    fill_in :password, with: 'secret5678'
    click_button 'submit'
    expect(page).to have_content 'Your login details are incorrect'
  end






end
