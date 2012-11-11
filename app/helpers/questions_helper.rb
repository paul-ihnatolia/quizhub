module QuestionsHelper
  def button_helper question
    title = 'Next'
    path = "#{question_path(question.id + 1)}"
    if question.id >= Question.all.size
      title = "Finish"
      path  = "#"
    end
  end
end
