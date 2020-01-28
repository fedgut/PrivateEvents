# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email].downcase)
    log_in(@user)
    redirect_to user_path(@user)
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end
