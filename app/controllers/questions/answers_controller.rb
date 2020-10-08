class Questions::AnswersController < ApplicationController
  before_action :set_question
  def create
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    def set_question
      @question = Question.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content)
    end
end
