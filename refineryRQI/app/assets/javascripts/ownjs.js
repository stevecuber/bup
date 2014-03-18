	    $('.fadein img:gt(0)').hide();

		setInterval(function () {
		    $('.fadein :first-child').fadeOut()
				             .next('img')
				             .fadeIn()
				             .end()
				             .appendTo('.fadein');
	    }, 4000); // 4 seconds

	    $('.fadein2 img:gt(0)').hide();

		setInterval(function () {
		    $('.fadein2 :first-child').fadeOut()
				             .next('img')
				             .fadeIn()
				             .end()
				             .appendTo('.fadein2');
	    }, 7000); // 7 seconds

	    $('.fadeinAndroid img:gt(0)').hide();

		setInterval(function () {
		    $('.fadeinAndroid :first-child').fadeOut()
				             .next('img')
				             .fadeIn()
				             .end()
				             .appendTo('.fadeinAndroid');
	    }, 4500); // 4.5 seconds

	    $('.fadeinAndroid2 img:gt(0)').hide();

		setInterval(function () {
		    $('.fadeinAndroid2 :first-child').fadeOut()
				             .next('img')
				             .fadeIn()
				             .end()
				             .appendTo('.fadeinAndroid2');
	    }, 7500); // 7.5 seconds
