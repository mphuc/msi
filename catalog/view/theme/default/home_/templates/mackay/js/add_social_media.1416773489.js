bindContent();

function bindContent() {
	var articlelen = jQuery(".comm-article").length;
	if (articlelen > 0) {
		jQuery('.comm-article').each(function(){
			var link = jQuery('.comm-intro a',this).last().attr('href');
			
			jQuery('a',this).attr('href',link).attr('target','_blank');
		})
	}

	var articlelen = jQuery(".content-article").length;
	if (articlelen > 0) {
		var pdfRegex = /.*images\/pdf\/.*\.pdf/i;
		
		jQuery('.content-article').each(function(){
			var link = jQuery('.content-summary a',this).last().attr('href');
			
			// Exclude the addthis button
			jQuery('a',this).not('.addthis_button_compact').attr('href',link).attr('target','_blank');
			
			// Special handling for the addthis share buttons.. we need to make sure we prepend the full url of the site
			var resolvedURL = resolveURL(link);
			var icon = jQuery('.content-icon a img', this);
			
			// Video's and pdf's need to be handled differently for addthis (we need to bring the user back to the site so they can view it)
			if (icon != null && icon.attr('src').indexOf('video-button') > 0) {
				// Itemid=237 is a placeholder menu item to display shared content on the site in a clean way
				resolvedURL = resolvedURL + '&Itemid=237';
			} else if (link.match(pdfRegex)) {
				var dataKey = jQuery('.content-summary a', this).attr('data-key');
				resolvedURL = window.location.protocol + "//" + window.location.host + window.location.pathname + "?content=" + dataKey				
			}
			
			jQuery('a.addthis_button_compact', this).attr('addthis:url', resolvedURL);		
		});
	}		
	
	// Handling for custom search
	var articlelen = jQuery(".csr-content-article").length;
	if (articlelen > 0) {
		var pdfRegex = /.*images\/pdf\/.*\.pdf/i;
		
		jQuery('.csr-content-article').each(function(){
			var link = jQuery('.csr-content-summary a',this).last().attr('href');
			
			jQuery('a',this).not('.addthis_button_compact, .no-addthis').attr('href',link).attr('target','_blank');	
		});
	}	
	
	// More special handling for custom search (hide the images for all audio/video)
	jQuery('.csr-content-summary img').css('display', 'none');
};

function resolveURL(path) {
	if (path.substring(0,2) == "~/") {
		path = path.substring(1, path.length - 1);
	}
		
    if (path.substring(0,1) == "/") {
		return window.location.protocol + "//" + window.location.host + path;
    }
    return path;
};