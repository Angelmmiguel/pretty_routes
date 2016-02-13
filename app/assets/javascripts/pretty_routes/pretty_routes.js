// Globals
var helper_suffix;
var clip;

$(document).ready(function(){
  $('#search-routes').focus();
  helper_suffix = '_path';
  clip = new ZeroClipboard($(".clip-button"));
});

$(document).on('click', '.path-helper', function(e) {
  e.preventDefault();
  var suffix = $(this).data('route-helper'),
      clip = '';

  // Return, nothing todo here
  if (helper_suffix === suffix) { return; }

  // Update!
  $('span.helper').html(suffix);
  // Update buttons

  $('.clip-button').each(function(){
    clip = $(this).attr('data-clipboard-text').replace(helper_suffix, suffix);
    $(this).attr('data-clipboard-text', clip);
  });
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
          text = text + '<span class="helper">' + helper_suffix + '</span>';
          $col.find('.helper-alias').html(text)
        } else {
          // Add text
          $col.html(text);
        }
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
    $('tr.empty td').html('No match for <b>' + value + '</b>');
    $('tr.empty').show();
  } else {
    $('tr.empty').hide();
  }
});
