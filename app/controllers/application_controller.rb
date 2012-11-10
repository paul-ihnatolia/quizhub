class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_current_answer question_id, right
    if right
      session[:right_answers] = [] unless session.has_key? :right_answers
      session[:right_answers] << question_id
    else
      session[:wrong_answers] = [] unless session.has_key? :wrong_answers
      session[:wrong_answers] << question_id
    end
  end

  def empty_session
    session[:right_answers], session[:wrong_answers] = nil, nil
  end

end
