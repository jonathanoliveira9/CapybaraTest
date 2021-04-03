require 'spec_helper'
require_relative '../support/helpers/login_helper'

feature 'Register Brand' do
  include Helpers::LoginHelper

  background do
    visit '/'
  end

  scenario 'Displayed Title Modal: Edit Brand' do
    sign_in_as('jonathanoliveira@test.com', '123456')
    click_on('BRANDS')
    first_element = find('.list-group-item-action', match: :first)
    first_element.click
    click_on('Edit')
    expect(page).to have_content('Edit Brand')
  end

  scenario 'Edit Brand Modal: Success to Edit' do
    sign_in_as('jonathanoliveira@test.com', '123456')
    click_on('BRANDS')
    first_element = first_element('.list-group-item-action', match: :first)
    first_element.click
    click_on('Edit')
    fill_in('Nome Fantasia', with: Faker::Game.title)
    click_on('Update')
    expect(page).to have_content('Brand was successfully created')
  end
end
