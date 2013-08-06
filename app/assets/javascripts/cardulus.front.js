$(document).ready( function() {
	/**
	 * Settings for awesomeCloud
	 *
	 * @link https://github.com/indyarmy/jQuery.awesomeCloud.plugin
	 */
	var settings = {
		"size" : {
			// word spacing, smaller is more tightly packed
			"grid" : 9,

			// font resize factor, 0 means automatic
			"factor" : 1,

			// reduces outliers for more attractive output
			"normalize" : true
		},
		"color" : {
			// background color, transparent by default
			"background" : "rgba(255,255,255,0)",

			// color of the smallest font, if options.color = "gradient"
			"start" : "#20f",

			// color of the largest font, if options.color = "gradient"
			"end" : "rgb(200,0,0)"
		},
		"options" : {
			// if "random-light" or "random-dark", color.start and color.end are ignored
			"color" : "random-dark",

			// 0 is all horizontal, 1 is all vertical
			"rotationRatio" : 0.25,

			// set to 3 for nice printer output; higher numbers take longer
			"printMultiplier" : 1,

			// "highest" to show big words first, "lowest" to do small words first, "random" to not care
			"sort" : "highest"
		},
		// the CSS font-family string
		"font" : "Times New Roman, Times, serif",

		 // the selected shape keyword, or a theta function describing a shape
		"shape" : "square"
	};

	// Added but not tested. Trying to keep the top form from submitting
	$('#values').submit( function( event ) {
		event.preventDefault
	});

	/**
	 * Settings for jQuery UI sliders
	 *
	 * @link http://jqueryui.com/
	 */
	var sliderOptions = {
		// Starting value. Since we're going from 1 to 11, 6 is the middle
		value: $(this).siblings(".weight").val(),

		// Minimum value
		min: 10,

		// Maximum value
		max: 110,

		// Increment value
		step: 10,

		// Adjust the current slider's weight input to match the slider value
		slide: function( event, ui ) {
			$(this).siblings('.weight').val( ui.value );
		},

		// If a previous slider is changed, adjust the weight field for both
		// form and the canvas
		change: function( event, ui ) {
			if (!$(this).siblings('.add-word').size()) {
				var id = $(this).parents('.tag').attr('data-tag');

				$('#cardulus span').each( function() {
					if ($(this).attr('data-tag') == id) {
						$(this).attr('data-weight', ui.value );
					}

					$("#cardulus canvas").remove();
					$("#cardulus").awesomeCloud( settings );
				});
			}
		},
	}

	// Attach the slider to the default slider field
	//$( ".slider" ).slider( sliderOptions );
  $('.slider').each(function(){
  	var sliderOptions = {
  		// Starting value. Since we're going from 1 to 11, 6 is the middle
  		value: $(this).siblings(".weight").val(),

  		// Minimum value
  		min: 10,

  		// Maximum value
  		max: 110,

  		// Increment value
  		step: 10,

  		// Adjust the current slider's weight input to match the slider value
  		slide: function( event, ui ) {
  			$(this).siblings('.weight').val( ui.value );
  		},

  		// If a previous slider is changed, adjust the weight field for both
  		// form and the canvas
  		change: function( event, ui ) {
  			if (!$(this).siblings('.add-word').size()) {
  				var id = $(this).parents('.tag').attr('data-tag');

  				$('#cardulus span').each( function() {
  					if ($(this).attr('data-tag') == id) {
  						$(this).attr('data-weight', ui.value );
  					}

  					$("#cardulus canvas").remove();
  					$("#cardulus").awesomeCloud( settings );
  				});
  			}
  		},
  	}

    $(this).slider( sliderOptions );
  });

	/**
	 * Actions the take place when the '+' is clicked
	 */
	$('#controls').on('click', '.add-word', function(event) {
		event.preventDefault();

		// Gather necessary values from the varius elements withing the parent
		// "tag" <div>
		var id = parseInt($(this).attr('data-tag'));
		var word = $(this).siblings('.word').val();
		var weight = $(this).siblings('.weight').val();

		// Create the id for the soon-to-be-appened form fields
		var newId = id + 1;

		// Build the output for the append operation
		var text = '<div class="tag" data-tag="' + newId + '">';
		text += '<input class="word" type="text" name="tags[]" />';
		text += '<input class="weight" type="hidden" name="weights[]" value="50" />';
		text += '<div class="slider slider-' + newId + '"></div>';
		text += '<a data-tag="' + newId + '" class="add-word" href="1">+</a>';
		text += '</div>';

		// Append the remove link to the end of the current tag
		$(this).parent('div').append('<a data-tag="' + id + '" class="remove-word" href="#">-</a>');

		// Remove the add link from the end of the current tag
		$(this).remove();

		// Append the new form fields
		$("#controls").append( text );
    // $("#controls").append( $("#newSkillForm").html() );

		// Attach a slide to the new form fields
		$(".slider-" + newId).slider(sliderOptions)

		// Remove the Cardulus canvas
		$("#cardulus canvas").remove();

		// Append the new tag data to the #cardulus <div>
		$("#cardulus").append('<span data-weight="' + weight + '" data-tag="' + id + '">' + word + '</span>');

		// Rebuild the Cardulus canvas
		$("#cardulus").awesomeCloud( settings );
	});



	/**
	 * Actions that take place when the '-' is clicked
	 */
	$('#controls').on('click', '.remove-word', function(event) {
		event.preventDefault();

		// Get the current tag's id
		var id = parseInt($(this).attr('data-tag'));

		// Remove all fields associated with the current tag
		$(this).parent('.tag').remove();

		// Loop through the #cardulus <div> and remove the <span> for the
		// current tag.
		$('#cardulus span').each( function() {
			if ($(this).attr('data-tag') == id) {
				$(this).remove();
			}

			// Reset the canvas
			$("#cardulus canvas").remove();
			$("#cardulus").awesomeCloud( settings );
		});
	});
});