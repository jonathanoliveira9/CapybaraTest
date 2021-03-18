require 'spec_helper'

feature 'Visit The-Internet Home Page' do
  background do
    visit '/'
  end

  scenario 'Title: MAD-MUSIC' do
    expect(page).to have_content('MAD-MUSIC')
    expect(page).to have_css('a', text: 'MAD-MUSIC')
  end
end
