// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales
//= require bootstrap-wysihtml5/wysihtml5x-toolbar.js
//= require bootstrap-wysihtml5/handlebars.runtime.min.js
//= require bootstrap-wysihtml5/minimum

$(document).on('ready page:load', function () {

    $('.wysihtml5').wysihtml5({
    	toolbar: {
		    "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
	        "emphasis": true, //Italics, bold, etc. Default true
	        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
	        "html": false, //Button which allows you to edit the generated HTML. Default false
	        "link": true, //Button to insert a link. Default true
	        "image": false, //Button to insert an image. Default true,
	        "color": false, //Button to change color of font
	        "blockquote": true, //Blockquote
	        "size": "10"//default: none, other options are xs, sm, lg
		},
    	locale: 'fr-FR',
    });
});
 
