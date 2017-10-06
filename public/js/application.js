$(document).ready(function() {
  $('#result-table').find('tr').hide();
  $('#result-table').find('tr').first().show();
  $('#result-table').find('tr').first().next().addClass('active');
  $('#result-table').find('tr').first().next().show();

  nextButtonLister();
});

var nextButtonLister = function() {
  $('#next-face').on('click', function(e) {
    e.preventDefault();
    var activeRow = $('.active');
    activeRow.hide();
    activeRow.removeClass('active');
    
    activeRow.next().addClass('active');
    activeRow.next().show();
  })
};
