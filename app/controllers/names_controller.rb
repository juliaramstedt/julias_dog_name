# frozen_string_literal: true

class NamesController < ApplicationController
  def index
    @names = Name.all
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

  private

  def name_params
    params.require(:name).permit(:name)
  end
end
