class Questions::LikesController < ApplicationController
  before_action :set_question
  before_action :set_like, only: [:destroy]

  def create
    @like = @question.likes.new(user_id: Current.user.id)

    respond_to do |format|
      if @like.save
        format.js { render :create, status: :created }
        format.html { redirect_to @like, notice: 'Like was successfully created.' }
        format.json { render :show, status: :created, location: @like }
      else
        format.js { render :error, status: :unprocessable_entity }
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to question_url(@question.id), notice: t('.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    def set_like
      @like = @question.likes.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end
end
