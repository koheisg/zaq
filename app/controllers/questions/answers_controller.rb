class Questions::AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, only: [:edit, :destroy]

  def new
    @answers = @question.answers
    @answer = Answer.new(question: @question)
  end

  def edit
  end

  def create
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.js { render :create, status: :created }
        format.html { redirect_to @answer, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.js { render :error, status: :unprocessable_entity }
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_url(@question.id), notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:content)
    end
end
