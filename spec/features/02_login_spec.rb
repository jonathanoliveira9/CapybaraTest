require 'spec_helper'

feature 'Login Page: Validate Page Elements' do
  background do
    visit '/users/sign_in'
  end

  scenario 'Displayed Title: Log In' do
   expect(page).to have_css('h2', text: 'Log in') 
  end

  scenario 'Displayed TextBox: Email' do
    expect(page).to have_field('Email')
  end

  scenario 'Displayed TextBox: Password' do
    expect(page).to have_field('Password')
  end

  scenario 'Displayd Button: Login' do
    expect(page).to have_button('Log in')
  end
end

feature 'Login Page: Invalid Credentials Display Alert to User' do
  background do
    visit '/users/sign_in'
  end
  
  scenario 'jonathanoliveira@test.com / wrong_password: Invalid Email or password' do
    error_message = 'Invalid Email or password'
    fill_in('Email', with: 'jonathanoliveira@test.com')
    fill_in('Password', with: Faker::Internet.password)
    click_button('Log in')
    expect(page).to have_content(error_message)
  end
end

feature 'Login Page: Valid Credentials Signed in successfully ' do
  background do
    visit '/users/sign_in'
  end

  scenario 'jonathanoliveira@test.com / 123456' do
    fill_in('Email', with: 'jonathanoliveira@test.com')
    fill_in('Password', with: '123456')
    click_button('Log in')
    expect(page).to have_content('Signed in successfully')
  end
end

feature 'Logout Page: Signed out successfully' do
  background do
    visit '/users/sign_in'
  end

  scenario 'logout' do
    fill_in('Email', with: 'jonathanoliveira@test.com')
    fill_in('Password', with: '123456')
    click_button('Log in')
    find('#dropdownMenuLink').click
    find('.mm-cl-white', text: 'Logout').click
    expect(page).to have_content('Signed out successfully')
  end
end