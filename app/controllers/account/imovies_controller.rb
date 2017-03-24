class Account::ImoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @imovies = current_user.participated_imovies
  end
end
