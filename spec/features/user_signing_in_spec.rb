require 'rails_helper'

feature "Authorization flow: " do
    before do
      @user = User.create(email: 'john1@example.com', password: 'sEcReT321')
      
      UserProfile.create(
          username: 'john.smith', first_name: 'John', last_name: 'Smith', user: @user,
          birthday: '10.02.1995', bio: 'Ruby guy who loves to code...'
          )
    end
  
    scenario "Signing in with correct credentials" do
      visit '/users/sign_in'

      within("#new_user") do
        fill_in 'Email',    with: @user.email
        fill_in 'Password', with: @user.password
      end

      click_button 'Log in'

      expect(page).to have_content 'Who is here?'
    end
  
    given(:other_user) { User.new(email: 'other@example.com', password: 'secret') }
  
    scenario "Signing in as another user" do
      visit '/users/sign_in'

      within("#new_user") do
        fill_in 'Email', with: other_user.email
        fill_in 'Password', with: other_user.password
      end

      click_button 'Log in'

      expect(page).to have_content 'Invalid Email or password'
    end

    scenario "Trying reaching app without signing in" do
      visit root_path

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
end