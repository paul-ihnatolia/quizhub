module UserAnswersHelper
 def getRightAnswerForQuestionId question_id
  Answer.where(question_id: question_id, right: true).first.content
 end
end
