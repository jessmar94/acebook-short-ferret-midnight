# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user
      @posts = current_user.posts
    end
  end
end
