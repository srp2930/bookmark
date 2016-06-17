
feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, poppy@email.com')
    expect(User.first.email).to eq('poppy@email.com')
  end

  scenario "requires a matching password confirmation" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and password confirmation do not match')
  end

  scenario 'I can\'t sign up without an email address' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
  end
  
end
