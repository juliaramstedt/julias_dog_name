# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cookie

  def set_cookie
    cookies[:votes] = 5 unless cookies[:votes].present?
  end
end
