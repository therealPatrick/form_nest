class ResponsesController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  before_action :set_form
  before_action :set_response, only: [:show]

  def index
    @responses = @form.responses
  end

  def show
  end

  def create
    @response = @form.responses.build
    if @response.save
      params[:answers].each do |question_id, content|
        @response.answers.create(question_id: question_id, content: content)
      end
      redirect_to thank_you_path, notice: 'Response was successfully submitted.'
    else
      render :new
    end
  end

  private

  def set_form
    @form = Form.find(params[:form_id])
  end

  def set_response
    @response = @form.responses.find(params[:id])
  end
end