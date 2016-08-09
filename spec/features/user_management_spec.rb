feature 'user sign_up' do
  scenario ' user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user1')
    expect(User.first.username).to eq('user1')
  end
end
