require 'rails_helper'

RSpec.feature 'Checkout flow:', type: :feature, js: true  do
  let(:coupon) { '4444' }

  scenario "A user can complete checkout flow 1." do
    visit '/'

    # Add Payment Plan to cart
    # all('button .fa-shopping-cart').first.click
    find('#digital_art-nav').click

    # Add Art Kit to cart
    sleep 3
    all('button .fa-shopping-cart').first.click
    sleep 3
    find('#cart a').click

    # Cart
    expect(page).to have_current_path('/cart')
    fill_in 'coupon', with: coupon
    click_on 'Apply'
    sleep 5
    fill_in 'First Name', with: 'John'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'new_email', with: "jsmith#{SecureRandom.uuid}@example.com"
    fill_in 'new_password', with: 'password'
    find('label[for=agree] .checkbox-visual').click
    save_and_open_screenshot
    click_on 'Sign Up and Proceed to Checkout'

    expect(page).to have_current_path('/checkout')

    # Checkout
    fill_in 'payment_address_firstname', with: 'John'
    fill_in 'payment_address[lastname]', with: 'Smith'
    fill_in 'payment_address[address_1]', with: 'Address 1'
    fill_in 'payment_address[city]', with: 'City'
    select 'Florida', from: 'payment_address[zone_id]'
    fill_in 'payment_address[postcode]', with: '11111'
    fill_in 'payment_address[telephone]', with: '11111'
    page.execute_script("$('#payment_cc_number').val('4111111111111111')")
    select '2020', from: 'payment[cc_expire_date_year]'
    fill_in 'payment[cc_cvv2]', with: '123'
    click_on 'Proceed to Place Your Order'
    click_on 'Place My Order'

    expect(page).to have_current_path('/success')
    expect(page).to have_text('Activation Code:')
    expect(page).to have_text('download')
    expect(page).to have_text(coupon)

    # Check for Payment Plan - currently does not work
    # visit '/order_history'
    # click_on('Recurring payments')
    # sleep 5
    # save_and_open_screenshot
    # expect(page).to have_text('lkjslkdjfdf')
  end
end
