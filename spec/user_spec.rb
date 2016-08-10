describe User do

  let!(:user) do
    User.create(username: 'prashant1',
                email: 'prashant1@gmail.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  it "authenticates when given valid login details" do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user

  end

  it "does not authenticate when given invalid password" do
    bad_user = User.authenticate('prashant1', 'secret567')
    expect(bad_user).to be nil
  end

end
