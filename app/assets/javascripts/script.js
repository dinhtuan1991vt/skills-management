$(document).on('page:change', function() {
  $("#location-form").validate({
    rules: {
      "location[latitude]": {
        number: true,
      },
      "location[longitude]": {
        number: true,
      }
    }
  });

  $("#skill-category-form").validate();

  $("#team-form").validate();

  $("#skill-form").validate();

  $("#role-form").validate();

  $("#user-form").validate({
    rules: {
      "user[password_confirmation]": {
        equalTo: "#user_password"
      }
    }
  });

});