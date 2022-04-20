class QuestionsController < ApplicationController
  def show
    @question = Question.find_by id: params[:id]

  end

  def destroy
    @question = Question.find_by id: params[:id]
    @question.destroy
    flash[:success] = 'Question deleted!'
    redirect_to questions_path
  end

  def edit
    @question = Question.find_by id: params[:id]
  end

  def update
    @question = Question.find_by id: params[:id]
    if @question.update question_params
      flash[:success] = 'Question updated!'
      redirect_to questions_path
    else
      render :edit
      # redirect_to edit_question_path(params[:id])
    end
  end

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    # render plain: questions_path
    @question = Question.new question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
    else
      render :new
      # redirect_to new_question_path
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
