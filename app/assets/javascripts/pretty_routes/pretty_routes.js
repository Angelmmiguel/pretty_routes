// Globals
var helper_suffix;

$(document).ready(function(){
  $('#search-routes').focus();
  helper_suffix = '_path';
});

$(document).on('click', '.path-helper', function(e) {
  e.preventDefault();
  var suffix = $(this).data('route-helper');

  // Return, nothing todo here
  if (helper_suffix === suffix) { return; }

  // Update!
  $('span.helper').html(suffix);
  helper_suffix = suffix;
});

// Listener to search
$(document).on('input', '#search-routes', function(){
  var $el = $(this),
      value = $el.val(),
      found_count = 0;

  if(value.length < 2) {
    $('#route_table tbody tr').show();
    $('tr.empty').hide();
    $('span.highlight').each(function(){
      $(this).replaceWith($(this).text());
    });
    return;
  }

  $('#route_table tbody tr.route_row').each(function(index) {
    var $row = $(this),
        found = false;

    $row.find('td').each(function(){
      var $col = $(this);

      if (!$col.hasClass('verb') && !$col.hasClass('constraints')) {
        var text = $col.data('value');

        if(text.indexOf(value) > -1){
          text = text.replace(value, '<span class="highlight">' + value + '</span>');
          found = true;
        }

        if($col.hasClass('helper') && text !== ''){
          text = text + helper_suffix;
        }

        // Add text
        $col.html(text);
      }

    });

    if (found) {
      $row.show();
      found_count++;
    } else {
      $row.hide();
    }

  });

  // Check if found_count
  if (found_count == 0) {
    $('tr.empty td').html('There are not any coincidence for <b>' + value + '</b>');
    $('tr.empty').show();
  } else {
    $('tr.empty').hide();
  }
});
