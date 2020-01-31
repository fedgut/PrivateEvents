# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = (User.find_by(email: params[:email].downcase) unless params[:email].empty?)

    if @user
      log_in(@user)
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'user not found or invalid email'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end
