$(document).ready(function() {

  $('form').submit(function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        data: $(this).serialize(),
        url: "/tweetfinder"
    }).done( function(data){
    $("#cat").hide();
    $(".gallery").html(data);
    $( ".gallery" ).sortable();
    $( ".gallery" ).disableSelection();
    });

    $.ajax({
        type: "POST",
        data: $(this).serialize(),
        url: "/follow/finder"
    }).done(function(data){
        alert("hello");
        $("#sidebar").html(data);
    });

    $("#cat").show();
  });

  var handles = [
                "justsilverman"
                ,"broppler"
                ,"username_eno"
                ,"RyanPMoser"
                ,"alyraz"
                ,"marybethlee11"
                ,"gorillamash"
                ,"sweetaroll"
                ,"OmarRayward"
                ,"BraydenCleary"
                ,"bitbalance"
                ,"allenwlee"
                ,"Eric_Dykstra"
                ,"jkaih"
                ,"stephenitis"
                ,"macnotsean"
                ,"fabsays"
                ,"angie_bui"
                ,"dontmitch"
                ,"iEricAllen"
                ,"180AD"];

$("#handle").autocomplete({
    source: handles,
    autoFill: true,
    selectFirst: true
    });
});

