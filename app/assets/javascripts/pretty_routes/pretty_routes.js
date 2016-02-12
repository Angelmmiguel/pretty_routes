function each(elems, func) {
  if (!elems instanceof Array) { elems = [elems]; }
  for (var i = elems.length; i--; ) {
    func(elems[i]);
  }
}

function setValOn(elems, val) {
  each(elems, function(elem) {
    elem.innerHTML = val;
  });
}

function onClick(elems, func) {
  each(elems, function(elem) {
    elem.onclick = func;
  });
}

// Enables functionality to toggle between `_path` and `_url` helper suffixes
function setupRouteToggleHelperLinks() {
  var toggleLinks = document.querySelectorAll('#route_table [data-route-helper]');
  onClick(toggleLinks, function(){
    var helperTxt   = this.getAttribute("data-route-helper");
    var helperElems = document.querySelectorAll('[data-route-name] span.helper');
    setValOn(helperElems, helperTxt);
  });
}

$(document).ready(function(){
  $('#search-routes').focus();
});

// Listener to search
$(document).on('input', '#search-routes', function(){
  var $el = $(this),
      value = $el.val(),
      found_count = 0;

  if(value.length < 3) {
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

      if (!$col.hasClass('verb')) {
        var text = $col.html();
        text = text.replace('<span class="highlight">', '');
        text = text.replace('</span>', '');

        if(text.indexOf(value) > -1){
          text = text.replace(value, '<span class="highlight">' + value + '</span>');
          found = true;
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
