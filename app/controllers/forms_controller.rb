class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  def index
    @forms = current_user.forms
  end

  def show
  end

  def new
    @form = current_user.forms.build
  end

  def create
    @form = current_user.forms.build(form_params)
    if @form.save
      redirect_to @form, notice: 'Form was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @form.update(form_params)
      redirect_to @form, notice: 'Form was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @form.destroy
    redirect_to forms_url, notice: 'Form was successfully destroyed.'
  end

  private

  def set_form
    @form = current_user.forms.find(params[:id])
  end

  def form_params
    params.require(:form).permit(:title, :description)
  end
end
