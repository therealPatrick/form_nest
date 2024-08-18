class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = @form.questions
  end

  def show
  end

  def new
    @question = @form.questions.build
  end

  def create
    @question = @form.questions.build(question_params)
    if @question.save
      redirect_to form_question_path(@form, @question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to form_question_path(@form, @question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to form_questions_url(@form), notice: 'Question was successfully destroyed.'
  end

  private

  def set_form
    @form = current_user.forms.find(params[:form_id])
  end

  def set_question
    @question = @form.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content, :question_type)
  end
end