var expandable_content = jQuery(".expandable").length;
if (expandable_content > 1) {
    //i = 0;
    jQuery(".expandable").each(function(){
        jQuery(this).append("<div class='more'><a href='javascript:void(0)'>+</a></div>").addClass('closed').next('div').hide();
    })
    
    jQuery(".userdocs > ul > li").each(function(){
        jQuery(this).addClass('level0').bind('click',openClose);
    })
    jQuery(".userdocs > ul > li > ul > li").each(function(){
        jQuery(this).addClass('level1').bind('click',openClose);
    })
}


function openClose(event){
    event.stopPropagation();
    if (jQuery(this).hasClass('open')){
        jQuery(this).addClass('closed').removeClass('open').children('ul').slideUp();
        jQuery('.more',this).last('a').text('+');
    }else{
        jQuery(this).addClass('open').removeClass('closed').children('ul').slideDown();
        jQuery('.more',this).last('a').text('-');
    }
}
