# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user_valid) do
    has_x = { name: 'mike', email: 'mikew@monsterinc.com' }
    has_x
  end

  describe 'DELETE #destroy' do
    it 'return redirection' do
      delete :destroy
      expect(page).to redirect_to(home_path)
    end
  end

  describe 'POST #create' do
    it 'go to profile on valid log in' do
      user = User.create(user_valid)
      post :create, params: { email: user.email }
      expect(page).to redirect_to user_path(user)
    end
  end
end
