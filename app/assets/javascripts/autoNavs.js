//= require bootstrap/scrollspy
globalNextId = 0;
/**
 * Generate navigation links for all headers
 * @method autoNavs
 * @param  {Sttring} content selectior to body text
 * @param  {String} nav selector to navigation
 */
function autoNavs(content, nav) {
  $('h1, h2, h3, h4, h5, h6', content).each(function(i) {
    var head = $(this);
    var text = head.text();
    if (!head.attr('id')) {
      head.attr('id', 'autonav-id-'+(globalNextId++));
    }
    var id = head.attr('id');
    var el = $('<a>');
    el.attr('href', '#'+id);
    el.text(text);
    $('<li>').append(el).appendTo($('ul', nav));

    content.css('position', 'relative');
    $('body').scrollspy({target: nav});
  });
}