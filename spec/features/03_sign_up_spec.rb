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

  scenario 'Email has already been taken' do
    password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    fill_in('Name', with: Faker::Book.author)
    fill_in('Email', with: 'jonathan@test.com')
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_button('Sign up')
    expect(page).to have_css("li", text: "Email has already been taken")
  end
end

