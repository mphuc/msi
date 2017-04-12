function clearSearchResults() {
	jQuery('li.csf-level-1, li.csf-level-2, li.csf-level-3').each(function() {
		setState(jQuery(this), 0);
	});
	jQuery('#csr-msg-initial').css('display', 'none');
	jQuery('#csr-msg-no-filters').css('display', 'block');
	jQuery('#csr-content-placeholder').css('display', 'none');
	return false;
}

function expandAllSearchResults() {
	jQuery('li.csr-content-region').each(function() {
		var section = jQuery(this);
		section.children('ul').eq(0).show();
		jQuery('.csr-content-region-collapse', section).hide();
		jQuery('.csr-content-region-expand', section).show();
	});
	
	jQuery('li.csr-year').each(function() {
		var section = jQuery(this);
		section.children('ul').eq(0).show();
		jQuery('.csr-year-collapse', section).hide();
		jQuery('.csr-year-expand', section).show();
	});
}

function collapseAllSearchResults() {
	jQuery('li.csr-content-region').each(function() {
		var section = jQuery(this);
		section.children('ul').eq(0).show();
		jQuery('.csr-content-region-collapse', section).hide();
		jQuery('.csr-content-region-expand', section).show();
	});
	
	jQuery('li.csr-year').each(function() {
		var section = jQuery(this);
		section.children('ul').eq(0).hide();
		jQuery('.csr-year-collapse', section).show();
		jQuery('.csr-year-expand', section).hide();
	});	
}

function handleLevel1Expand(item) {
	return handleExpand(item);
}

function handleLevel1Checkbox(item) {
	li = item.parent();
	if (li.hasClass('csf-state-1')) {
		// The box is selected so deselect it and all children
		jQuery('li.csf-level-2, li.csf-level-3', li).each(function() {
			setState(jQuery(this), 0);
		});
		setState(li, 0);
	} else if (li.hasClass('csf-state-2')) {
		// The box is partially selected so it should be made fully selected now
		jQuery('li.csf-level-2, li.csf-level-3', li).each(function() {
			setState(jQuery(this), 1);
		});
		setState(li, 1);
	} else {
		// The box is not currently checked so select it and all child boxes
		jQuery('li.csf-level-2, li.csf-level-3', li).each(function() {
			setState(jQuery(this), 1);
		});
		setState(li, 1);
	}
	return true;
}

function handleLevel1Title(item) {
	return handleTitle(item);
}

function handleLevel2Expand(item) {
	return handleExpand(item);
}

function handleLevel2Checkbox(item) {
	li = item.parent();
	if (li.hasClass('csf-state-1')) {
		// The box is selected so deselect it and all children
		jQuery('li.csf-level-3', li).each(function() {
			setState(jQuery(this), 0);
		});
		setState(li, 0);
	} else if (li.hasClass('csf-state-2')) {
		// The box is partially selected so it should be made fully selected now
		jQuery('li.csf-level-3', li).each(function() {
			setState(jQuery(this), 1);
		});
		setState(li, 1);
	} else {
		// The box is not currently checked so select it and all child boxes
		jQuery('li.csf-level-3', li).each(function() {
			setState(jQuery(this), 1);
		});
		setState(li, 1);
	}
	updateLevel1();
	return true;
}

function handleLevel2Title(item) {
	return handleTitle(item);
}

function handleLevel3Checkbox(item) {
	checkbox = item.children('img').eq(0);
	return handleLevel3(item, checkbox);
}

function handleLevel3Title(item) {
	checkbox = item.siblings('a.csf-checkbox').eq(0).children('img').eq(0);
	return handleLevel3(item, checkbox);
}

function handleLevel3(item, checkbox) {
	selected = item.parent().hasClass('csf-state-1');
	if (selected) {
		checkbox.attr('src', 'images/custom_search/checkbox_12x12_unchecked.png');
		item.parent().removeClass('csf-state-1').addClass('csf-state-0');
	} else {
		checkbox.attr('src', 'images/custom_search/checkbox_12x12_checked.png');
		item.parent().removeClass('csf-state-0').addClass('csf-state-1');
	}
	updateLevel2();
	return true;
}

function handleExpand(item) {
	expanded = item.parent().children('ul').eq(0).css('display') == 'block';
	if (expanded) {
		item.children('img').eq(0).attr('src', 'images/custom_search/checkbox_9x9_plus.png');
		item.parent().children('ul').eq(0).css('display', 'none');
	} else {
		item.children('img').eq(0).attr('src', 'images/custom_search/checkbox_9x9_minus.png');
		item.parent().children('ul').eq(0).css('display', 'block');
	}
	return false;
}

function handleTitle(item) {
	expanded = item.parent().children('ul').eq(0).css('display') == 'block';
	if (expanded) {
		item.siblings('a.csf-expand').eq(0).children('img').eq(0).attr('src', 'images/custom_search/checkbox_9x9_plus.png');
		item.parent().children('ul').eq(0).css('display', 'none');
	} else {
		item.siblings('a.csf-expand').eq(0).children('img').eq(0).attr('src', 'images/custom_search/checkbox_9x9_minus.png');
		item.parent().children('ul').eq(0).css('display', 'block');
	}
	return false;	
}

/**
 * Updates the second level check boxes based on the current state of the world
 */
function updateLevel2() {
	jQuery('li.csf-level-2').each(function() {
		total = 0;
		selected = 0;
		jQuery('li.csf-level-3', this).each(function() {
			total++;
			if (jQuery(this).hasClass('csf-state-1')) {
				selected++;
			}
		});
		var item = jQuery(this);
		if (selected == 0) {
			setState(item, 0);
		} else if (selected == total) {
			setState(item, 1);
		} else if (selected < total) {
			setState(item, 2);
		}
	});
	updateLevel1();
}

/**
 * Updates the top-level check boxes based on the current state of the world
 */
function updateLevel1() {
	jQuery('li.csf-level-1').each(function() {
		state0 = 0;
		state1 = 0;
		state2 = 0;
		total = 0;
		jQuery('li.csf-level-2', this).each(function() {
			total++;
			if (jQuery(this).hasClass('csf-state-0')) state0++;
			else if (jQuery(this).hasClass('csf-state-1')) state1++;
			else if (jQuery(this).hasClass('csf-state-2')) state2++;
		});
		var item = jQuery(this);
		if (state0 == total) {
			// No children are selected so the top-level box is not selected either
			setState(item, 0);
		} else if (state1 == total) {
			// All children boxes are fully selected so the top-level box is also fully selected
			setState(item, 1);
		} else if (state2 > 0 || state1 > 0) {
			// At least one child is partially or fully selected, so the top-level box is partially selected
			setState(item, 2);
		}
	});
}

/**
 * Sets the state and updates the check box to reflect the state
 */
function setState(item, state) {
	checkbox = item.children('a.csf-checkbox').eq(0).children('img').eq(0);
	if (state == 0) {
		item.removeClass('csf-state-0 csf-state-1 csf-state-2').addClass('csf-state-0');
		checkbox.attr('src', 'images/custom_search/checkbox_12x12_unchecked.png');
	} else if (state == 1) {
		item.removeClass('csf-state-0 csf-state-1 csf-state-2').addClass('csf-state-1');
		checkbox.attr('src', 'images/custom_search/checkbox_12x12_checked.png');
	} else if (state == 2) {
		item.removeClass('csf-state-0 csf-state-1 csf-state-2').addClass('csf-state-2');
		checkbox.attr('src', 'images/custom_search/checkbox_12x12_partial.png');
	}
}

function createSearchFields() {
	var queryParts = new Array();
	
	jQuery('li.csf-level-1.csf-state-1, li.csf-level-1.csf-state-2').each(function() {
		var topLevelKey = jQuery(this).attr('content-key');
	
		jQuery('li.csf-level-2.csf-state-1, li.csf-level-2.csf-state-2', this).each(function() {
			var contentKey = jQuery(this).attr('content-key');
			var leafNodes = new Array();
			var articles = new Array();
			var pdfs = new Array();
			
			jQuery('li.csf-level-3.csf-state-1', this).each(function() {
				leafNodes.push(jQuery(this).attr('content-key'));
				articles.push(jQuery(this).attr('articles'));
				pdfs.push(jQuery(this).attr('pdfs'));
			});
			
			if (leafNodes.length > 0) {
				//var queryPart = contentKey + "=" + encodeURIComponent(topLevelKey + "|" + leafNodes.join(",") + "|" + articles.join(",") + "|" + pdfs.join(","));
				var queryPart = contentKey + "=" + topLevelKey + "|" + leafNodes.join(",") + "|" + articles.join(",") + "|" + pdfs.join(",");
				queryParts.push(queryPart);
			}
		});
	});
	
	return queryParts.join('&');
}

function createSearchRequest() {
	var queryParts = createSearchFields();
	
	if (queryParts.length > 0) {
		var searchUrl = '/customSearch.php?' + queryParts;
		return searchUrl;
	} else {
		return null;	
	}
}

function executeRequest(searchFields) {
	var loadingHtml = "<div style='display:block; margin-left:45%; margin-top:20%; clear:left'><img src='images/custom_search/ajax-loader.gif' /></div>";
											
	jQuery('#csr-msg-initial').css('display', 'none');
	jQuery('#csr-msg-no-filters').css('display', 'none');
	jQuery('#csr-content-placeholder').css('display', 'block');
	jQuery('#csr-content-placeholder').html(loadingHtml)

	jQuery.post( "/customSearch.php", { data: searchFields } )
		.done(function( results ) {
			jQuery('#csr-content-placeholder').html(results);
	});
}

function handleCategory(categoryIds) {
	inTheNews = jQuery.inArray(54, categoryIds);
	if (inTheNews >= 0) {
		var item1 = jQuery('li.csf-level-1.content-by-type > a').first();
		handleLevel1Expand(item1);
		var item2 = jQuery('li.csf-level-2.press > a').first();
		handleLevel2Expand(item2);
		handleLevel2Checkbox(item2);
		var item3 = jQuery('li.csf-level-2.blog > a').first();
		handleLevel2Expand(item3);
		handleLevel2Checkbox(item3);
	} else {
		gfi = jQuery.inArray(47, categoryIds);
		hy = jQuery.inArray(48, categoryIds);
		mm = jQuery.inArray(49, categoryIds);
		converts = jQuery.inArray(50, categoryIds);
		mks = jQuery.inArray(57, categoryIds);
		
		var item1 = jQuery('li.csf-level-1.content-by-type > a').first();
		handleLevel1Expand(item1);
		var item2 = jQuery('li.csf-level-2.insights > a').first();
		handleLevel2Expand(item2);
		if (gfi >= 0) 		jQuery('li.csf-level-3.global-fixed-income > a.csf-level-3.csf-checkbox', item2.parent().children('ul').eq(0)).each(function(e) { handleLevel3Checkbox(jQuery(this)); });
		if (hy >= 0) 		jQuery('li.csf-level-3.high-yield > a.csf-level-3.csf-checkbox', item2.parent().children('ul').eq(0)).each(function(e) { handleLevel3Checkbox(jQuery(this)); });
		if (mm >= 0) 		jQuery('li.csf-level-3.municipal-managers > a.csf-level-3.csf-checkbox', item2.parent().children('ul').eq(0)).each(function(e) { handleLevel3Checkbox(jQuery(this)); });
		if (converts >= 0) 	jQuery('li.csf-level-3.convertibles > a.csf-level-3.csf-checkbox', item2.parent().children('ul').eq(0)).each(function(e) { handleLevel3Checkbox(jQuery(this)); });
		if (mks >= 0) 		jQuery('li.csf-level-3.mackay-shields > a.csf-level-3.csf-checkbox', item2.parent().children('ul').eq(0)).each(function(e) { handleLevel3Checkbox(jQuery(this)); });	
	}
	
	var selected = jQuery('li.csf-level-3.csf-state-1').size();
	if (selected > 0) {
		var searchFields = createSearchFields();
		if (searchFields.length > 0) {
			executeRequest(searchFields);
		}
	}
}

function handleContentTypes(contentTypes) {
	var item1 = jQuery('li.csf-level-1.content-by-type > a').first();
	handleLevel1Expand(item1);

	jQuery.each(contentTypes, function(index, value) {
		jQuery('li.csf-level-2.' + value + ' > a.csf-level-2.csf-checkbox', item1.parent().children('ul').eq(0)).each(function(e) { handleLevel2Checkbox(jQuery(this)); });
	});

	var selected = jQuery('li.csf-level-3.csf-state-1').size();
	if (selected > 0) {
		var searchFields = createSearchFields();
		if (searchFields.length > 0) {
			executeRequest(searchFields);
		}
	}
}

function handleContentByFirmAndTeam(teams) {
	var item1 = jQuery('li.csf-level-1.content-by-firm-and-team > a').first();
	handleLevel1Expand(item1);

	jQuery.each(teams, function(index, value) {
		jQuery('li.csf-level-2.' + value + ' > a.csf-level-2.csf-checkbox', item1.parent().children('ul').eq(0)).each(function(e) { handleLevel2Checkbox(jQuery(this)); });
	});

	var selected = jQuery('li.csf-level-3.csf-state-1').size();
	if (selected > 0) {
		var searchFields = createSearchFields();
		if (searchFields.length > 0) {
			executeRequest(searchFields);
		}
	}
}