require 'rails_helper'

feature "Commenting flow: " do
    before do
      @user = User.create(email: 'john1@example.com', password: 'sEcReT321')

      UserProfile.create(
        username: 'john.smith', first_name: 'John', last_name: 'Smith', user: @user,
        birthday: '10.02.1995', bio: 'Ruby guy who loves to code...'
      )
    end

    let!(:tweet) { 
        Tweet.create(content: 'The weather today is way too hot...', user: @user)
    }

    let!(:another_tweet) {
        Tweet.create(content: 'Today was suprisingly nice day', user: @user)
    }

    let!(:comment) { Comment.create(content: 'Great comment!', user: @user, tweet: tweet) }

    scenario "User comments a tweet" do
        visit '/users/sign_in'

        within("#new_user") do
          fill_in 'Email',    with: @user.email
          fill_in 'Password', with: @user.password
        end
  
        click_button 'Log in'
        
        within("#tweet-#{tweet.id}") do
            find("#comment_content").set("Yes. Agree!")

            click_button "comment"

            comments_section = find("#comments_section")

            expect(comments_section).to have_content "Yes. Agree!"
            expect(comments_section).to have_content "@#{@user.user_profile.username}"
            expect(comments_section).to have_content Comment.last.created_at&.strftime('%D')
        end
        
        within("#tweet-#{another_tweet.id}") do
            expect(find("#comments_section")).not_to have_content "Yes. Agree!"
        end
    end

    scenario "User deletes a comment" do
        visit '/users/sign_in'

        within("#new_user") do
          fill_in 'Email',    with: @user.email
          fill_in 'Password', with: @user.password
        end
  
        click_button 'Log in'

        within("#tweet-#{tweet.id}") do
            within("#comment-#{comment.id}") do
                click_on "Delete"
            end

            expect(page).not_to have_selector("#comment-#{comment.id}")
        end
    end 
end