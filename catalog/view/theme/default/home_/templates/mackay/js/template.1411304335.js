var expandable_content = jQuery(".expandable").length;
if (expandable_content > 1) {
    i = 0;
    jQuery(".expandable").each(function(){
        if (i == 0){
            jQuery(this).append("<div class='more'><a href='javascript:void(0)'>close -</a></div>").addClass('open');
        }else{
            jQuery(this).append("<div class='more'><a href='javascript:void(0)'>more +</a></div>").addClass('closed').next('div').hide();
        }
        jQuery(this).bind('click',openClose);
        i++;
    })
}

function openClose(){
    if (jQuery(this).hasClass('open')){
        jQuery(this).removeClass('open').addClass('closed').next('div').slideUp();
        jQuery('.more a',this).text('more +');
    }else{
        jQuery('.more','.expandable.open').children('a').text('more +');
        jQuery('.expandable.open').removeClass('open').addClass('closed').next('div').slideUp();
        jQuery(this).removeClass('closed').addClass('open').next('div').slideDown();
        jQuery('.more a',this).text('close -');
    }
}

function createCookie(name, value, days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		var expires = "; expires=" + date.toGMTString();
	}
	else var expires = "";
	document.cookie = name + "=" + value + expires + "; path=/";
}
	
function createInfiniteCookie(name, value) {
	var date = new Date();
	date.setTime(2147483647);  // see: http://stackoverflow.com/questions/3290424/set-a-cookie-to-never-expire
	var expires = "; expires=" + date.toGMTString();
	document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}