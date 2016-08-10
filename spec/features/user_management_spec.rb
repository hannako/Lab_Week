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
    sign_in
    expect(page).to have_content 'Welcome, prashant1'
  end

  scenario 'with incorrect creds' do
    sign_in(password: 'secret5678')
    expect(page).to have_content 'Your login details are incorrect'
  end
end

feature 'User signs out' do
  before(:each) do
    User.create(email: 'user@example.com',
                username: 'prashant1',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_in
    click_button 'sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, prashant1')
  end
end
