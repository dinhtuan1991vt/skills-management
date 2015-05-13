$(document).on('page:change', function() {
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

  $("#skill-category-form").validate({
    rules: {
      "skill_category[name]": {
        required: true
      }
    }
  });

  $("#team-form").validate({
    rules: {
      "team[name]": {
        required: true
      }
    }
  });

  $("#skill-form").validate({
    rules: {
      "skill[name]": {
          required: true
      },
      "skill[description]": {
        required: true
      }
    }
  });
});