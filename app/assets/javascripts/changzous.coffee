# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(->
	window.finger = new Fingerprint({canvas: true}).get()
	$.get('/changzous/check',{finger:window.finger},(ret)->
		if ret.cz
			unless window.location.href.indexOf('share') > 0 
				window.location.href='/changzous/share'
	)
	$('#changzou_finger').val(window.finger)
)