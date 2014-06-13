module Seed
  def self.run
    User.destroy_all
    Survey.destroy_all
    Choice.destroy_all
    Question.destroy_all

    User.create(first_name: "Aki", last_name: "Suzuki", email: "akisuzucky@gmail.com", password: "test")
    User.create(first_name: "Allison", last_name: "Wong", email: "azywong@gmail.com", password: "test")

    Survey.create(user_id: 1, title: "My Cool Survey")

    Question.create(text: "What the sh*t???", survey_id: 1)
    Question.create(text: "What the burrito?", survey_id: 1)
    Question.create(text: "What the sandwich!?", survey_id: 1)

    Choice.create(text: "You're cool", question_id: 1)
    Choice.create(text: "You're cooler", question_id: 1)
    Choice.create(text: "You're coolest", question_id: 1)
    Choice.create(text: "You're warm", question_id: 1)

    Choice.create(text: "Sigh...", question_id: 2)
    Choice.create(text: "Numnumnum...", question_id: 2)

    Choice.create(text: "Duuuude", question_id: 3)
    Choice.create(text: "Duuudette", question_id: 3)
    Choice.create(text: "Ice Cream Cones!", question_id: 3)

  end

end

