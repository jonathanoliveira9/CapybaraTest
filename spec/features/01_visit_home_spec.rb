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
end
