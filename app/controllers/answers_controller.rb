class AnswersController < ApplicationController
  def create
    render plain: params
  end
end
