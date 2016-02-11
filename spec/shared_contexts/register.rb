RSpec.shared_context "register" do
  def register
    click_on 'Register'
    expect(page).to have_text('Sign up for Forever')
    fill_in 'new_firstname', with: 'John'
    fill_in 'new_lastname', with: 'Smith'
    fill_in 'new_email', with: "jsmith#{SecureRandom.uuid}@example.com"
    fill_in 'new_password', with: 'password'
    find('label[for=agree] .checkbox-visual').click
    click_on 'Sign Up'
  end
end
