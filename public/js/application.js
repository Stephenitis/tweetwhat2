$(document).ready(function() {
  $('form').submit(function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        data: $(this).serialize(),
        url: "/tweetfinder"
    }).done( function(data){
    $("#cat").hide();
    $(".gallery").html(data)
    $( ".gallery" ).sortable();
    $( ".gallery" ).disableSelection();
    });
    $("#cat").show()
  });

      
});

