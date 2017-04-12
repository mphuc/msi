function addViewHideToggle() {
	
	jQuery('li.csr-content-region > div').each(function() {
		var h = jQuery(this);
		h.append("<div class='csr-content-region-expand'><a href='javascript:void(0)'>hide -</a></div>");
		h.append("<div class='csr-content-region-collapse'><a href='javascript:void(0)'>view +</a></div>");
	});
	
	jQuery('li.csr-year > div').each(function() {
		var h = jQuery(this);
		h.append("<div class='csr-year-expand'><a href='javascript:void(0)'>hide -</a></div>");
		h.append("<div class='csr-year-collapse'><a href='javascript:void(0)'>view +</a></div>");
	});
		
	bindViewHideToggleClickActions();
	jQuery('.csr-content-region-collapse').hide();
	jQuery('.csr-year-collapse').hide();
	
}

function bindViewHideToggleClickActions() {

	jQuery('.csr-content-region-expand').click(function() {
		var section = jQuery(this).parent().parent();
		section.children('ul').hide();
		jQuery('.csr-content-region-collapse', section).show();
		jQuery(this).hide();
	});
	
	jQuery('.csr-content-region-collapse').click(function() {
		var section = jQuery(this).parent().parent();
		section.children('ul').show();
		jQuery('.csr-content-region-expand', section).show();
		jQuery(this).hide();
	});
	
	jQuery('.csr-year-expand').click(function() {
		var section = jQuery(this).parent().parent();
		section.children('ul').eq(0).hide();
		jQuery('.csr-year-collapse', section).show();
		jQuery(this).hide();
	});
	
	jQuery('.csr-year-collapse').click(function() {
		var section = jQuery(this).parent().parent();
		section.children('ul').eq(0).show();
		jQuery('.csr-year-expand', section).show();
		jQuery(this).hide();
	});
}

