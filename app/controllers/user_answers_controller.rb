# encoding: utf-8
class UserAnswersController < ApplicationController
  # GET /user_answers
  # GET /user_answers.json
  def index
    unless params[:category].blank?
      #@user_answers = params[:category].eql? 'wrong' ? getWrongUserAnswers : getRightUserAnswers
      @user_answers = []
      if params[:category].eql? 'wrong'
        @user_answers = getWrongUserAnswers
      else
        @user_answers = getRightUserAnswers
      end

      respond_to do |format|
        format.js {}
      end
    else
      @user_answers = UserAnswer.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @user_answers }
      end
    end
  end

  # GET /user_answers/1
  # GET /user_answers/1.json
  def show
    @user_answer = UserAnswer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_answer }
    end
  end

  # GET /user_answers/new
  # GET /user_answers/new.json
  def new
    @user_answer = UserAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_answer }
    end
  end

  # GET /user_answers/1/edit
  def edit
    @user_answer = UserAnswer.find(params[:id])
  end

  # POST /user_answers
  # POST /user_answers.json
  def create
    #temp code(without user registration)
    answer_id_array = params[:answer_id]
    original_question_no = params[:question_orig_no]
    category_id = params[:category_id]
    question = Question.where(original_list_number: original_question_no, poll_category_id: category_id).first
    attempt_no = current_attempt

    right_all = true
    @user_answer = UserAnswer.new(question_id: question.id,
                                 attempt_no: attempt_no)
    begin
      answer_id_array.each do |answer_id|
        answer = Answer.find(answer_id)
        @user_answer.right = false  if !answer.right
        @user_answer.answer << answer
      end
    rescue
      #suppose that answer was empty
      flash[:error] = "Вибери відповідь!"
      redirect_to :back
      return
    end

    if @user_answer.right
      flash[:notice] = "Правильна(-і) відповіді"
    else
      flash[:error] = "Невірна одна чи більше відповідей"
    end
#errrrrrrrrrrors!!
    path_for_redirection = ""
    puts "Question id = #{question.to_s}"
    if question.id == Question.last.id
      path_for_redirection = "/user_answers/finish"
    else
      r_url = path_for_redirection question.original_list_number, category_id
      path_for_redirection = r_url if r_url != nil
    end



    respond_to do |format|
      if @user_answer.save
        format.html { redirect_to path_for_redirection }
        format.json { render json: @user_answer, status: :created, location: @user_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @user_answer.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /user_answers/1
  # PUT /user_answers/1.json
  def update
    @user_answer = UserAnswer.find(params[:id])

    respond_to do |format|
      if @user_answer.update_attributes(params[:user_answer])
        format.html { redirect_to @user_answer, notice: 'User answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_answers/1
  # DELETE /user_answers/1.json
  def destroy
    @user_answer = UserAnswer.find(params[:id])
    @user_answer.destroy

    respond_to do |format|
      format.html { redirect_to user_answers_url }
      format.json { head :no_content }
    end
  end

  def finish
    @wrong_answers = getWrongUserAnswers.uniq
    @right_answers = getRightUserAnswers.uniq
    puts params
    #set_empty_session
=begin
    @right = session[:right_answers].nil? ? [] : session[:right_answers]
    @wrong = session[:wrong_answers].nil? ? [] : session[:wrong_answers]
    empty_session
=end
  end


  private

  def path_for_redirection origin_no,category_id
    origin_no+=1
    #next_question_id = Question.where(original_list_number: origin_no).first.id
    #last_question_id = Question.last.id
#    if last_question_id >= id.to_i
#      flash[:notice] = "last" if last_question_id == id.to_i
 #     puts flash[:notice]
 #     id.to_i + 1
 #   else
 #     nil
 #   end
    "/poll_categories/#{category_id}/questions/#{origin_no}"

  end

  def getWrongUserAnswers
   wrong_answers = []
   user_answers = getAllUserAnswersForCurrentAttempt
   user_answers.each { |u_answer| wrong_answers << u_answer unless u_answer.right }
   wrong_answers
  end

  def getRightUserAnswers
   right_answers = []
   user_answers = getAllUserAnswersForCurrentAttempt
   user_answers.each { |u_answer| right_answers << u_answer if u_answer.right }
   right_answers
  end

  def getAllUserAnswersForCurrentAttempt
    attempt_no = current_attempt
    UserAnswer.where(attempt_no: attempt_no)
  end

end
