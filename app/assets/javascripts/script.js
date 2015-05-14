$(document).on('page:change', function() {
  $(".datepicker").datepicker({
    format: 'yyyy-mm-dd',
  });

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


  $("#qualification-form").validate();

  $('#locations-table').dataTable({
     ajax: $('#locations-table').data('source'),
     pagingType: 'full_numbers',
     serverSide: true,
     responsive: true,
     "columnDefs": [{
      "targets": -1,
      "orderable": false
     }]
  });

});