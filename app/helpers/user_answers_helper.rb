module UserAnswersHelper

 def getRightAnswerForQuestionId question_id
  Answer.where(question_id: question_id, right: true)
 end

  def percent(right,all)
   rez = right.to_f/all*100
   rez.round 2
  end

  def current_category
    session[:current_poll_category]
  end

end
