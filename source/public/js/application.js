function pushSurvey(){

  event.preventDefault();

  $.ajax({
    url: '/surveys',
    type: 'POST',
    dataType: "json",
    data: $('.create_form').serialize()
  }).done(function() {

  });

};


$(document).ready(function() {
  $('.survey_submit').on('click', pushSurvey)

});
