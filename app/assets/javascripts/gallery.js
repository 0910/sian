$(function(){
	var gallery = $('.gallery-container .gallery-content .span3');
  var galleryWidth = $('.gallery-container .gallery-content').width();
  var galleryContent = $('.gallery-container .gallery-content');

  galeryPos = 0;
  galleryCnt = gallery.size();
  itemMargin = 30*galleryCnt;
  gallerySize = galleryWidth*(galleryCnt/3)+itemMargin;
  galleryContent.css('width', gallerySize);

	$('.gallery .slider-prev').off('click').on('click', function(){
		alert('click');
	})
});