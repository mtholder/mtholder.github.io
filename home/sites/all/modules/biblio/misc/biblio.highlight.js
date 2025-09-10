Drupal.behaviors.BiblioHighlight = function (context) {
  $('input#biblio-highlight', context).click(function(e) {
    $("div.suspect").toggleClass('biblio-highlight');
  });
};
