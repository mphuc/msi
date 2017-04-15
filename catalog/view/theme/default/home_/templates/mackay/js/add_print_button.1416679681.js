var h1 = jQuery('h1.global-fixed-income, h1.high-yield, h1.municipal-managers, h1.convertibles, h1.investment-strategies, h1.consultant-portal, h1.insights-landing');
h1.after("<div id='print-button-div' style='padding-top: 7px; border-bottom: 1px solid #163b5f; height: 18px; display:table;'> \
			<a id='print-button' style='float:left; color: #0a3555; padding-right:5px;' href='javascript:void(0)' onclick='return printPage();'>Print</a> \
			<a id='print-button-img' style='float:left;' href='javascript:void(0)' onclick='return printPage();'><img src='/images/print_button_16x16.png'/></a> \
		  </div> \
		  <br/>");
	
var h1Sub = jQuery('h1.interior');
h1Sub.after("<div id='print-button-div' style='padding-top: 7px; border-bottom: 1px solid #4a88a1; height: 18px; display:table;'> \
			<a id='print-button' style='float:left; color: #4a88a1; padding-right:5px;' href='javascript:void(0)' onclick='return printPage();'>Print</a> \
			<a id='print-button-img' style='float:left;' href='javascript:void(0)' onclick='return printPage();'><img src='/images/print_button_16x16.png'/></a> \
		  </div>");