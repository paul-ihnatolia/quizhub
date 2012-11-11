class ApplicationController < ActionController::Base
  protect_from_forgery

=begin
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
=end

  def current_attempt
    if !session[:current_attempt].nil?
      session[:current_attempt]
    else
      last_user_answer_attempt = UserAnswer.last.nil? ? 0 : UserAnswer.last.attempt_no.to_i
      session[:current_attempt] = last_user_answer_attempt + 1
      puts "Sesssssssion " + session[:current_attempt].to_s
      session[:current_attempt]
    end
  end

  def set_empty_session
    session[:current_attempt] = nil
    puts "emptyyyyyyyyyyyyyyyyyyyyy!!!"
  end

end
