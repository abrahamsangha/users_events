$(document).ready(function($) {
  $("#new").submit(function(event){
    event.preventDefault();
    // alert("clicked");
    var eventName = $("input[name='event[name]']").val();
    var location = $("input[name='event[location]']").val();
    var start = $("input[name='event[starts_at]']").val();
    var end = $("input[name='event[ends_at]']").val();
    alert(start);
    var data = {eventName: eventName, location: location};
    $.post("/events/create", data, function(response) {
    })

  })
  // Stuff to do as soon as the DOM is ready;
});



// Create a new event
// <form id="new" action="/events/create" method="post">
//   Event Name: <input type="text" name="event[name]">
//   Location: <input type="text" name="event[location]">
//   Start Date and Time: <input type="text" name="event[starts_at]">
//   End Date and Time: <input type="text" name="event[ends_at]">
//   <input type="submit" value="Submit">
// </form>
