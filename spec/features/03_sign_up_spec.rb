require 'spec_helper'


feature 'Sign-UP User: Validate Page Elements' do
  background do
    visit '/users/sign_up'
  end

  scenario 'Wrong Password confirmation' do
    fill_in('Name', with: Faker::Book.author)
    fill_in('Email', with: 'test@tesc.com')
    fill_in('Password', with: '11233123')
    fill_in('Password confirmation', with: '123213444')
    click_button('Sign up')
    expect(page).to have_css("li", text: "Password confirmation doesn't match Password")
  end
end

