def current_user
  @current_user ||= User.find_by_id(session[:id]) if session[:id]
end

def find_taken_surveys(responses)
  responses.map do |response|
    choice = Choice.find_by_id(response.choice_id)
    question = Question.find_by_id(choice.question_id)
    Survey.find_by_id(question.survey_id)
  end
end