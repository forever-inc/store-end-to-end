require 'rails_helper'

RSpec.feature 'Pricing Page:', type: :feature, js: true  do
  scenario "Pricing page renders successfully." do
    visit '/'
    expect(page).to have_text('Pricing')
  end
end
