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

  function setDatatable(tableId) {
    $(tableId).dataTable({
     ajax: $(tableId).data('source'),
     pagingType: 'full_numbers',
     serverSide: true,
     responsive: true,
     "columnDefs": [{
      "targets": -1,
      "orderable": false
     }]
  });
  }

  setDatatable("#locations-table");
  setDatatable("#skills-table");
  setDatatable("#teams-table");
  setDatatable("#roles-table");
  setDatatable("#users-table");
  setDatatable("#qualifications-table");

  $("#skills-jstree")
    .jstree({
      'core' : {
        'data' : {
          'url': $("#skills-jstree").data('source'),
        }
      }
    })
    .on('loaded.jstree', function() {
      $(this).jstree('open_all');
    });
});