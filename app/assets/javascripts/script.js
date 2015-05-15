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

  function customMenu(node) {
    var new_children_path = node.a_attr.new_children_path;
    var items = {};

    if (typeof(new_children_path) !== "undefined") {
      items.createItem = {
        label: "New skill",
        action: function () {
          document.location.href = node.a_attr.new_children_path;
        }
      };
    }

    items.editItem = {
      label: "Edit",
      action: function () {
        document.location.href = node.a_attr.edit_path;
      }
    };

    items.deleteItem = {
      label: "Delete",
      action: function () {
        $("#skills-jstree").jstree("delete_node", node.id);
        $.ajax({
          url: node.a_attr.delete_path,
          type: "POST",
          dataType: "json",
          data: {"_method": "delete"}
        });
      }
    };

    return items;
  }

  $("#skills-jstree")
    .jstree({
      'core' : {
        "check_callback" : true,
        'data' : {
          'url': $("#skills-jstree").data('source')
        }
      },
      "plugins" : ["contextmenu", "sort", "crrm"],
      "contextmenu" : {
          "items" : customMenu
      }
    })
    .on('loaded.jstree', function() {
      $(this).jstree('open_all');
    });
});