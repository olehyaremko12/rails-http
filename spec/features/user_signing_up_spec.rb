require 'rails_helper'

feature "Registration flow: " do
    scenario "User is signing up with correct data" do
        visit('/users/sign_up')

        within('#new_user') do
            fill_in 'First name', with: 'John'
            fill_in 'Last name', with: 'Smith'
            fill_in 'Birthday', with: '10/08/1995'
            fill_in 'Email', with: 'john@example.com'
            fill_in 'Username', with: 'john.smith'
            fill_in 'Bio', with: 'Ruby guy who loves to code...'
            fill_in 'Password', with: 'sEcReT321'
            fill_in 'Password confirmation', with: 'sEcReT321'
        end

        click_button 'Sign up'

        expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    scenario "User is signing up without filling required information" do
        visit('/users/sign_up')

        click_button 'Sign up'

        expect(page).to have_content "Email can't be blank"
        expect(page).to have_content "Password can't be blank"
    end
end