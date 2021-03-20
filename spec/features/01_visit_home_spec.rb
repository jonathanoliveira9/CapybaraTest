require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/'
  end

  scenario 'Title: MAD-MUSIC' do
    expect(page).to have_content('MAD-MUSIC')
    expect(page).to have_css('a', text: 'MAD-MUSIC')
  end

  scenario 'Current URL: https://madmusic9.herokuapp.com/' do
    expect(page).to have_current_path('https://madmusic9.herokuapp.com/')
  end

  scenario 'Verify Link Exists: Sign Up' do
    expect(page).to have_link('SIGN-UP')
  end

  scenario 'Click Link: Sign Up ==> /users/sign_up' do
    click_link('SIGN-UP')
    expect(page).to have_current_path('/users/sign_up')
  end

  scenario 'Click Dropdown and Sign Up => Navigate to /users/sign_up' do
    find('#dropdownMenuLink').click
    expect(page).to have_css(".mm-cl-white", text: 'SIGN-UP')
    find('.mm-cl-white', text: 'SIGN-UP').click
    expect(page).to have_current_path('/users/sign_up')
  end

  scenario 'Click Dropdown and Sign In => Navigate to /users/sign_in' do
    find('#dropdownMenuLink').click
    expect(page).to have_css(".mm-cl-white", text: 'SIGN-IN')
    find('.mm-cl-white', text: 'SIGN-IN').click
    expect(page).to have_current_path('/users/sign_in')
  end
end
