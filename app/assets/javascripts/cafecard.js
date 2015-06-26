$(document).on("ready", function(){

  $('cafe-card').click(function(e){
    var current, currentlyClickedCard;
    current = $(this);
    console.log(currentlyClickedCard = current.find('h4').text());
  });

});
