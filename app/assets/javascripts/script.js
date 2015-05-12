$(document).ready(function() {
  $("#location-form").validate({
    rules: {
      "location[name]": {
        required: true
      },
      "location[latitude]": {
        number: true,
        required: true
      },
      "location[longitude]": {
        number: true,
        required: true
      }
    }
  });
});