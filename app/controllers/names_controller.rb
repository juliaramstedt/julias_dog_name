# frozen_string_literal: true

class NamesController < ApplicationController
  def index
    @names = Name.all.order(:name)
    @name = Name.new
  end

  def create
    @name = Name.new(name_params)

    if @name.save
      redirect_to names_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @name = Name.find(params[:id])
    if params["button"] == "add"
      @name.votes += 1 
      cookies[:votes] = cookies[:votes].to_i - 1
    end

    if params["button"] == "subtract" && @name.votes > 0
      @name.votes -= 1
      cookies[:votes] = cookies[:votes].to_i + 1
    end

    @name.save!

    redirect_to names_path
  end

  private


  def name_params
    params.require(:name).permit(:name)
  end
end
