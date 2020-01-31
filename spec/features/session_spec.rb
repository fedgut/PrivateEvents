# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session feature', type: :feature do
  let(:user_valid) do
    has_x = { name: 'mike', email: 'mikew@monsterinc.com' }
    has_x
  end

  scenario 'login with form' do
    visit login_path
    expect(page).to have_content 'Log in'
    assert_selector "input[name='email']"
    assert_selector "input[type='submit']"
  end

  scenario 'login with valid email' do
    user = User.create(user_valid)
    visit login_path

    fill_in 'email', with: user.email
    click_button 'Log in'
    expect(page).to have_content user.name
    expect(current_path).to eq(user_path(user))
  end

  scenario 'login invalid with empty form' do
    User.create(user_valid)
    visit login_path

    click_button 'Log in'
    expect(page).to have_content 'user not found or invalid email'
  end

  scenario 'logout' do
    user = User.create(user_valid)
    visit login_path

    fill_in 'email', with: user.email
    click_button 'Log in'
    expect(current_path).to eq(user_path(user))

    find("a[href='#{logout_path}']").click

    assert_selector "a[href='#{login_path}']"
  end
end
