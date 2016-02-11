require 'rails_helper'

RSpec.feature 'Registration:', type: :feature, js: true  do
  scenario "You can register as a new user." do
    visit '/'
    click_on 'Register'
    expect(page).to have_text('Sign up for Forever')
    fill_in 'new_firstname', with: 'John'
    fill_in 'new_lastname', with: 'Smith'
    fill_in 'new_email', with: "jsmith#{SecureRandom.uuid}@example.com"
    fill_in 'new_password', with: 'password'
    find('label[for=agree] .checkbox-visual').click
    click_on 'Sign Up'

    expect(page).to have_text('Welcome to Forever!')
  end
end
