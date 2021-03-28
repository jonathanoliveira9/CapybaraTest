require 'spec_helper'
require_relative '../support/helpers/login_helper'
  
feature 'Register Brand' do
  include Helpers::LoginHelper

  background do
    visit '/'
  end

  scenario 'Displayed Title Modal: Register Brand' do
    sign_in_as('jonathanoliveira@test.com', '123456')
    click_on('BRANDS')
    click_on('Novo')
    expect(page).to have_content('Register Brand')
  end

  scenario 'Register Brand Modal: Success to Create' do
    sign_in_as('jonathanoliveira@test.com', '123456')
    click_on('BRANDS')
    click_on('Novo')
    fill_in('brand[fantasy_name]', with: Faker::Game.title)
    fill_in('brand[description]', with: Faker::Lorem.paragraph)
    click_on('New')
    expect(page).to have_content('Brand was successfully created')
  end
end
