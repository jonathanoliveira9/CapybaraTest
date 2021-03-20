require 'spec_helper'
module Helpers
  module LoginHelper
    def sign_in_as(email, password)
      visit '/users/sign_in'
      fill_in('Email', with: email)
      fill_in('Password', with: password)
      click_button('Log in')
    end
  end
end
