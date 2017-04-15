// Eloqua code
if (!isMgmtStage && isEloqaOn) {
	var _elqQ = _elqQ || [];
	_elqQ.push(['elqSetSiteId', '1863233908']);
	_elqQ.push(['elqTrackPageView']);

	(function () {
		function async_load() {
			var s = document.createElement('script'); s.type = 'text/javascript'; s.async = true;
			s.src = '//img.en25.com/i/elqCfg.min.js';
			var x = document.getElementsByTagName('script')[0]; x.parentNode.insertBefore(s, x);
		}
		if (window.addEventListener) window.addEventListener('DOMContentLoaded', async_load, false);
		else if (window.attachEvent) window.attachEvent('onload', async_load);
	})();

	var sSite = "";
	try {
		var sReferrer = window.location.pathname;
		var aSite = sReferrer.split("/");
		sSite = aSite[1];
	} catch (e) {}

	if (sSite == "mainstay") {
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-58523764-1', 'auto');
	  ga('send', 'pageview');
	}

	if (trackLogin) {
		var timerId = null, timeout = 5;
		function WaitUntilCustomerGUIDIsRetrieved() {
			if (!!(timerId)) {
				if (timeout == 0) return;
				if (typeof this.GetElqCustomerGUID === 'function') {

					// Get all form data to be submitted
					var dtm = new Date();
					var nHours = dtm.getHours();
					if (nHours == 24) nHours = 0;
					var sDateTime = $.datepicker.formatDate('m/dd/yy', dtm) + " " + (nHours <= 12 ? (nHours == 0 ? 12 : nHours) : nHours - 12) + ":" + dtm.getMinutes() + (nHours < 12 ? "am" : "pm");

					var formData = "elqFormName=AnnuityLoginHistory&elqSiteId=1863233908";
					formData += "&elqCustomerGUID=" + GetElqCustomerGUID();
					formData += "&elqCampaignId=";
					formData += "&emailAddress=" + email;
					formData += "&fullName=" + name;
					formData += "&firmID=";
					formData += "&LoginDateTime=" + sDateTime;

					// Submit the form here
					$.ajax({
						type: "POST",
						url: "https://s1863233908.t.eloqua.com/e/f2",
						data: formData,
						success: function(response) {},
						error: function(jqXHR, status, error) {}
					});
					return;
				}
				timeout -= 1;
			}
			timerId = setTimeout("WaitUntilCustomerGUIDIsRetrieved()", 500);
			return;
		}
		window.onload = WaitUntilCustomerGUIDIsRetrieved;
		_elqQ.push(['elqGetCustomerGUID']);
	}
}

	function TrackRegistration(firstname, lastname, firmname, firmemailaddress) {
		// Get all form data to be submitted
		var formData = "elqFormName=SiteRegistrationForm&elqSiteId=1863233908";
		formData += "&firstname=" + firstname;
		formData += "&lastname=" + lastname;
		formData += "&firmname=" + firmname;
		formData += "&firmemailaddress=" + firmemailaddress;

		// Submit the form here
		$.ajax({
			type: "POST",
			url: "https://s1863233908.t.eloqua.com/e/f2",
			data: formData,
			success: function(response) {},
			error: function(jqXHR, status, error) {}
		});
		return;
	}
	
function currentPage() {
  var page = window.location.pathname;
  if (page[0] === "/") {
    page = page.substr(1)
  }
  return page;
}

function trackVideo(pagePath) {
  var props = { "prop51": pagePath };
  trackEvent(props, "view");
}

function trackPrint() {
  var pagePath = currentPage();
  var props = { "prop52": pagePath };
  trackEvent(props, "print");
}

function trackDownload(filePath, fileType) {
  var props = { "prop53": filePath, "prop54": fileType };
  trackEvent(props, "download");
}

// properties:  map of properties to values to capture for the event
function trackEvent(properties, eventType) {
  /*
  for (var property in properties) {
    if (properties.hasOwnProperty(property)) {
      var eventValue = properties[property];
	  s[property] = eventValue;
	}
  }

  s.linkTrackVars = Object.keys(properties).join(",");
  s.linkTrackEvents = eventType;
  s.events = eventType;
  s.tl(this, eventType === "download" ? "d" : "o");
  */
}

/* SiteCatalyst code version: 1.2.4
Copyright 1996-2011 Adobe, Inc. All Rights Reserved
More info available at http://www.omniture.com */
/************************ Change Log ************************
	H25|2013-07-25
		Fixed issue with eVar35 on event1
		Added prop/eVar14 to all links and page views
		Added Change Log

	AMJS-1.0.3|2013-09-11
		Updated all plugins and functionality to AppMeasurement 1.0.3

	AMJS-1.0.3|2013-10-31
		Corrected issue with pagenames deeper than 5 levels

	AMJS-1.0.3|2013-11-21
		Corrected syntax error

	AMJS-1.0.3|2013-12-16

	AMJS-1.2.4|2014-04-25
		Updated HBX link tracking for AMJS
		Included Agency Portal link tracking exceptions
		Added DFA integration and logic to switch integrations between report suites
		Added plugin to detect flash version in prop6
		Added xlsm to the list of file types to track as downloads
		Upgraded below-the-line code from 1.0.3 to 1.2.4 to support DFA integration

	AMJS-1.2.4|2014-04-30
		Fixed misc code bugs

	AMJS-1.4.1|2014-12-03
		Upgraded below-the-line code from 1.2.4 to 1.4.1 to support visitor ID Service (visitorAPI.js)
		Added join plug-in to fix issue with cross visit participation
		Added s.version in s.contextData.sCodeVersion to avoid update issues; note that code version is available in processing rule
		Updated Cookie Combining Utility to v.5
		Removed commented out setupLinkTrack plug-in
		Added extra condition in setupLinkTrack

*/

if (typeof(scAccount) != "undefined" && scAccount != "null") s_account = scAccount;   // Try to use the config account first

var accountId = "nylmackayshieldsdev";
var href = window.location.href;
if (href.indexOf("//www.mackayshields.com") >= 0 || href.indexOf("//mackayshields.com") >= 0) {
  accountId = "nylmackayshieldsprod";
}
if (typeof(s_account) == "undefined") s_account = accountId; // Default to this 

var s = new AppMeasurement();
s.account=s_account


/*************************** WEBPASS VARS **********************************
/*  This section parses the following WebPASS vars into SiteCatalyst vars:
/*		pagePath, pageTitle, searchParam, audienceId, audienceType
/*/

if (typeof(pageTitle) == "undefined") {
	pageTitle = "";
} else if (pageTitle == "") {
	pageTitle = "home";
} else if (pageTitle == "Page Not Found") {
	s.pageType="errorPage";
}
pageTitle = pageTitle.replace(/[^a-zA-Z0-9\s\?\.\:\,\;\&\-\_\#\$\=\+\/\%\"\'\@\*\(\)\]\[^\|]+/g, '');
if (typeof(audienceSerialNum) != "undefined" && audienceSerialNum != "null") s.eVar71 = audienceSerialNum;
if (typeof(userRole) != "undefined") s.eVar73 = userRole;
s.eVar74 = (typeof(audienceId) != "undefined" ? audienceId : "");
s.eVar75 = (typeof(audienceType) != "undefined" ? audienceType : "");
s.eVar70 = (typeof(keywordSearch) != "undefined" ? keywordSearch : "");
s.eVar2 = (typeof(elq_cpid) != "undefined" ? elq_cpid : "");
s.eVar3 = (typeof(elq_mid) != "undefined" ? elq_mid : "");
s.eVar4 = (typeof(elq_cid) != "undefined" ? elq_cid : "");

/*
var aHier = pagePath.split("/");
var sHier = (typeof(aHier[1]) != "undefined" && aHier[1] != "" ? aHier[1] : "home");
s.channel= (typeof(aHier[2]) != "undefined" && aHier[2] != "" ? aHier[2] : sHier);

for (var i = 2; i < aHier.length; i++) {
	var isRebranded = (typeof(scAccount) != "undefined");
	var sShortMenu = aHier[i].substr(0, 5).toLowerCase();
	var sShortTitle = pageTitle.substr(0, 5).toLowerCase();
	var isTitleRepeated = (sShortMenu == sShortTitle);
	var isLast = (i == aHier.length - 1);

	// Don't do this if the title is Repeated and it's the last in the path
	// Also don't do this if it's a non-rebranded page and the last item
	if (isLast && (isTitleRepeated || !isRebranded)) {
		// Do nothing
	} else {
		if (aHier[i] != "") {
			sHier += ":" + aHier[i];
			eval("s.prop" + (i - 1) + " = \"" + sHier + "\";");
		}
	}
}

s.hier1 = sHier;
*/

s.hier1 = pagePath.replace("/", ":");
s.pageName = pagePath.replace("/", ":");


/************************** CONFIG SECTION **************************/
/* You may add or alter any code config here. */
/* Specify the life time of the cookie in seconds, or */
/* set to "Session" to turn off persistent cookies.   */
s.contextData.sCodeVersion = 'AMJS-'+s.version+'|2014-12-03';
s.cookieLifetime=157680000
/* Conversion Config */
s.currencyCode="USD"
/* Link Tracking Config */
s.trackDownloadLinks=true
s.trackExternalLinks=true
s.trackInlineStats=true		// Enabled by ErikH 10/29/2014 for ClickMap
s.linkDownloadFileTypes="exe,zip,wav,mp3,mov,mpg,avi,wmv,pdf,doc,docx,xls,xlsx,ppt,pptx,xlsm"
s.linkInternalFilters="javascript:,mackayshields.com"
s.linkLeaveQueryString=false
s.linkTrackVars="None"
s.linkTrackEvents="None"
/* Plugin Config */
s.usePlugins=true

/* config for time parting */
s._tpDST = {
2014:'3/9,11/2',
2015:'3/8,11/1',
2016:'3/13,11/6',
2017:'3/12,11/5',
2018:'3/11,11/4',
2019:'3/10,11/3'}

/*HBX Style Link Tracking*/
s.linkTrackVars="prop12,prop13,prop28,prop29,prop30,prop31,prop51,prop52,prop53,prop54"; // page, link, page+link, position

// Clear out any events
s.events = null;

/*Video Variable Mapping */
s.enableVideoTracking=true
if (s.enableVideoTracking) {
  s.loadModule("Media")
  s.Media.autoTrack=false;
  s.Media.trackWhilePlaying=true;
  /* TrackVars and TrackEvents are needed to properly track additional video data points. */
  s.Media.trackVars="events,eVar31,eVar51,prop51,eVar52,eVar53,contextData.bc_tags,contextData.bc_refid,contextData.bc_player,contextData.bc_playertype,contextData.bc_playlist";
  s.Media.trackEvents="event50,event51,event52,event53,event54,event55,event57";
  s.Media.trackMilestones="25,50,75";
  s.Media.segmentByMilestones = true;
  s.Media.trackUsingContextData = true;
  s.Media.contextDataMapping = {
    "a.media.name":"eVar51,prop51",
    "a.media.segment":"eVar52",
    "a.contentType":"eVar53",
    "a.media.timePlayed":"event50",
    "a.media.view":"event51",
    "a.media.segmentView":"event52",
    "a.media.complete":"event57",
    "a.media.milestones":{
      25:"event53",
      50:"event54",
      75:"event55"
    }
  };
};

function s_doPlugins(s) {

	/* 	Concatenate hier1 & pageName
 	Split PageName variables into props 1-5
*/
	if(s.hier1 && !s.hps){
		//s.pageName = s.hier1 + ":" + s.pageName;
		s.hps="";
		var s_hps=s.hier1.split(":");
		// s.channel=s_hps[0];		// Removed by ErikH 11/13/2014 in favor of code in webpass config above

		if(s_hps[1]){s.prop1=s_hps[0]+":"+s_hps[1];}
		else{if(!s.hps){s.hps=s_hps[0];}s.prop1=s.hps;}

		if(s_hps[2]){s.prop2=s.prop1+":"+s_hps[2];}
		else{if(!s.hps){s.hps=s.prop1;}s.prop2=s.hps;}

		if(s_hps[3]){s.prop3=s.prop2+":"+s_hps[3];}
		else{if(!s.hps){s.hps=s.prop2;}s.prop3=s.hps;}

		if(s_hps[4]){s.prop4=s.prop3+":"+s_hps[4];}
		else{if(!s.hps){s.hps=s.prop3;}s.prop4=s.hps;}

		if(s_hps[5]){s.prop5=s.prop4+":"+s_hps[5];}
		else{if(!s.hps){s.hps=s.prop4;}s.prop5=s.hps;}

		if (s_hps.length > 6) {
			for (var hpsl = 6;hpsl<s_hps.length;hpsl++){
				s.prop5+=':'+s_hps[hpsl];
			}
		}
		s.hps=s.prop5;
	}
/* END Concat/Split PageName */

	// SEARCH RESULTS - This section was rewritten by ErikH on 9/13/2013 to support search on all our sites
	if (s.Util.getQueryParam('q') || s.Util.getQueryParam('queryText')) {
		// There are 3 ways the search query can be passed in
		if (typeof(searchParam) != "undefined") s.prop15 = s.eVar15 = searchParam;
		if (!s.prop15) {
			if (s.Util.getQueryParam('q')) s.prop15 = s.eVar15 = s.Util.getQueryParam('q').toLowerCase();
			if (s.Util.getQueryParam('queryText')) s.prop15 = s.eVar15 = s.Util.getQueryParam('queryText').toLowerCase();
		}
		// The search results must be exposed in the layout
		if(!s.prop27) {
			if (typeof(searchResults) != "undefined") s.prop27 = s.eVar27 = searchResults;
		}

		var t_search = s.getValOnce(s.eVar15,'s_ev15',0);
		if(t_search) {
			s.events=s.apl(s.events,"event21",",",2);
		}
	}

	s.prop7 = s.eVar7 = s.getNewRepeat();
	s.prop8 = s.eVar8 = s.getDaysSinceLastVisit();
	s.prop9 = s.eVar9 = s.getTimeParting('h','-5');
	s.prop10 = s.eVar10 = s.getTimeParting('d','-5');
	s.prop11 = s.eVar11 = s.getPercentPageViewed();
	s.prop14 = s.eVar14 = s.getVisID();
	s.eVar23 = s.getVisitNum("m");
	s.prop33 = s.eVar33 = s.getPreviousValue(s.pageName,'gpv_p4','');
	s.eVar31 = s.pageName;

	if(!s.campaign) s.campaign = s.Util.getQueryParam('cmpid')
	s.campaign = s.getValOnce(s.campaign,'s_cmpid',0)

	/* campaign stacking */
	s.eVar60 = s.prop60 = s.crossVisitParticipation(s.campaign,'s_campStack','730','5','>');

	if(!s.eVar1) s.eVar1=s.Util.getQueryParam('cmpidint')
	s.eVar1=s.getValOnce(s.eVar1,'s_cmpidint',0)

	// dupe transactionid into eVar 48
	if(s.transactionID) s.eVar48 = s.transactionID;

	// TODO:  Anything required for MKS here?
	if (s.account == 'newyorklifeprod' || s.account == 'newyorklifedev'){
		/* Online Quote Amount Stacking */
			s.prop65=s.crossVisitParticipation(s.eVar74,'s_c65','1','5','>','event42',0);
	}
	s.prop50=s.contextData.sCodeVersion;

	if (s.linkObject) {
		if(s.linkObject.href.indexOf('FormDisplayHandlerServlet')>-1){
			s.linkType='d';
			s.linkLeaveQueryString=true;
		}
	}

	// if event1 is set, copy pageName to evar35
	if (s.inList(s.events,'event1',',')) {
		s.eVar35=s.pageName;
		s.linkTrackVars = s.apl(s.linkTrackVars,'eVar35',',',2);
	} else {
		s.eVar35='';
	}

    if (s.linkType=='d') { // if Download Link
    	// USE lid from name parameter as linkName if available
    	//s.linkObject.name = s.linkObject.name.replace(/^&/,'?');
    	lid = s.Util.getQueryParam('lid','',s.linkObject.name);
    	if (lid) s.linkName = lid;
    }

	/* HBX Style Link Tracking */
	s.hbx_lt = "auto"
	
	// userId, userId | page, page, link, page+link, position, downloadFile, downloadType
	s.setupLinkTrack("prop12,prop13,prop28,prop29,prop30,prop31,prop51,prop52,prop53,prop54", "SC_LINKS", null, ((s.account=='nylmackayshieldsprod'||s.account=='nylmackayshieldsdev') ? 'Custom Link Tracking - Internal Links' : null));
	
	s.prop12 = userId;
	s.prop13 = userId + " | " + s.pageName;
	
	// Work out the type of the file being downloaded from the url so we can properly track this
	if (s.linkObject && s.linkObject.href && s.linkObject.href.length > 0) {
	  var href = s.linkObject.href;
	  var downloadType, downloadFilePath;
	  // Strip off the domain from the url
	  href = href.replace(/^.*\/\/[^\/]+\//, '');
	  var tokens = href.split(/[?&]+/);
	  for (var i = 0; i < tokens.length; i++) {
	    var token = tokens[i];
		// type= and filepath= cover showReport.php style of downloads
		// filename= is used by download.php (client reports)
	    if (token.startsWith("type=")) {
		  downloadType = token.replace("type=", "");
	    } else if (token.startsWith("filepath=")) {
		  downloadFilePath = token.replace("filepath=", "");
	    } else if (token.startsWith("filename=")) {
		  downloadType = "client_report";
		  downloadFilePath = token.replace("filename=", "");
		}	  
	  }
	  
	  if (s.linkObject.classList.toString().indexOf("prospectus-anchor") >= 0) {
        var startIndex = href.indexOf("images");
	    s.prop53 = (startIndex >= 0) ? href.substring(startIndex) : href;
	    s.prop54 = "prospectus";
	  }
	  
	  // Check if the user has selected a video to watch
	  if (s.linkObject.outerHTML.indexOf("recordVideoAccess") > 0) {
	    // Extract the title of the video which should be stored as an attribute
		var title = s.linkObject.getAttribute("video-title");
		if (title) {
		  s.prop51 = title + " | " + href;
		} else {
		  s.prop51 = href;
		}
	    s.prop54 = "video";  
	  }
	  
	  if (s.linkObject.outerHTML.indexOf("printPage") > 0) {
	    s.prop54 = "print";  
	  }
	  
	  if (downloadType && downloadFilePath) {
	    downloadFilePath = downloadFilePath.replace("/images/pdf_root/", "").replace("/images/pdf/", "");
	    s.prop53 = downloadFilePath;
		s.prop54 = downloadType;
	  }
	}
	
	/* clickPast */
	s.SEMvar=s.Util.getQueryParam('s_kwcid');
	s.SEMvar=s.getValOnce(s.SEMvar,'SEM_var',0);
	s.clickPast(s.SEMvar,'event26','event27');

	/* manageQueryParam v1.2 */
	s.pageURL=s.manageQueryParam('s_kwcid',1,1);

	s.linkTrackVars = s.apl(s.linkTrackVars,'prop14',',',2);
	s.linkTrackVars = s.apl(s.linkTrackVars,'eVar14',',',2);

	/* detect flash version */
	s.detectRIA('s_ria','prop6','','20','','1');

}
s.doPlugins=s_doPlugins
/************************** PLUGINS SECTION *************************/
s.partnerDFACheck=new Function("cfg",""
+"var s=this,c=cfg.visitCookie,src=cfg.clickThroughParam,scp=cfg.sear"
+"chCenterParam,p=cfg.newRsidsProp,tv=cfg.tEvar,dl=',',cr,nc,q,g,gs,i"
+",j,k,fnd,v=1,t=new Date,cn=0,ca=new Array,aa=new Array,cs=new Array"
+";t.setTime(t.getTime()+1800000);cr=s.c_r(c);if(cr){v=0;}ca=cr.split"
+"(dl);aa=s.account.split(dl);for(i=0;i<aa.length;i++){fnd=0;for(j=0;"
+"j<ca.length;j++){if(aa[i]==ca[j]){fnd=1;}}if(!fnd){cs[cn]=aa[i];cn+"
+"+;}}if(cs.length){for(k=0;k<cs.length;k++){nc=(nc?nc+dl:'')+cs[k];}"
+"cr=(cr?cr+dl:'')+nc;s.vpr(p,nc);v=1;}q=window.location.search.toLow"
+"erCase();q=s.replace(q,'?','&');g=q.indexOf('&'+src.toLowerCase()+'"
+"=');gs=(scp)?q.indexOf('&'+scp.toLowerCase()+'='):-1;if(g>-1){s.vpr"
+"(p,cr);v=1;}else if(gs>-1){v=0;s.vpr(tv,'SearchCenter Visitors');}i"
+"f(!s.c_w(c,cr,t)){s.c_w(c,cr,0);}if(!s.c_r(c)){v=0;}return v>=1;");
/*
 * Plugin Utility: Replace v1.0
 */
s.repl=new Function("x","o","n",""
+"var i=x.indexOf(o),l=n.length;while(x&&i>=0){x=x.substring(0,i)+n+x.substring(i+o.length);i=x.indexOf(o,i+l)}return x");

/*
 * Utility Function: vpr - set the variable vs with value v
 */
s.vpr=new Function("vs","v",
"if(typeof(v)!='undefined' && vs){var s=this; eval('s.'+vs+'=\"'+v+'\"')}");

s.getVisID = function() {
		var s=this;
		var vid='';
        var dviCookie = s.c_r('s_vi');
        if (dviCookie.length > 0) {
            var visRegExp = /[0-9A-F]+-[0-9A-F]+/g;
            var dvi = dviCookie.match(visRegExp);
            vid = dvi;
        }
        return vid;
}

s.inList = function(hs,n,d){
	if (typeof hs=='string') {
		d = d?d:',';
		hs = hs.split(d);
	}

	if (hs){
		var i = hs.length;
		while (i--) {
			if (hs[i] === n) {
				return true;
			}
		}
    }
  return false;
}

s.setupLinkTrack=function(vl,c,e,i)
{
	var cv = s.c_r(c);
	if (vl) {
	    var vla = vl.split(',');
	}
	if (cv != '') {
	    var cva = cv.split('^^');
	    for (x in vla) {
	        s[vla[x]] = cva[x];
	        if (e) {
	            s.events = s.apl(s.events, e, ',', 2);
	        }
	    }
	}
	s.c_w(c, '', 0);
	if (typeof s.linkObject != 'undefined' && s.hbx_lt != 'manual') {
	    s.lta = [];
	    if (typeof s.pageName != 'undefined') s.lta[0] = s.pageName;
	    if (typeof s.linkObject != null) {
	        slo = s.linkObject;
	        if (s.linkObject != 0) {
	            if (s.linkObject.getAttribute('name') != null) {
	                var b = s.linkObject.getAttribute('name');
	                if (b.indexOf('&lpos=') > -1) {
	                    s.lta[3] = b.match('\&lpos\=([^\&]*)')[1];
	                }
	                if (b.indexOf('&lid=') > -1) {
	                    s.lta[1] = b.match('\&lid\=([^\&]*)')[1];
	                }
	            }
	        }
	        if (typeof s.lta[1] == 'undefined') {
	            if (s.linkName != 0) {
	                s.lta[1] = s.linkName;
	            } else if (s.linkObject != 0) {
	                if (s.linkObject.innerHTML.indexOf('<img') > -1) {
	                    s.lta[1] = s.linkObject.innerHTML.match('src="([^"]*)')[1]
	                } else {
	                    s.lta[1] = s.linkObject.innerHTML;
	                }
	            }
	        }
	        s.lta[2] = s.pageName + ' | ' + s.lta[1];
	    }
	    if (s.linkType == 0 && i) { // if link is Internal link and Internal link override is enabled
	    		s.linkType = 'o';
				s.linkName = i;
	    	}
	    if (s.linkType != 0) {
	        for (var x = 0; x < vla.length; x++) {
	            s[vla[x]] = s.lta[x];
	            if (e) {
	                s.events = s.apl(s.events, e, ',', 2);
	                s.linkTrackVars = s.apl(s.linkTrackVars, 'events', ',', 2);
	            }
	        }
	        s.linkTrackVars = s.apl(s.linkTrackVars, vl, ',', 2);
	    } else {if(s.lta[1]){
			var tcv = ''; //temporary cookie value
			for(var x=0;x<s.lta.length;x++){ //loop through the s.lta arrays
				tcv+=s.lta[x]+'^^'//write the s.lta value to the tcv var
			}
			s.c_w(c,tcv)//Write the tcv value to the cookie
        }
        }
        s.lta=null;  //Reset the link tracking object to prevent any value from carrying over into the next image request
	}
}

/*
 *  Plug-in: crossVisitParticipation v1.7 - stacks values from
 *  specified variable in cookie and returns value
 */
s.crossVisitParticipation=new Function("v","cn","ex","ct","dl","ev","dv",""
+"var s=this,ce;if(typeof(dv)==='undefined')dv=0;if(s.events&&ev){var"
+" ay=ev.split(',');var ea=s.events.split(',');for(var u=0;u<ay.l"
+"ength;u++){for(var x=0;x<ea.length;x++){if(ay[u]==ea[x]){ce=1;}}}}i"
+"f(!v||v==''){if(ce){s.c_w(cn,'');return'';}else return'';}v=escape("
+"v);var arry=new Array(),a=new Array(),c=s.c_r(cn),g=0,h=new Array()"
+";if(c&&c!=''){arry=c.split('],[');for(q=0;q<arry.length;q++){z=ar"
+"ry[q];z=s.repl(z,'[','');z=s.repl(z,']','');z=s.repl(z,\"'\",'');arry"
+"[q]=z.split(',')}}var e=new Date();e.setFullYear(e.getFullYear()+"
+"5);if(dv==0&&arry.length>0&&arry[arry.length-1][0]==v)arry[arry.len"
+"gth-1]=[v,new Date().getTime()];else arry[arry.length]=[v,new Date("
+").getTime()];var start=arry.length-ct<0?0:arry.length-ct;var td=new"
+" Date();for(var x=start;x<arry.length;x++){var diff=Math.round((td."
+"getTime()-arry[x][1])/86400000);if(diff<ex){h[g]=unescape(arry[x][0"
+"]);a[g]=[arry[x][0],arry[x][1]];g++;}}var data=s.join(a,{delim:',',"
+"front:'[',back:']',wrap:\"'\"});s.c_w(cn,data,e);var r=s.join(h,{deli"
+"m:dl});if(ce)s.c_w(cn,'');return r;");

/*
 * Plugin: s.join 1.0 - s.join(v,p)
 */
s.join=new Function("v","p",""
+"var s=this;var f,b,d,w;if(p){f=p.front?p.front:'';b=p.back?p.back"
+":'';d=p.delim?p.delim:'';w=p.wrap?p.wrap:'';}var str='';for(var x=0"
+";x<v.length;x++){if(typeof(v[x])=='object' )str+=s.join( v[x],p);el"
+"se str+=w+v[x]+w;if(x<v.length-1)str+=d;}return f+str+b;");

/*
 * Plugin: getTimeParting 2.0
 */
s.getTimeParting=new Function("t","z","y","l",""
+"var s=this,d,A,U,X,Z,W,B,C,D,Y;d=new Date();A=d.getFullYear();Y=U=S"
+"tring(A);if(s.dstStart&&s.dstEnd){B=s.dstStart;C=s.dstEnd}else{;U=U"
+".substring(2,4);X='090801|101407|111306|121104|131003|140902|150801"
+"|161306|171205|181104|191003';X=X.split('|');for(W=0;W<=10;W++){Z"
+"=X[W].substring(0,2);if(U==Z){B=X[W].substring(2,4);C=X[W].substrin"
+"g(4,6)}}if(!B||!C){B='08';C='01'}B='03/'+B+'/'+A;C='11/'+C+'/'+A;}D"
+"=new Date('1/1/2000');if(D.getDay()!=6||D.getMonth()!=0){return'Dat"
+"a Not Available'}else{z=z?z:'0';z=parseFloat(z);B=new Date(B);C=new"
+" Date(C);W=new Date();if(W>B&&W<C&&l!='0'){z=z+1}W=W.getTime()+(W.g"
+"etTimezoneOffset()*60000);W=new Date(W+(3600000*z));X=['Sunday','Mo"
+"nday','Tuesday','Wednesday','Thursday','Friday','Saturday'];B=W.get"
+"Hours();C=W.getMinutes();D=W.getDay();Z=X[D];U='AM';A='Weekday';X='"
+"00';if(C>30){X='30'}if(B>=12){U='PM';B=B-12};if(B==0){B=12};if(D==6"
+"||D==0){A='Weekend'}W=B+':'+X+U;if(y&&y!=Y){return'Data Not Availab"
+"le'}else{if(t){if(t=='h'){return W}if(t=='d'){return Z}if(t=='w'){r"
+"eturn A}}else{return Z+', '+W}}}");

/*
 * Plugin: getNewRepeat 1.2 - Returns whether user is new or repeat
 */
s.getNewRepeat=new Function("d","cn",""
+"var s=this,e=new Date(),cval,sval,ct=e.getTime();d=d?d:30;cn=cn?cn:"
+"'s_nr';e.setTime(ct+d*24*60*60*1000);cval=s.c_r(cn);if(cval.length="
+"=0){s.c_w(cn,ct+'-New',e);return'New';}sval=cval.split('-');if(ct"
+"-sval[0]<30*60*1000&&sval[1]=='New'){s.c_w(cn,ct+'-New',e);return'N"
+"ew';}else{s.c_w(cn,ct+'-Repeat',e);return'Repeat';}");

/*
 * Plugin: getPercentPageViewed 1.55
 */
s.handlePPVevents=new Function("",""
+"var s=s_c_il["+s._in+"];if(!s.getPPVid)return;var dh=Math.max(Math."
+"max(s.d.body.scrollHeight,s.d.documentElement.scrollHeight),Math.ma"
+"x(s.d.body.offsetHeight,s.d.documentElement.offsetHeight),Math.max("
+"s.d.body.clientHeight,s.d.documentElement.clientHeight)),vph=window"
+".innerHeight||(s.d.documentElement.clientHeight||s.d.body.clientHei"
+"ght),st=window.pageYOffset||(window.document.documentElement.scroll"
+"Top||window.document.body.scrollTop),vh=st+vph,pv=Math.min(Math.rou"
+"nd(vh/dh*100),100),c='';if((s.c_r('tp')&&dh>s.c_r('tp'))||!s.c_r('t"
+"p')){s.c_w('tp',dh);s.c_w('s_ppv','');}else c=s.c_r('s_ppv');var a="
+"(c&&c.indexOf(',')>-1)?c.split(',',4):[],id=(a.length>0)?(a[0]):esc"
+"ape(s.getPPVid),cv=(a.length>1)?parseInt(a[1]):(0),p0=(a.length>2)?"
+"parseInt(a[2]):(pv),cy=(a.length>3)?parseInt(a[3]):(0),cn=(pv>0)?(i"
+"d+','+((pv>cv)?pv:cv)+','+p0+','+((vh>cy)?vh:cy)):'';s.c_w('s_ppv',"
+"cn);");
s.getPercentPageViewed=new Function("pid",""
+"pid=pid?pid:'-';var s=this,ist=!s.getPPVid?true:false;if(typeof(s.l"
+"inkType)!='undefined'&&s.linkType!='e')return'';var v=s.c_r('s_ppv'"
+"),a=(v.indexOf(',')>-1)?v.split(',',4):[];if(a&&a.length<4){for(var"
+" i=3;i>0;i--){a[i]=(i<a.length)?(a[i-1]):('');}a[0]='';}if(a)a[0]=u"
+"nescape(a[0]);if(ist){s.getPPVid=(pid)?(pid):(s.pageName?s.pageName"
+":document.location.href);s.c_w('s_ppv',escape(s.getPPVid));if(windo"
+"w.addEventListener){window.addEventListener('load',s.handlePPVevent"
+"s,false);window.addEventListener('scroll',s.handlePPVevents,false);"
+"window.addEventListener('resize',s.handlePPVevents,false);}else if("
+"window.attachEvent){window.attachEvent('onload',s.handlePPVevents);"
+"window.attachEvent('onscroll',s.handlePPVevents);window.attachEvent"
+"('onresize',s.handlePPVevents);}}return pid!='-'?a:a[1];");

/*
 * Plugin: Days since last Visit 1.0.H - capture time from last visit
 */
s.getDaysSinceLastVisit=new Function(""
+"var s=this,e=new Date(),cval,ct=e.getTime(),c='s_lastvisit',day=24*"
+"60*60*1000;e.setTime(ct+3*365*day);cval=s.c_r(c);if(!cval){s.c_w(c,"
+"ct,e);return 'First page view or cookies not supported';}else{var d"
+"=ct-cval;if(d>30*60*1000){if(d>30*day){s.c_w(c,ct,e);return 'More t"
+"han 30 days';}if(d<30*day+1 && d>7*day){s.c_w(c,ct,e);return 'More "
+"than 7 days';}if(d<7*day+1 && d>day){s.c_w(c,ct,e);return 'Less tha"
+"n 7 days';}if(d<day+1){s.c_w(c,ct,e);return 'Less than 1 day';}}els"
+"e return '';}"
);

/*
* Plugin: getVisitNum - 3.0
*/
s.getVisitNum=new Function("tp","c","c2",""
+"var s=this,e=new Date,cval,cvisit,ct=e.getTime(),d;if(!tp){tp='m';}"
+"if(tp=='m'||tp=='w'||tp=='d'){eo=s.endof(tp),y=eo.getTime();e.setTi"
+"me(y);}else {d=tp*86400000;e.setTime(ct+d);}if(!c){c='s_vnum';}if(!"
+"c2){c2='s_invisit';}cval=s.c_r(c);if(cval){var i=cval.indexOf('&vn="
+"'),str=cval.substring(i+4,cval.length),k;}cvisit=s.c_r(c2);if(cvisi"
+"t){if(str){e.setTime(ct+1800000);s.c_w(c2,'true',e);return str;}els"
+"e {return 'unknown visit number';}}else {if(str){str++;k=cval.substri"
+"ng(0,i);e.setTime(k);s.c_w(c,k+'&vn='+str,e);e.setTime(ct+1800000);"
+"s.c_w(c2,'true',e);return str;}else {s.c_w(c,e.getTime()+'&vn=1',e)"
+";e.setTime(ct+1800000);s.c_w(c2,'true',e);return 1;}}");
s.dimo=new Function("m","y",""
+"var d=new Date(y,m+1,0);return d.getDate();");
s.endof=new Function("x",""
+"var t=new Date;t.setHours(0);t.setMinutes(0);t.setSeconds(0);if(x=="
+"'m'){d=s.dimo(t.getMonth(),t.getFullYear())-t.getDate()+1;}else if("
+"x=='w'){d=7-t.getDay();}else {d=1;}t.setDate(t.getDate()+d);return "
+"t;");

/*
 * Plugin: getValOnce 1.1
 */
s.getValOnce=new Function("v","c","e","t",""
+"var s=this,a=new Date,v=v?v:'',c=c?c:'s_gvo',e=e?e:0,i=t=='m'?6000"
+"0:86400000;k=s.c_r(c);if(v){a.setTime(a.getTime()+e*i);s.c_w(c,v,e"
+"==0?0:a);}return v==k?'':v");

/*
 * Plugin: getPreviousValue v1.0 - return previous value of designated
 *   variable (requires split utility)
 */
s.getPreviousValue=new Function("v","c","el",""
+"var s=this,t=new Date,i,j,r='';t.setTime(t.getTime()+1800000);if(el"
+"){if(s.events){i=el.split(',');j=s.events.split(',');for(x in i"
+"){for(y in j){if(i[x]==j[y]){if(s.c_r(c)) r=s.c_r(c);v?s.c_w(c,v,t)"
+":s.c_w(c,'no value',t);return r}}}}}else{if(s.c_r(c)) r=s.c_r(c);v?"
+"s.c_w(c,v,t):s.c_w(c,'no value',t);return r}");

/*
 * Plugin Utility: apl v1.1
 */
s.apl=new Function("l","v","d","u",""
+"var s=this,m=0;if(!l)l='';if(u){var i,n,a=l.split(d);for(i=0;i<a."
+"length;i++){n=a[i];m=m||(u==1?(n==v):(n.toLowerCase()==v.toLowerCas"
+"e()));}}if(!m)l=l?l+d+v:v;return l");

/*
* Plug-in: manageQueryParam v1.3 - Manages query string parameters
* by either encoding, swapping, or both encoding and swapping a value.
*/
s.manageQueryParam=new Function("p","w","e","u",""
+"var s=this,x,y,i,qs,qp,qv,f,b;u=u?u:(s.pageURL?s.pageURL:''+window."
+"location);x=u.indexOf('?');qs=x>-1?u.substring(x,u.length):'';u=x>-"
+"1?u.substring(0,x):u;x=qs.indexOf('?'+p+'=');if(x>-1){y=qs.indexOf("
+"'&');f='';if(y>-1){qp=qs.substring(x+1,y);b=qs.substring(y+1,qs.len"
+"gth);}else{qp=qs.substring(1,qs.length);b='';}}else{x=qs.indexOf('&"
+"'+p+'=');if(x>-1){f=qs.substring(1,x);b=qs.substring(x+1,qs.length)"
+";y=b.indexOf('&');if(y>-1){qp=b.substring(0,y);b=b.substring(y,b.le"
+"ngth);}else{qp=b;b='';}}}if(e&&qp){y=qp.indexOf('=');qv=y>-1?qp.sub"
+"string(y+1,qp.length):'';var eui=0;while(qv.indexOf('%25')>-1){qv=u"
+"nescape(qv);eui++;if(eui==10)break;}qv=s.replace(qv,'+',' ');qv=esc"
+"ape(qv);qv=s.replace(qv,'%25','%');qv=s.replace(qv,'%7C','|');qv=s."
+"replace(qv,'%7c','|');qp=qp.substring(0,y+1)+qv;}if(w&&qp){if(f)qs="
+"'?'+qp+'&'+f+b;else if(b)qs='?'+qp+'&'+b;else qs='?'+qp}else if(f)q"
+"s='?'+f+'&'+qp+b;else if(b)qs='?'+qp+'&'+b;else if(qp)qs='?'+qp;ret"
+"urn u+qs;");

/*
* Plugin: clickPast - version 1.0
*/
s.clickPast=new Function("scp","ct_ev","cp_ev","cpc",""
+"var s=this,scp,ct_ev,cp_ev,cpc,ev,tct;if(s.p_fo(ct_ev)==1){if(!cpc)"
+"{cpc='s_cpc';}ev=s.events?s.events+',':'';if(scp){s.events=ev+ct_ev"
+";s.c_w(cpc,1,0);}else{if(s.c_r(cpc)>=1){s.events=ev+cp_ev;s.c_w(cpc"
+",0,0);}}}");
s.p_fo=new Function("n",""
+"var s=this;if(!s.__fo){s.__fo=new Object;}if(!s.__fo[n]){s.__fo[n]="
+"new Object;return 1;}else {return 0;}");

/*
* Cookie Combining Utility v.5
*/
if(!s.__ccucr)
{
    s.c_rr = s.c_r;
    s.__ccucr = true;
    function c_r(k)
    {
        var s = this, d = new Date, v = s.c_rr(k), c = s.c_rspers(), i, m, e;
        if(v) return v; k = s.escape ? s.escape(k) : encodeURIComponent(k);
        i = c.indexOf(' ' + k + '='); c = i < 0 ? s.c_rr('s_sess') : c;
        i = c.indexOf(' ' + k + '='); m = i < 0 ? i : c.indexOf('|', i);
        e = i < 0 ? i : c.indexOf(';', i); m = m > 0 ? m : e;
        v = i < 0 ? '' : s.unescape ? s.unescape(c.substring(i + 2 + k.length, m < 0 ? c.length : m)) : decodeURIComponent(c.substring(i + 2 + k.length, m < 0 ? c.length : m));
        return v;
    }
    function c_rspers()
    {
        var s = this, cv = s.c_rr("s_pers"), date = new Date().getTime(), expd = null, cvarr = [], vcv = "";
        if(!cv) return vcv; cvarr = cv.split(";"); for(var i = 0, l = cvarr.length; i < l; i++)    { expd = cvarr[i].match(/\|([0-9]+)$/);
        if(expd && parseInt(expd[1]) >= date) { vcv += cvarr[i] + ";"; } } return vcv;
    }
    s.c_rspers = c_rspers;
    s.c_r = s.cookieRead = c_r;
}
if(!s.__ccucw)
{
    s.c_wr = s.c_w;
    s.__ccucw = true;
    function c_w(k, v, e)
    {
        var s = this, d = new Date, ht = 0, pn = 's_pers', sn = 's_sess', pc = 0, sc = 0, pv, sv, c, i, t, f;
        d.setTime(d.getTime() - 60000); if(s.c_rr(k)) s.c_wr(k, '', d); k = s.escape ? s.escape(k) : encodeURIComponent(k);
        pv = s.c_rspers(); i = pv.indexOf(' ' + k + '='); if(i > -1) { pv = pv.substring(0, i) + pv.substring(pv.indexOf(';', i) + 1); pc = 1; }
        sv = s.c_rr(sn); i = sv.indexOf(' ' + k + '='); if(i > -1) { sv = sv.substring(0, i) + sv.substring(sv.indexOf(';', i) + 1);
        sc = 1; } d = new Date; if(e) { if(e == 1) e = new Date, f = e.getYear(), e.setYear(f + 5 + (f < 1900 ? 1900 : 0));
        if(e.getTime() > d.getTime()) {  pv += ' ' + k + '=' + (s.escape ? s.escape(v) : encodeURIComponent(v)) + '|' + e.getTime() + ';';
        pc = 1; } } else { sv += ' ' + k + '=' + (s.escape ? s.escape(v) : encodeURIComponent(v)) + ';';
        sc = 1; } sv = sv.replace(/%00/g, ''); pv = pv.replace(/%00/g, ''); if(sc) s.c_wr(sn, sv, 0);
        if(pc) { t = pv; while(t && t.indexOf(';') != -1) { var t1 = parseInt(t.substring(t.indexOf('|') + 1, t.indexOf(';')));
        t = t.substring(t.indexOf(';') + 1); ht = ht < t1 ? t1 : ht; } d.setTime(ht); s.c_wr(pn, pv, d); }
        return v == s.c_r(s.unescape ? s.unescape(k) : decodeURIComponent(k));
    }
    s.c_w = s.cookieWrite = c_w;
}

/*
 * Plugin: detectRIA v0.1 - detect and set Flash, Silverlight versions
 */
s.detectRIA=new Function("cn", "fp", "sp", "mfv", "msv", "sf", ""
+"cn=cn?cn:'s_ria';msv=msv?msv:2;mfv=mfv?mfv:10;var s=this,sv='',fv=-"
+"1,dwi=0,fr='',sr='',w,mt=window.navigator.mimeTypes,uk=s.c_r(cn),k=s.c_w('s_cc',"
+"'true',0)?'Y':'N';fk=uk.substring(0,uk.indexOf('|'));sk=uk.substrin"
+"g(uk.indexOf('|')+1,uk.length);if(k=='Y'&&s.p_fo('detectRIA')){if(u"
+"k&&!sf){if(fp){s[fp]=fk;}if(sp){s[sp]=sk;}return false;}if(!fk&&fp)"
+"{if(s.pl&&s.pl.length){if(s.pl['Shockwave Flash 2.0'])fv=2;x=s.pl['"
+"Shockwave Flash'];if(x){fv=0;z=x.description;if(z)fv=z.substring(16"
+",z.indexOf('.'));}}else if(navigator.plugins&&navigator.plugins.len"
+"gth){x=navigator.plugins['Shockwave Flash'];if(x){fv=0;z=x.descript"
+"ion;if(z)fv=z.substring(16,z.indexOf('.'));}}else if(mt&&mt.length)"
+"{x=mt['application/x-shockwave-flash'];if(x&&x.enabledPlugin)fv=0;}"
+"if(fv<=0)dwi=1;w=window.navigator.userAgent.indexOf('Win')!=-1?1:0;if(dwi&&s.isie&&w&&exec"
+"Script){result=false;for(var i=mfv;i>=3&&result!=true;i--){execScri"
+"pt('on error resume next: result = IsObject(CreateObject(\"Shockwav"
+"eFlash.ShockwaveFlash.'+i+'\"))','VBScript');fv=i;}}fr=fv==-1?'flas"
+"h not detected':fv==0?'flash enabled (no version)':'flash '+fv;}if("
+"!sk&&sp&&s.apv>=4.1){var tc='try{x=new ActiveXObject(\"AgControl.A'"
+"+'gControl\");for(var i=msv;i>0;i--){for(var j=9;j>=0;j--){if(x.is'"
+"+'VersionSupported(i+\".\"+j)){sv=i+\".\"+j;break;}}if(sv){break;}'"
+"+'}}catch(e){try{x=navigator.plugins[\"Silverlight Plug-In\"];sv=x'"
+"+'.description.substring(0,x.description.indexOf(\".\")+2);}catch('"
+"+'e){}}';eval(tc);sr=sv==''?'silverlight not detected':'silverlight"
+" '+sv;}if((fr&&fp)||(sr&&sp)){s.c_w(cn,fr+'|'+sr,0);if(fr)s[fp]=fr;"
+"if(sr)s[sp]=sr;}}");

/*
 * Custom Code: Brightcove Smart Analytics v2.2
 */
var player;var modVP;var modExp;var modCon;var mediaFriendly;var mediaName;var mediaID=0;var mediaLength;var mediaOffset=0;var mediaTagsArray = [];var mediaTagsArray2 = [];var mediaRefID;var mediaPlayerType;
var mediaPlayerName="Brightcove Smart Player"; //Required hard code player name here.
function myTemplateLoaded(experienceID) {
    player = brightcove.api.getExperience(experienceID);
    modVP = player.getModule(brightcove.api.modules.APIModules.VIDEO_PLAYER);
    modExp = player.getModule(brightcove.api.modules.APIModules.EXPERIENCE);
    modCon = player.getModule(brightcove.api.modules.APIModules.CONTENT);
    modExp.addEventListener(brightcove.api.events.ExperienceEvent.TEMPLATE_READY, onTemplateReady);}
function onTemplateReady(evt) {
    modVP.addEventListener(brightcove.api.events.MediaEvent.PLAY, onPlay);
    modVP.addEventListener(brightcove.api.events.MediaEvent.STOP, onStop);
    modVP.addEventListener(brightcove.api.events.MediaEvent.PROGRESS, onProgress);}
function onPlay(evt){
mediaLength=evt.duration;  //Required video duration
mediaOffset=Math.floor(evt.position); //Required video position
mediaID=(evt.media.id).toString();  //Required video id
mediaFriendly=evt.media.displayName; //Required video title
mediaName=mediaID+":"+mediaFriendly; //Required Format video name
mediaRefID=evt.media.referenceId;  //Optional reference id
mediaPlayerType=player.type; //Optional player type
mediaTagsArray=evt.media.tags; //Optional tags
for (i=0;i<mediaTagsArray.length;i++) {mediaTagsArray2[i]=mediaTagsArray[i]['name'];}
/* Check for start of video */
if (mediaOffset==0){
/* These data points are optional. If using SC14, change context data variables to hard coded variable names and change trackVars above. */
s.contextData['bc_tags']=mediaTagsArray2.toString(); //Optional returns list of tags for current video.  Flash only.
s.contextData['bc_refid']=mediaRefID; //Optional returns reference id
s.contextData['bc_player']=mediaPlayerName; //Optional player name is currently hard coded.  Will be dynamic in later releases.
s.contextData['bc_playertype']=mediaPlayerType; //Optional returns flash or html
s.Media.open(mediaName,mediaLength,mediaPlayerName);
s.Media.play(mediaName,mediaOffset);}else{
s.Media.play(mediaName,mediaOffset);}}
function onStop(evt){
mediaOffset=Math.floor(evt.position);
if (mediaOffset==mediaLength) {
s.Media.stop(mediaName,mediaOffset);
s.Media.close(mediaName);}else{
s.Media.stop(mediaName,mediaOffset);}}
function onProgress(evt){
s.Media.monitor = function (s,media) {
if (media.event == "MILESTONE") {
/* Use to set additional data points during milestone calls */
//s.Media.track(media.name); Uncomment if setting extra milestone data.
}}}



/****************************** MODULES *****************************/
function AppMeasurement_Module_Media(s){var m=this;m.s=s;s=window;if(!s.s_c_in)s.s_c_il=[],s.s_c_in=0;m._il=s.s_c_il;m._in=s.s_c_in;m._il[m._in]=m;s.s_c_in++;m._c="s_m";m.list=[];m.open=function(w,b,c,h){var d={},a=new Date,g="",e;b||(b=-1);if(w&&c){if(!m.list)m.list={};m.list[w]&&m.close(w);if(h&&h.id)g=h.id;if(g)for(e in m.list)!Object.prototype[e]&&m.list[e]&&m.list[e].S==g&&m.close(m.list[e].name);d.name=w;d.length=b;d.u=0;d.c=0;d.playerName=m.playerName?m.playerName:c;d.S=g;d.L=0;d.f=0;d.timestamp=
Math.floor(a.getTime()/1E3);d.j=0;d.r=d.timestamp;d.a=-1;d.B="";d.k=-1;d.C=0;d.H={};d.F=0;d.m=0;d.e="";d.A=0;d.K=0;d.z=0;d.D=0;d.l=!1;d.v="";d.I="";d.J=0;d.q=!1;d.G="";d.complete=0;d.Q=0;d.o=0;d.p=0;m.list[w]=d}};m.openAd=function(w,b,c,h,d,a,g,e){var f={};m.open(w,b,c,e);if(f=m.list[w])f.l=!0,f.v=h,f.I=d,f.J=a,f.G=g};m.M=function(w){var b=m.list[w];m.list[w]=0;b&&b.monitor&&clearTimeout(b.monitor.R)};m.close=function(w){m.g(w,0,-1)};m.play=function(w,b,c,h){var d=m.g(w,1,b,c,h);if(d&&!d.monitor)d.monitor=
{},d.monitor.update=function(){d.j==1&&m.g(d.name,3,-1);d.monitor.R=setTimeout(d.monitor.update,1E3)},d.monitor.update()};m.click=function(w,b){m.g(w,7,b)};m.complete=function(w,b){m.g(w,5,b)};m.stop=function(w,b){m.g(w,2,b)};m.track=function(w){m.g(w,4,-1)};m.P=function(w,b){var c="a.media.",h=w.linkTrackVars,d=w.linkTrackEvents,a="m_i",g,e=w.contextData,f;if(b.l){c+="ad.";if(b.v)e["a.media.name"]=b.v,e[c+"pod"]=b.I,e[c+"podPosition"]=b.J;if(!b.F)e[c+"CPM"]=b.G}if(b.q)e[c+"clicked"]=!0,b.q=!1;e["a.contentType"]=
"video"+(b.l?"Ad":"");e["a.media.channel"]=m.channel;e[c+"name"]=b.name;e[c+"playerName"]=b.playerName;if(b.length>0)e[c+"length"]=b.length;e[c+"timePlayed"]=Math.floor(b.f);Math.floor(b.f)>0&&(e[c+"timePlayed"]=Math.floor(b.f));if(!b.F)e[c+"view"]=!0,a="m_s",b.F=1;if(b.e){e[c+"segmentNum"]=b.m;e[c+"segment"]=b.e;if(b.A>0)e[c+"segmentLength"]=b.A;b.z&&b.f>0&&(e[c+"segmentView"]=!0)}if(!b.Q&&b.complete)e[c+"complete"]=!0,b.T=1;if(b.o>0)e[c+"milestone"]=b.o;if(b.p>0)e[c+"offsetMilestone"]=b.p;if(h)for(f in e)Object.prototype[f]||
(h+=",contextData."+f);g=e["a.contentType"];w.pe=a;w.pev3=g;var s,n;if(m.contextDataMapping){if(!w.events2)w.events2="";h&&(h+=",events");for(f in m.contextDataMapping)if(!Object.prototype[f]){a=f.length>c.length&&f.substring(0,c.length)==c?f.substring(c.length):"";g=m.contextDataMapping[f];if(typeof g=="string"){s=g.split(",");for(n=0;n<s.length;n++)g=s[n],f=="a.contentType"?(h&&(h+=","+g),w[g]=e[f]):a=="view"||a=="segmentView"||a=="clicked"||a=="complete"||a=="timePlayed"||a=="CPM"?(d&&(d+=","+
g),a=="timePlayed"||a=="CPM"?e[f]&&(w.events2+=(w.events2?",":"")+g+"="+e[f]):e[f]&&(w.events2+=(w.events2?",":"")+g)):a=="segment"&&e[f+"Num"]?(h&&(h+=","+g),w[g]=e[f+"Num"]+":"+e[f]):(h&&(h+=","+g),w[g]=e[f])}else if(a=="milestones"||a=="offsetMilestones")f=f.substring(0,f.length-1),e[f]&&m.contextDataMapping[f+"s"][e[f]]&&(d&&(d+=","+m.contextDataMapping[f+"s"][e[f]]),w.events2+=(w.events2?",":"")+m.contextDataMapping[f+"s"][e[f]]);e[f]&&(e[f]=0);a=="segment"&&e[f+"Num"]&&(e[f+"Num"]=0)}}w.linkTrackVars=
h;w.linkTrackEvents=d};m.g=function(w,b,c,h,d){var a={},g=(new Date).getTime()/1E3,e,f,s=m.trackVars,n=m.trackEvents,o=m.trackSeconds,p=m.trackMilestones,q=m.trackOffsetMilestones,r=m.segmentByMilestones,t=m.segmentByOffsetMilestones,k,j,l=1,i={},u;if(!m.channel)m.channel=m.s.w.location.hostname;if(a=w&&m.list&&m.list[w]?m.list[w]:0){if(a.l)o=m.adTrackSeconds,p=m.adTrackMilestones,q=m.adTrackOffsetMilestones,r=m.adSegmentByMilestones,t=m.adSegmentByOffsetMilestones;c<0&&(c=a.j==1&&a.r>0?g-a.r+a.a:
a.a);a.length>0&&(c=c<a.length?c:a.length);c<0&&(c=0);a.u=c;if(a.length>0)a.c=a.u/a.length*100,a.c=a.c>100?100:a.c;if(a.a<0)a.a=c;u=a.C;i.name=w;i.ad=a.l;i.length=a.length;i.openTime=new Date;i.openTime.setTime(a.timestamp*1E3);i.offset=a.u;i.percent=a.c;i.playerName=a.playerName;i.mediaEvent=a.k<0?"OPEN":b==1?"PLAY":b==2?"STOP":b==3?"MONITOR":b==4?"TRACK":b==5?"COMPLETE":b==7?"CLICK":"CLOSE";if(b>2||b!=a.j&&(b!=2||a.j==1)){if(!d)h=a.m,d=a.e;if(b){if(b==1)a.a=c;if((b<=3||b>=5)&&a.k>=0)if(l=!1,s=n=
"None",a.k!=c){f=a.k;if(f>c)f=a.a,f>c&&(f=c);k=p?p.split(","):0;if(a.length>0&&k&&c>=f)for(j=0;j<k.length;j++)if((e=k[j]?parseFloat(""+k[j]):0)&&f/a.length*100<e&&a.c>=e)l=!0,j=k.length,i.mediaEvent="MILESTONE",a.o=i.milestone=e;if((k=q?q.split(","):0)&&c>=f)for(j=0;j<k.length;j++)if((e=k[j]?parseFloat(""+k[j]):0)&&f<e&&c>=e)l=!0,j=k.length,i.mediaEvent="OFFSET_MILESTONE",a.p=i.offsetMilestone=e}if(a.K||!d){if(r&&p&&a.length>0){if(k=p.split(",")){k.push("100");for(j=f=0;j<k.length;j++)if(e=k[j]?parseFloat(""+
k[j]):0){if(a.c<e)h=j+1,d="M:"+f+"-"+e,j=k.length;f=e}}}else if(t&&q&&(k=q.split(","))){k.push(""+(a.length>0?a.length:"E"));for(j=f=0;j<k.length;j++)if((e=k[j]?parseFloat(""+k[j]):0)||k[j]=="E"){if(c<e||k[j]=="E")h=j+1,d="O:"+f+"-"+e,j=k.length;f=e}}if(d)a.K=!0}if((d||a.e)&&d!=a.e){a.D=!0;if(!a.e)a.m=h,a.e=d;a.k>=0&&(l=!0)}if((b>=2||a.c>=100)&&a.a<c)a.L+=c-a.a,a.f+=c-a.a;if(b<=2||b==3&&!a.j)a.B+=(b==1||b==3?"S":"E")+Math.floor(c),a.j=b==3?1:b;if(!l&&a.k>=0&&b<=3&&(o=o?o:0)&&a.f>=o)l=!0,i.mediaEvent=
"SECONDS";a.r=g;a.a=c}if(!b||b<=3&&a.c>=100)a.j!=2&&(a.B+="E"+Math.floor(c)),b=0,s=n="None",i.mediaEvent="CLOSE";if(b==7)l=i.clicked=a.q=!0;if(b==5||m.completeByCloseOffset&&(!b||a.c>=100)&&a.length>0&&c>=a.length-m.completeCloseOffsetThreshold)l=i.complete=a.complete=!0;g=i.mediaEvent;g=="MILESTONE"?g+="_"+i.milestone:g=="OFFSET_MILESTONE"&&(g+="_"+i.offsetMilestone);a.H[g]?i.eventFirstTime=!1:(i.eventFirstTime=!0,a.H[g]=1);i.event=i.mediaEvent;i.timePlayed=a.L;i.segmentNum=a.m;i.segment=a.e;i.segmentLength=
a.A;m.monitor&&b!=4&&m.monitor(m.s,i);b==0&&m.M(w);if(l&&a.C==u){w={};w.contextData={};w.linkTrackVars=s;w.linkTrackEvents=n;if(!w.linkTrackVars)w.linkTrackVars="";if(!w.linkTrackEvents)w.linkTrackEvents="";m.P(w,a);w.linkTrackVars||(w["!linkTrackVars"]=1);w.linkTrackEvents||(w["!linkTrackEvents"]=1);m.s.track(w);if(a.D)a.m=h,a.e=d,a.z=!0,a.D=!1;else if(a.f>0)a.z=!1;a.B="";a.o=a.p=0;a.f-=Math.floor(a.f);a.k=c;a.C++}}}return a};m.O=function(w,b,c,h,d){var a=0;if(w&&(!m.autoTrackMediaLengthRequired||
b&&b>0)){if(!m.list||!m.list[w]){if(c==1||c==3)m.open(w,b,"HTML5 Video",d),a=1}else a=1;a&&m.g(w,c,h,-1,0)}};m.attach=function(w){var b,c,h;if(w&&w.tagName&&w.tagName.toUpperCase()=="VIDEO"){if(!m.n)m.n=function(b,a,w){var c,f;if(m.autoTrack){c=b.currentSrc;(f=b.duration)||(f=-1);if(w<0)w=b.currentTime;m.O(c,f,a,w,b)}};b=function(){m.n(w,1,-1)};c=function(){m.n(w,1,-1)};m.i(w,"play",b);m.i(w,"pause",c);m.i(w,"seeking",c);m.i(w,"seeked",b);m.i(w,"ended",function(){m.n(w,0,-1)});m.i(w,"timeupdate",
b);h=function(){!w.paused&&!w.ended&&!w.seeking&&m.n(w,3,-1);setTimeout(h,1E3)};h()}};m.i=function(m,b,c){m.attachEvent?m.attachEvent("on"+b,c):m.addEventListener&&m.addEventListener(b,c,!1)};if(m.completeByCloseOffset==void 0)m.completeByCloseOffset=1;if(m.completeCloseOffsetThreshold==void 0)m.completeCloseOffsetThreshold=1;m.N=function(){var w,b;if(m.autoTrack&&(w=m.s.d.getElementsByTagName("VIDEO")))for(b=0;b<w.length;b++)m.attach(w[b])};m.i(s,"load",m.N)}AppMeasurement_Module_Media.REMOVE=1;
new AppMeasurement_Module_Media("REMOVE");

var dfaConfig = {
	CSID:               '4427', // DFA Client Site ID
	SPOTID:             '4310422', // DFA Spotlight ID
	tEvar:              'eVar50', // Transfer variable, typically the "View Through" eVar.
	errorEvar:          'eVar54', // DFA error tracking (optional)
	timeoutEvent:       'event48', // Tracks timeouts/empty responses (optional)
	requestURL:         "http://fls.doubleclick.net/json?spot=[SPOTID]&src=[CSID]&var=[VAR]&host=integrate.112.2o7.net%2Fdfa_echo%3Fvar%3D[VAR]%26AQE%3D1%26A2S%3D1&ord=[RAND]", // the DFA request URL
	maxDelay:           "3000", // The maximum time to wait for DFA servers to respond, in milliseconds.
	visitCookie:        "s_dfa", // The name of the visitor cookie to use to restrict DFA calls to once per visit.
	clickThroughParam:  "CID", // A query string paramter that will force the DFA call to occur.
	searchCenterParam:  undefined, // SearchCenter identifier.
	newRsidsProp:       undefined //"prop34" // Stores the new report suites that need the DFA tracking code. (optional)
};

// Not used with mackayshields.com?
if(s.account.indexOf('nylmainstayinvestmentspublicprod')>=0) {dfaConfig.SPOTID='4310422';}
/************************** DFA Integration *************************/
s.maxDelay = dfaConfig.maxDelay;
s.loadModule("Integrate")
s.Integrate.onLoad=function(s,m) {
	var dfaCheck = s.partnerDFACheck(dfaConfig);
	if (dfaCheck) {
		s.Integrate.add("DFA");
		s.Integrate.DFA.tEvar=dfaConfig.tEvar;
		s.Integrate.DFA.errorEvar=dfaConfig.errorEvar;
		s.Integrate.DFA.timeoutEvent=dfaConfig.timeoutEvent;
		s.Integrate.DFA.CSID=dfaConfig.CSID;
		s.Integrate.DFA.SPOTID=dfaConfig.SPOTID;
		s.Integrate.DFA.get(dfaConfig.requestURL);
		s.Integrate.DFA.setVars=function(s,p) {
			if (window[p.VAR]) { // got a response
				if(!p.ec) { // no errors
					s[p.tEvar]="DFA-"+(p.lis?p.lis:0)+"-"+(p.lip?p.lip:0)+"-"+(p.lastimp?p.lastimp:0)+"-"+(p.lastimptime?p.lastimptime:0)+"-"+(p.lcs?p.lcs:0)+"-"+(p.lcp?p.lcp:0)+"-"+(p.lastclk?p.lastclk:0)+"-"+(p.lastclktime?p.lastclktime:0)
				} else if (p.errorEvar) { // got an error response, track
					s[p.errorEvar] = p.ec;
				}
			} else if (p.timeoutEvent) { // empty response or timeout
				s.events = ((!s.events || s.events == '') ? '' : (s.events + ',')) + p.timeoutEvent; // timeout event
			}
		}
	}
}

/* 1.1.0.35 - Module: Integrate - Required for Genesis Integrations */
function AppMeasurement_Module_Integrate(s){var m=this;m.s=s;var w=window;if(!w.s_c_in)w.s_c_il=[],w.s_c_in=0;m._il=w.s_c_il;m._in=w.s_c_in;m._il[m._in]=m;w.s_c_in++;m._c="s_m";m.list=[];m.add=function(c,b){var a;b||(b="s_Integrate_"+c);w[b]||(w[b]={});a=m[c]=w[b];a.a=c;a.e=m;a._c=0;a._d=0;a.disable==void 0&&(a.disable=0);a.get=function(b,c){var d=document,f=d.getElementsByTagName("HEAD"),g;if(!a.disable&&(c||(v="s_"+m._in+"_Integrate_"+a.a+"_get_"+a._c),a._c++,a.VAR=v,a.CALLBACK="s_c_il["+m._in+
"]."+a.a+".callback",a.delay(),f=f&&f.length>0?f[0]:d.body))try{g=d.createElement("SCRIPT");g.type="text/javascript";g.setAttribute("async","async");g.src=m.c(a,b);if(b.indexOf("[CALLBACK]")<0)g.onload=g.onreadystatechange=function(){a.callback(w[v])};f.firstChild?f.insertBefore(g,f.firstChild):f.appendChild(g)}catch(s){}};a.callback=function(b){var m;if(b)for(m in b)Object.prototype[m]||(a[m]=b[m]);a.ready()};a.beacon=function(b){var c="s_i_"+m._in+"_Integrate_"+a.a+"_"+a._c;if(!a.disable)a._c++,
c=w[c]=new Image,c.src=m.c(a,b)};a.script=function(b){a.get(b,1)};a.delay=function(){a._d++};a.ready=function(){a._d--;a.disable||s.delayReady()};m.list.push(c)};m._g=function(c){var b,a=(c?"use":"set")+"Vars";for(c=0;c<m.list.length;c++)if((b=m[m.list[c]])&&!b.disable&&b[a])try{b[a](s,b)}catch(w){}};m._t=function(){m._g(1)};m._d=function(){var c,b;for(c=0;c<m.list.length;c++)if((b=m[m.list[c]])&&!b.disable&&b._d>0)return 1;return 0};m.c=function(m,b){var a,w,e,d;b.toLowerCase().substring(0,4)!="http"&&
(b="http://"+b);s.ssl&&(b=s.replace(b,"http:","https:"));m.RAND=Math.floor(Math.random()*1E13);for(a=0;a>=0;)a=b.indexOf("[",a),a>=0&&(w=b.indexOf("]",a),w>a&&(e=b.substring(a+1,w),e.length>2&&e.substring(0,2)=="s."?(d=s[e.substring(2)])||(d=""):(d=""+m[e],d!=m[e]&&parseFloat(d)!=m[e]&&(e=0)),e&&(b=b.substring(0,a)+encodeURIComponent(d)+b.substring(w+1)),a=w));return b}}

  /* WARNING: Changing any of the below variables will cause drastic
changes to how your visitor data is collected.  Changes should only be
made when instructed to do so by your account manager.*/
s.visitorNamespace="nylinvestments"
s.trackingServer="t.nylinvestments.com"
s.trackingServerSecure="st.nylinvestments.com"

/*
 ============== DO NOT ALTER ANYTHING BELOW THIS LINE ! ===============

 AppMeasurement for JavaScript version: 1.4.1
 Copyright 1996-2013 Adobe, Inc. All Rights Reserved
 More info available at http://www.omniture.com
*/
function AppMeasurement(){var s=this;s.version="1.4.1";var w=window;if(!w.s_c_in)w.s_c_il=[],w.s_c_in=0;s._il=w.s_c_il;s._in=w.s_c_in;s._il[s._in]=s;w.s_c_in++;s._c="s_c";var k=w.sb;k||(k=null);var m=w,i,o;try{i=m.parent;for(o=m.location;i&&i.location&&o&&""+i.location!=""+o&&m.location&&""+i.location!=""+m.location&&i.location.host==o.host;)m=i,i=m.parent}catch(p){}s.eb=function(s){try{console.log(s)}catch(a){}};s.ta=function(s){return""+parseInt(s)==""+s};s.replace=function(s,a,c){if(!s||s.indexOf(a)<
0)return s;return s.split(a).join(c)};s.escape=function(b){var a,c;if(!b)return b;b=encodeURIComponent(b);for(a=0;a<7;a++)c="+~!*()'".substring(a,a+1),b.indexOf(c)>=0&&(b=s.replace(b,c,"%"+c.charCodeAt(0).toString(16).toUpperCase()));return b};s.unescape=function(b){if(!b)return b;b=b.indexOf("+")>=0?s.replace(b,"+"," "):b;try{return decodeURIComponent(b)}catch(a){}return unescape(b)};s.Va=function(){var b=w.location.hostname,a=s.fpCookieDomainPeriods,c;if(!a)a=s.cookieDomainPeriods;if(b&&!s.cookieDomain&&
!/^[0-9.]+$/.test(b)&&(a=a?parseInt(a):2,a=a>2?a:2,c=b.lastIndexOf("."),c>=0)){for(;c>=0&&a>1;)c=b.lastIndexOf(".",c-1),a--;s.cookieDomain=c>0?b.substring(c):b}return s.cookieDomain};s.c_r=s.cookieRead=function(b){b=s.escape(b);var a=" "+s.d.cookie,c=a.indexOf(" "+b+"="),e=c<0?c:a.indexOf(";",c);b=c<0?"":s.unescape(a.substring(c+2+b.length,e<0?a.length:e));return b!="[[B]]"?b:""};s.c_w=s.cookieWrite=function(b,a,c){var e=s.Va(),d=s.cookieLifetime,f;a=""+a;d=d?(""+d).toUpperCase():"";c&&d!="SESSION"&&
d!="NONE"&&((f=a!=""?parseInt(d?d:0):-60)?(c=new Date,c.setTime(c.getTime()+f*1E3)):c==1&&(c=new Date,f=c.getYear(),c.setYear(f+5+(f<1900?1900:0))));if(b&&d!="NONE")return s.d.cookie=b+"="+s.escape(a!=""?a:"[[B]]")+"; path=/;"+(c&&d!="SESSION"?" expires="+c.toGMTString()+";":"")+(e?" domain="+e+";":""),s.cookieRead(b)==a;return 0};s.C=[];s.B=function(b,a,c){if(s.ma)return 0;if(!s.maxDelay)s.maxDelay=250;var e=0,d=(new Date).getTime()+s.maxDelay,f=s.d.qb,g=["webkitvisibilitychange","visibilitychange"];
if(!f)f=s.d.rb;if(f&&f=="prerender"){if(!s.X){s.X=1;for(c=0;c<g.length;c++)s.d.addEventListener(g[c],function(){var a=s.d.qb;if(!a)a=s.d.rb;if(a=="visible")s.X=0,s.delayReady()})}e=1;d=0}else c||s.q("_d")&&(e=1);e&&(s.C.push({m:b,a:a,t:d}),s.X||setTimeout(s.delayReady,s.maxDelay));return e};s.delayReady=function(){var b=(new Date).getTime(),a=0,c;for(s.q("_d")&&(a=1);s.C.length>0;){c=s.C.shift();if(a&&!c.t&&c.t>b){s.C.unshift(c);setTimeout(s.delayReady,parseInt(s.maxDelay/2));break}s.ma=1;s[c.m].apply(s,
c.a);s.ma=0}};s.setAccount=s.sa=function(b){var a,c;if(!s.B("setAccount",arguments))if(s.account=b,s.allAccounts){a=s.allAccounts.concat(b.split(","));s.allAccounts=[];a.sort();for(c=0;c<a.length;c++)(c==0||a[c-1]!=a[c])&&s.allAccounts.push(a[c])}else s.allAccounts=b.split(",")};s.foreachVar=function(b,a){var c,e,d,f,g="";d=e="";if(s.lightProfileID)c=s.H,(g=s.lightTrackVars)&&(g=","+g+","+s.ba.join(",")+",");else{c=s.c;if(s.pe||s.linkType)if(g=s.linkTrackVars,e=s.linkTrackEvents,s.pe&&(d=s.pe.substring(0,
1).toUpperCase()+s.pe.substring(1),s[d]))g=s[d].pb,e=s[d].ob;g&&(g=","+g+","+s.z.join(",")+",");e&&g&&(g+=",events,")}a&&(a=","+a+",");for(e=0;e<c.length;e++)d=c[e],(f=s[d])&&(!g||g.indexOf(","+d+",")>=0)&&(!a||a.indexOf(","+d+",")>=0)&&b(d,f)};s.J=function(b,a,c,e,d){var f="",g,j,w,q,i=0;b=="contextData"&&(b="c");if(a){for(g in a)if(!Object.prototype[g]&&(!d||g.substring(0,d.length)==d)&&a[g]&&(!c||c.indexOf(","+(e?e+".":"")+g+",")>=0)){w=!1;if(i)for(j=0;j<i.length;j++)g.substring(0,i[j].length)==
i[j]&&(w=!0);if(!w&&(f==""&&(f+="&"+b+"."),j=a[g],d&&(g=g.substring(d.length)),g.length>0))if(w=g.indexOf("."),w>0)j=g.substring(0,w),w=(d?d:"")+j+".",i||(i=[]),i.push(w),f+=s.J(j,a,c,e,w);else if(typeof j=="boolean"&&(j=j?"true":"false"),j){if(e=="retrieveLightData"&&d.indexOf(".contextData.")<0)switch(w=g.substring(0,4),q=g.substring(4),g){case "transactionID":g="xact";break;case "channel":g="ch";break;case "campaign":g="v0";break;default:s.ta(q)&&(w=="prop"?g="c"+q:w=="eVar"?g="v"+q:w=="list"?
g="l"+q:w=="hier"&&(g="h"+q,j=j.substring(0,255)))}f+="&"+s.escape(g)+"="+s.escape(j)}}f!=""&&(f+="&."+b)}return f};s.Xa=function(){var b="",a,c,e,d,f,g,j,w,i="",k="",m=c="";if(s.lightProfileID)a=s.H,(i=s.lightTrackVars)&&(i=","+i+","+s.ba.join(",")+",");else{a=s.c;if(s.pe||s.linkType)if(i=s.linkTrackVars,k=s.linkTrackEvents,s.pe&&(c=s.pe.substring(0,1).toUpperCase()+s.pe.substring(1),s[c]))i=s[c].pb,k=s[c].ob;i&&(i=","+i+","+s.z.join(",")+",");k&&(k=","+k+",",i&&(i+=",events,"));s.events2&&(m+=(m!=
""?",":"")+s.events2)}s.AudienceManagement&&s.AudienceManagement.isReady()&&(b+=s.J("d",s.AudienceManagement.getEventCallConfigParams()));for(c=0;c<a.length;c++){d=a[c];f=s[d];e=d.substring(0,4);g=d.substring(4);!f&&d=="events"&&m&&(f=m,m="");if(f&&(!i||i.indexOf(","+d+",")>=0)){switch(d){case "supplementalDataID":d="sdid";break;case "timestamp":d="ts";break;case "dynamicVariablePrefix":d="D";break;case "visitorID":d="vid";break;case "marketingCloudVisitorID":d="mid";break;case "analyticsVisitorID":d=
"aid";break;case "audienceManagerLocationHint":d="aamlh";break;case "audienceManagerBlob":d="aamb";break;case "authState":d="as";break;case "pageURL":d="g";if(f.length>255)s.pageURLRest=f.substring(255),f=f.substring(0,255);break;case "pageURLRest":d="-g";break;case "referrer":d="r";break;case "vmk":case "visitorMigrationKey":d="vmt";break;case "visitorMigrationServer":d="vmf";s.ssl&&s.visitorMigrationServerSecure&&(f="");break;case "visitorMigrationServerSecure":d="vmf";!s.ssl&&s.visitorMigrationServer&&
(f="");break;case "charSet":d="ce";break;case "visitorNamespace":d="ns";break;case "cookieDomainPeriods":d="cdp";break;case "cookieLifetime":d="cl";break;case "variableProvider":d="vvp";break;case "currencyCode":d="cc";break;case "channel":d="ch";break;case "transactionID":d="xact";break;case "campaign":d="v0";break;case "latitude":d="lat";break;case "longitude":d="lon";break;case "resolution":d="s";break;case "colorDepth":d="c";break;case "javascriptVersion":d="j";break;case "javaEnabled":d="v";
break;case "cookiesEnabled":d="k";break;case "browserWidth":d="bw";break;case "browserHeight":d="bh";break;case "connectionType":d="ct";break;case "homepage":d="hp";break;case "events":m&&(f+=(f!=""?",":"")+m);if(k){g=f.split(",");f="";for(e=0;e<g.length;e++)j=g[e],w=j.indexOf("="),w>=0&&(j=j.substring(0,w)),w=j.indexOf(":"),w>=0&&(j=j.substring(0,w)),k.indexOf(","+j+",")>=0&&(f+=(f?",":"")+g[e])}break;case "events2":f="";break;case "contextData":b+=s.J("c",s[d],i,d);f="";break;case "lightProfileID":d=
"mtp";break;case "lightStoreForSeconds":d="mtss";s.lightProfileID||(f="");break;case "lightIncrementBy":d="mti";s.lightProfileID||(f="");break;case "retrieveLightProfiles":d="mtsr";break;case "deleteLightProfiles":d="mtsd";break;case "retrieveLightData":s.retrieveLightProfiles&&(b+=s.J("mts",s[d],i,d));f="";break;default:s.ta(g)&&(e=="prop"?d="c"+g:e=="eVar"?d="v"+g:e=="list"?d="l"+g:e=="hier"&&(d="h"+g,f=f.substring(0,255)))}f&&(b+="&"+d+"="+(d.substring(0,3)!="pev"?s.escape(f):f))}d=="pev3"&&s.g&&
(b+=s.g)}return b};s.u=function(s){var a=s.tagName;if(""+s.wb!="undefined"||""+s.ib!="undefined"&&(""+s.ib).toUpperCase()!="HTML")return"";a=a&&a.toUpperCase?a.toUpperCase():"";a=="SHAPE"&&(a="");a&&((a=="INPUT"||a=="BUTTON")&&s.type&&s.type.toUpperCase?a=s.type.toUpperCase():!a&&s.href&&(a="A"));return a};s.oa=function(s){var a=s.href?s.href:"",c,e,d;c=a.indexOf(":");e=a.indexOf("?");d=a.indexOf("/");if(a&&(c<0||e>=0&&c>e||d>=0&&c>d))e=s.protocol&&s.protocol.length>1?s.protocol:l.protocol?l.protocol:
"",c=l.pathname.lastIndexOf("/"),a=(e?e+"//":"")+(s.host?s.host:l.host?l.host:"")+(h.substring(0,1)!="/"?l.pathname.substring(0,c<0?0:c)+"/":"")+a;return a};s.D=function(b){var a=s.u(b),c,e,d="",f=0;if(a){c=b.protocol;e=b.onclick;if(b.href&&(a=="A"||a=="AREA")&&(!e||!c||c.toLowerCase().indexOf("javascript")<0))d=s.oa(b);else if(e)d=s.replace(s.replace(s.replace(s.replace(""+e,"\r",""),"\n",""),"\t","")," ",""),f=2;else if(a=="INPUT"||a=="SUBMIT"){if(b.value)d=b.value;else if(b.innerText)d=b.innerText;
else if(b.textContent)d=b.textContent;f=3}else if(b.src&&a=="IMAGE")d=b.src;if(d)return{id:d.substring(0,100),type:f}}return 0};s.tb=function(b){for(var a=s.u(b),c=s.D(b);b&&!c&&a!="BODY";)if(b=b.parentElement?b.parentElement:b.parentNode)a=s.u(b),c=s.D(b);if(!c||a=="BODY")b=0;if(b&&(a=b.onclick?""+b.onclick:"",a.indexOf(".tl(")>=0||a.indexOf(".trackLink(")>=0))b=0;return b};s.hb=function(){var b,a,c=s.linkObject,e=s.linkType,d=s.linkURL,f,g;s.ca=1;if(!c)s.ca=0,c=s.clickObject;if(c){b=s.u(c);for(a=
s.D(c);c&&!a&&b!="BODY";)if(c=c.parentElement?c.parentElement:c.parentNode)b=s.u(c),a=s.D(c);if(!a||b=="BODY")c=0;if(c){var j=c.onclick?""+c.onclick:"";if(j.indexOf(".tl(")>=0||j.indexOf(".trackLink(")>=0)c=0}}else s.ca=1;!d&&c&&(d=s.oa(c));d&&!s.linkLeaveQueryString&&(f=d.indexOf("?"),f>=0&&(d=d.substring(0,f)));if(!e&&d){var i=0,k=0,m;if(s.trackDownloadLinks&&s.linkDownloadFileTypes){j=d.toLowerCase();f=j.indexOf("?");g=j.indexOf("#");f>=0?g>=0&&g<f&&(f=g):f=g;f>=0&&(j=j.substring(0,f));f=s.linkDownloadFileTypes.toLowerCase().split(",");
for(g=0;g<f.length;g++)(m=f[g])&&j.substring(j.length-(m.length+1))=="."+m&&(e="d")}if(s.trackExternalLinks&&!e&&(j=d.toLowerCase(),s.ra(j))){if(!s.linkInternalFilters)s.linkInternalFilters=w.location.hostname;f=0;s.linkExternalFilters?(f=s.linkExternalFilters.toLowerCase().split(","),i=1):s.linkInternalFilters&&(f=s.linkInternalFilters.toLowerCase().split(","));if(f){for(g=0;g<f.length;g++)m=f[g],j.indexOf(m)>=0&&(k=1);k?i&&(e="e"):i||(e="e")}}}s.linkObject=c;s.linkURL=d;s.linkType=e;if(s.trackClickMap||
s.trackInlineStats)if(s.g="",c){e=s.pageName;d=1;c=c.sourceIndex;if(!e)e=s.pageURL,d=0;if(w.s_objectID)a.id=w.s_objectID,c=a.type=1;if(e&&a&&a.id&&b)s.g="&pid="+s.escape(e.substring(0,255))+(d?"&pidt="+d:"")+"&oid="+s.escape(a.id.substring(0,100))+(a.type?"&oidt="+a.type:"")+"&ot="+b+(c?"&oi="+c:"")}};s.Ya=function(){var b=s.ca,a=s.linkType,c=s.linkURL,e=s.linkName;if(a&&(c||e))a=a.toLowerCase(),a!="d"&&a!="e"&&(a="o"),s.pe="lnk_"+a,s.pev1=c?s.escape(c):"",s.pev2=e?s.escape(e):"",b=1;s.abort&&(b=
0);if(s.trackClickMap||s.trackInlineStats){a={};c=0;var d=s.cookieRead("s_sq"),f=d?d.split("&"):0,g,j,w;d=0;if(f)for(g=0;g<f.length;g++)j=f[g].split("="),e=s.unescape(j[0]).split(","),j=s.unescape(j[1]),a[j]=e;e=s.account.split(",");if(b||s.g){b&&!s.g&&(d=1);for(j in a)if(!Object.prototype[j])for(g=0;g<e.length;g++){d&&(w=a[j].join(","),w==s.account&&(s.g+=(j.charAt(0)!="&"?"&":"")+j,a[j]=[],c=1));for(f=0;f<a[j].length;f++)w=a[j][f],w==e[g]&&(d&&(s.g+="&u="+s.escape(w)+(j.charAt(0)!="&"?"&":"")+j+
"&u=0"),a[j].splice(f,1),c=1)}b||(c=1);if(c){d="";g=2;!b&&s.g&&(d=s.escape(e.join(","))+"="+s.escape(s.g),g=1);for(j in a)!Object.prototype[j]&&g>0&&a[j].length>0&&(d+=(d?"&":"")+s.escape(a[j].join(","))+"="+s.escape(j),g--);s.cookieWrite("s_sq",d)}}}return b};s.Za=function(){if(!s.nb){var b=new Date,a=m.location,c,e,d=e=c="",f="",g="",w="1.2",i=s.cookieWrite("s_cc","true",0)?"Y":"N",k="",n="";if(b.setUTCDate&&(w="1.3",(0).toPrecision&&(w="1.5",b=[],b.forEach))){w="1.6";e=0;c={};try{e=new Iterator(c),
e.next&&(w="1.7",b.reduce&&(w="1.8",w.trim&&(w="1.8.1",Date.parse&&(w="1.8.2",Object.create&&(w="1.8.5")))))}catch(o){}}c=screen.width+"x"+screen.height;d=navigator.javaEnabled()?"Y":"N";e=screen.pixelDepth?screen.pixelDepth:screen.colorDepth;f=s.w.innerWidth?s.w.innerWidth:s.d.documentElement.offsetWidth;g=s.w.innerHeight?s.w.innerHeight:s.d.documentElement.offsetHeight;try{s.b.addBehavior("#default#homePage"),k=s.b.ub(a)?"Y":"N"}catch(p){}try{s.b.addBehavior("#default#clientCaps"),n=s.b.connectionType}catch(r){}s.resolution=
c;s.colorDepth=e;s.javascriptVersion=w;s.javaEnabled=d;s.cookiesEnabled=i;s.browserWidth=f;s.browserHeight=g;s.connectionType=n;s.homepage=k;s.nb=1}};s.I={};s.loadModule=function(b,a){var c=s.I[b];if(!c){c=w["AppMeasurement_Module_"+b]?new w["AppMeasurement_Module_"+b](s):{};s.I[b]=s[b]=c;c.Fa=function(){return c.Ja};c.Ka=function(a){if(c.Ja=a)s[b+"_onLoad"]=a,s.B(b+"_onLoad",[s,c],1)||a(s,c)};try{Object.defineProperty?Object.defineProperty(c,"onLoad",{get:c.Fa,set:c.Ka}):c._olc=1}catch(e){c._olc=
1}}a&&(s[b+"_onLoad"]=a,s.B(b+"_onLoad",[s,c],1)||a(s,c))};s.q=function(b){var a,c;for(a in s.I)if(!Object.prototype[a]&&(c=s.I[a])){if(c._olc&&c.onLoad)c._olc=0,c.onLoad(s,c);if(c[b]&&c[b]())return 1}return 0};s.bb=function(){var b=Math.floor(Math.random()*1E13),a=s.visitorSampling,c=s.visitorSamplingGroup;c="s_vsn_"+(s.visitorNamespace?s.visitorNamespace:s.account)+(c?"_"+c:"");var e=s.cookieRead(c);if(a){e&&(e=parseInt(e));if(!e){if(!s.cookieWrite(c,b))return 0;e=b}if(e%1E4>v)return 0}return 1};
s.K=function(b,a){var c,e,d,f,g,w;for(c=0;c<2;c++){e=c>0?s.ia:s.c;for(d=0;d<e.length;d++)if(f=e[d],(g=b[f])||b["!"+f]){if(!a&&(f=="contextData"||f=="retrieveLightData")&&s[f])for(w in s[f])g[w]||(g[w]=s[f][w]);s[f]=g}}};s.Aa=function(b,a){var c,e,d,f;for(c=0;c<2;c++){e=c>0?s.ia:s.c;for(d=0;d<e.length;d++)f=e[d],b[f]=s[f],!a&&!b[f]&&(b["!"+f]=1)}};s.Ua=function(s){var a,c,e,d,f,g=0,w,i="",k="";if(s&&s.length>255&&(a=""+s,c=a.indexOf("?"),c>0&&(w=a.substring(c+1),a=a.substring(0,c),d=a.toLowerCase(),
e=0,d.substring(0,7)=="http://"?e+=7:d.substring(0,8)=="https://"&&(e+=8),c=d.indexOf("/",e),c>0&&(d=d.substring(e,c),f=a.substring(c),a=a.substring(0,c),d.indexOf("google")>=0?g=",q,ie,start,search_key,word,kw,cd,":d.indexOf("yahoo.co")>=0&&(g=",p,ei,"),g&&w)))){if((s=w.split("&"))&&s.length>1){for(e=0;e<s.length;e++)d=s[e],c=d.indexOf("="),c>0&&g.indexOf(","+d.substring(0,c)+",")>=0?i+=(i?"&":"")+d:k+=(k?"&":"")+d;i&&k?w=i+"&"+k:k=""}c=253-(w.length-k.length)-a.length;s=a+(c>0?f.substring(0,c):
"")+"?"+w}return s};s.U=!1;s.O=!1;s.Ia=function(b){s.marketingCloudVisitorID=b;s.O=!0;s.k()};s.R=!1;s.L=!1;s.Ca=function(b){s.analyticsVisitorID=b;s.L=!0;s.k()};s.T=!1;s.N=!1;s.Ea=function(b){s.audienceManagerLocationHint=b;s.N=!0;s.k()};s.S=!1;s.M=!1;s.Da=function(b){s.audienceManagerBlob=b;s.M=!0;s.k()};s.isReadyToTrack=function(){var b=!0,a=s.visitor;if(a&&a.isAllowed()){if(!s.U&&!s.marketingCloudVisitorID&&a.getMarketingCloudVisitorID&&(s.U=!0,s.marketingCloudVisitorID=a.getMarketingCloudVisitorID([s,
s.Ia]),s.marketingCloudVisitorID))s.O=!0;if(!s.R&&!s.analyticsVisitorID&&a.getAnalyticsVisitorID&&(s.R=!0,s.analyticsVisitorID=a.getAnalyticsVisitorID([s,s.Ca]),s.analyticsVisitorID))s.L=!0;if(!s.T&&!s.audienceManagerLocationHint&&a.getAudienceManagerLocationHint&&(s.T=!0,s.audienceManagerLocationHint=a.getAudienceManagerLocationHint([s,s.Ea]),s.audienceManagerLocationHint))s.N=!0;if(!s.S&&!s.audienceManagerBlob&&a.getAudienceManagerBlob&&(s.S=!0,s.audienceManagerBlob=a.getAudienceManagerBlob([s,
s.Da]),s.audienceManagerBlob))s.M=!0;if(s.U&&!s.O&&!s.marketingCloudVisitorID||s.R&&!s.L&&!s.analyticsVisitorID||s.T&&!s.N&&!s.audienceManagerLocationHint||s.S&&!s.M&&!s.audienceManagerBlob)b=!1}return b};s.j=k;s.l=0;s.callbackWhenReadyToTrack=function(b,a,c){var e;e={};e.Oa=b;e.Na=a;e.La=c;if(s.j==k)s.j=[];s.j.push(e);if(s.l==0)s.l=setInterval(s.k,100)};s.k=function(){var b;if(s.isReadyToTrack()){if(s.l)clearInterval(s.l),s.l=0;if(s.j!=k)for(;s.j.length>0;)b=s.j.shift(),b.Na.apply(b.Oa,b.La)}};s.Ga=
function(b){var a,c,e=k,d=k;if(!s.isReadyToTrack()){a=[];if(b!=k)for(c in e={},b)e[c]=b[c];d={};s.Aa(d,!0);a.push(e);a.push(d);s.callbackWhenReadyToTrack(s,s.track,a);return!0}return!1};s.Wa=function(){var b=s.cookieRead("s_fid"),a="",c="",e;e=8;var d=4;if(!b||b.indexOf("-")<0){for(b=0;b<16;b++)e=Math.floor(Math.random()*e),a+="0123456789ABCDEF".substring(e,e+1),e=Math.floor(Math.random()*d),c+="0123456789ABCDEF".substring(e,e+1),e=d=16;b=a+"-"+c}s.cookieWrite("s_fid",b,1)||(b=0);return b};s.t=s.track=
function(b,a){var c,e=new Date,d="s"+Math.floor(e.getTime()/108E5)%10+Math.floor(Math.random()*1E13),f=e.getYear();f="t="+s.escape(e.getDate()+"/"+e.getMonth()+"/"+(f<1900?f+1900:f)+" "+e.getHours()+":"+e.getMinutes()+":"+e.getSeconds()+" "+e.getDay()+" "+e.getTimezoneOffset());if(s.visitor){if(s.visitor.getAuthState)s.authState=s.visitor.getAuthState();if(!s.supplementalDataID&&s.visitor.getSupplementalDataID)s.supplementalDataID=s.visitor.getSupplementalDataID("AppMeasurement:"+s._in,s.expectSupplementalData?
!1:!0)}s.q("_s");if(!s.B("track",arguments)){if(!s.Ga(b)){a&&s.K(a);b&&(c={},s.Aa(c,0),s.K(b));if(s.bb()){if(!s.analyticsVisitorID&&!s.marketingCloudVisitorID)s.fid=s.Wa();s.hb();s.usePlugins&&s.doPlugins&&s.doPlugins(s);if(s.account){if(!s.abort){if(s.trackOffline&&!s.timestamp)s.timestamp=Math.floor(e.getTime()/1E3);e=w.location;if(!s.pageURL)s.pageURL=e.href?e.href:e;if(!s.referrer&&!s.Ba)s.referrer=m.document.referrer,s.Ba=1;s.referrer=s.Ua(s.referrer);s.q("_g")}if(s.Ya()&&!s.abort)s.Za(),f+=
s.Xa(),s.gb(d,f),s.q("_t"),s.referrer=""}}b&&s.K(c,1)}s.abort=s.supplementalDataID=s.timestamp=s.pageURLRest=s.linkObject=s.clickObject=s.linkURL=s.linkName=s.linkType=w.vb=s.pe=s.pev1=s.pev2=s.pev3=s.g=0}};s.tl=s.trackLink=function(b,a,c,e,d){s.linkObject=b;s.linkType=a;s.linkName=c;if(d)s.i=b,s.p=d;return s.track(e)};s.trackLight=function(b,a,c,e){s.lightProfileID=b;s.lightStoreForSeconds=a;s.lightIncrementBy=c;return s.track(e)};s.clearVars=function(){var b,a;for(b=0;b<s.c.length;b++)if(a=s.c[b],
a.substring(0,4)=="prop"||a.substring(0,4)=="eVar"||a.substring(0,4)=="hier"||a.substring(0,4)=="list"||a=="channel"||a=="events"||a=="eventList"||a=="products"||a=="productList"||a=="purchaseID"||a=="transactionID"||a=="state"||a=="zip"||a=="campaign")s[a]=void 0};s.tagContainerMarker="";s.gb=function(b,a){var c,e=s.trackingServer;c="";var d=s.dc,f="sc.",w=s.visitorNamespace;if(e){if(s.trackingServerSecure&&s.ssl)e=s.trackingServerSecure}else{if(!w)w=s.account,e=w.indexOf(","),e>=0&&(w=w.substring(0,
e)),w=w.replace(/[^A-Za-z0-9]/g,"");c||(c="2o7.net");d=d?(""+d).toLowerCase():"d1";c=="2o7.net"&&(d=="d1"?d="112":d=="d2"&&(d="122"),f="");e=w+"."+d+"."+f+c}c=s.ssl?"https://":"http://";d=s.AudienceManagement&&s.AudienceManagement.isReady();c+=e+"/b/ss/"+s.account+"/"+(s.mobile?"5.":"")+(d?"10":"1")+"/JS-"+s.version+(s.mb?"T":"")+(s.tagContainerMarker?"-"+s.tagContainerMarker:"")+"/"+b+"?AQB=1&ndh=1&pf=1&"+(d?"callback=s_c_il["+s._in+"].AudienceManagement.passData&":"")+a+"&AQE=1";s.Sa(c);s.Y()};
s.Sa=function(b){s.e||s.$a();s.e.push(b);s.aa=s.r();s.za()};s.$a=function(){s.e=s.cb();if(!s.e)s.e=[]};s.cb=function(){var b,a;if(s.fa()){try{(a=w.localStorage.getItem(s.da()))&&(b=w.JSON.parse(a))}catch(c){}return b}};s.fa=function(){var b=!0;if(!s.trackOffline||!s.offlineFilename||!w.localStorage||!w.JSON)b=!1;return b};s.pa=function(){var b=0;if(s.e)b=s.e.length;s.v&&b++;return b};s.Y=function(){if(!s.v)if(s.qa=k,s.ea)s.aa>s.G&&s.xa(s.e),s.ha(500);else{var b=s.Ma();if(b>0)s.ha(b);else if(b=s.na())s.v=
1,s.fb(b),s.jb(b)}};s.ha=function(b){if(!s.qa)b||(b=0),s.qa=setTimeout(s.Y,b)};s.Ma=function(){var b;if(!s.trackOffline||s.offlineThrottleDelay<=0)return 0;b=s.r()-s.wa;if(s.offlineThrottleDelay<b)return 0;return s.offlineThrottleDelay-b};s.na=function(){if(s.e.length>0)return s.e.shift()};s.fb=function(b){if(s.debugTracking){var a="AppMeasurement Debug: "+b;b=b.split("&");var c;for(c=0;c<b.length;c++)a+="\n\t"+s.unescape(b[c]);s.eb(a)}};s.Ha=function(){return s.marketingCloudVisitorID||s.analyticsVisitorID};
s.Q=!1;var n;try{n=JSON.parse('{"x":"y"}')}catch(r){n=null}n&&n.x=="y"?(s.Q=!0,s.P=function(s){return JSON.parse(s)}):w.$&&w.$.parseJSON?(s.P=function(s){return w.$.parseJSON(s)},s.Q=!0):s.P=function(){return null};s.jb=function(b){var a,c,e;if(s.Ha()&&b.length>2047&&(typeof XMLHttpRequest!="undefined"&&(a=new XMLHttpRequest,"withCredentials"in a?c=1:a=0),!a&&typeof XDomainRequest!="undefined"&&(a=new XDomainRequest,c=2),a&&s.AudienceManagement&&s.AudienceManagement.isReady()))s.Q?a.ja=!0:a=0;!a&&
s.ab&&(b=b.substring(0,2047));if(!a&&s.d.createElement&&s.AudienceManagement&&s.AudienceManagement.isReady()&&(a=s.d.createElement("SCRIPT"))&&"async"in a)(e=(e=s.d.getElementsByTagName("HEAD"))&&e[0]?e[0]:s.d.body)?(a.type="text/javascript",a.setAttribute("async","async"),c=3):a=0;if(!a)a=new Image,a.alt="";a.la=function(){try{if(s.ga)clearTimeout(s.ga),s.ga=0;if(a.timeout)clearTimeout(a.timeout),a.timeout=0}catch(b){}};a.onload=a.lb=function(){a.la();s.Ra();s.V();s.v=0;s.Y();if(a.ja){a.ja=!1;try{var b=
s.P(a.responseText);AudienceManagement.passData(b)}catch(c){}}};a.onabort=a.onerror=a.Ta=function(){a.la();(s.trackOffline||s.ea)&&s.v&&s.e.unshift(s.Qa);s.v=0;s.aa>s.G&&s.xa(s.e);s.V();s.ha(500)};a.onreadystatechange=function(){a.readyState==4&&(a.status==200?a.lb():a.Ta())};s.wa=s.r();if(c==1||c==2){var d=b.indexOf("?");e=b.substring(0,d);d=b.substring(d+1);d=d.replace(/&callback=[a-zA-Z0-9_.\[\]]+/,"");c==1?(a.open("POST",e,!0),a.send(d)):c==2&&(a.open("POST",e),a.send(d))}else if(a.src=b,c==3){if(s.ua)try{e.removeChild(s.ua)}catch(f){}e.firstChild?
e.insertBefore(a,e.firstChild):e.appendChild(a);s.ua=s.Pa}if(a.abort)s.ga=setTimeout(a.abort,5E3);s.Qa=b;s.Pa=w["s_i_"+s.replace(s.account,",","_")]=a;if(s.useForcedLinkTracking&&s.A||s.p){if(!s.forcedLinkTrackingTimeout)s.forcedLinkTrackingTimeout=250;s.W=setTimeout(s.V,s.forcedLinkTrackingTimeout)}};s.Ra=function(){if(s.fa()&&!(s.va>s.G))try{w.localStorage.removeItem(s.da()),s.va=s.r()}catch(b){}};s.xa=function(b){if(s.fa()){s.za();try{w.localStorage.setItem(s.da(),w.JSON.stringify(b)),s.G=s.r()}catch(a){}}};
s.za=function(){if(s.trackOffline){if(!s.offlineLimit||s.offlineLimit<=0)s.offlineLimit=10;for(;s.e.length>s.offlineLimit;)s.na()}};s.forceOffline=function(){s.ea=!0};s.forceOnline=function(){s.ea=!1};s.da=function(){return s.offlineFilename+"-"+s.visitorNamespace+s.account};s.r=function(){return(new Date).getTime()};s.ra=function(s){s=s.toLowerCase();if(s.indexOf("#")!=0&&s.indexOf("about:")!=0&&s.indexOf("opera:")!=0&&s.indexOf("javascript:")!=0)return!0;return!1};s.setTagContainer=function(b){var a,
c,e;s.mb=b;for(a=0;a<s._il.length;a++)if((c=s._il[a])&&c._c=="s_l"&&c.tagContainerName==b){s.K(c);if(c.lmq)for(a=0;a<c.lmq.length;a++)e=c.lmq[a],s.loadModule(e.n);if(c.ml)for(e in c.ml)if(s[e])for(a in b=s[e],e=c.ml[e],e)if(!Object.prototype[a]&&(typeof e[a]!="function"||(""+e[a]).indexOf("s_c_il")<0))b[a]=e[a];if(c.mmq)for(a=0;a<c.mmq.length;a++)e=c.mmq[a],s[e.m]&&(b=s[e.m],b[e.f]&&typeof b[e.f]=="function"&&(e.a?b[e.f].apply(b,e.a):b[e.f].apply(b)));if(c.tq)for(a=0;a<c.tq.length;a++)s.track(c.tq[a]);
c.s=s;break}};s.Util={urlEncode:s.escape,urlDecode:s.unescape,cookieRead:s.cookieRead,cookieWrite:s.cookieWrite,getQueryParam:function(b,a,c){var e;a||(a=s.pageURL?s.pageURL:w.location);c||(c="&");if(b&&a&&(a=""+a,e=a.indexOf("?"),e>=0&&(a=c+a.substring(e+1)+c,e=a.indexOf(c+b+"="),e>=0&&(a=a.substring(e+c.length+b.length+1),e=a.indexOf(c),e>=0&&(a=a.substring(0,e)),a.length>0))))return s.unescape(a);return""}};s.z=["supplementalDataID","timestamp","dynamicVariablePrefix","visitorID","marketingCloudVisitorID",
"analyticsVisitorID","audienceManagerLocationHint","authState","fid","vmk","visitorMigrationKey","visitorMigrationServer","visitorMigrationServerSecure","charSet","visitorNamespace","cookieDomainPeriods","fpCookieDomainPeriods","cookieLifetime","pageName","pageURL","referrer","contextData","currencyCode","lightProfileID","lightStoreForSeconds","lightIncrementBy","retrieveLightProfiles","deleteLightProfiles","retrieveLightData","pe","pev1","pev2","pev3","pageURLRest"];s.c=s.z.concat(["purchaseID",
"variableProvider","channel","server","pageType","transactionID","campaign","state","zip","events","events2","products","audienceManagerBlob","tnt"]);s.ba=["timestamp","charSet","visitorNamespace","cookieDomainPeriods","cookieLifetime","contextData","lightProfileID","lightStoreForSeconds","lightIncrementBy"];s.H=s.ba.slice(0);s.ia=["account","allAccounts","debugTracking","visitor","trackOffline","offlineLimit","offlineThrottleDelay","offlineFilename","usePlugins","doPlugins","configURL","visitorSampling",
"visitorSamplingGroup","linkObject","clickObject","linkURL","linkName","linkType","trackDownloadLinks","trackExternalLinks","trackClickMap","trackInlineStats","linkLeaveQueryString","linkTrackVars","linkTrackEvents","linkDownloadFileTypes","linkExternalFilters","linkInternalFilters","useForcedLinkTracking","forcedLinkTrackingTimeout","trackingServer","trackingServerSecure","ssl","abort","mobile","dc","lightTrackVars","maxDelay","expectSupplementalData","AudienceManagement"];for(i=0;i<=250;i++)i<76&&
(s.c.push("prop"+i),s.H.push("prop"+i)),s.c.push("eVar"+i),s.H.push("eVar"+i),i<6&&s.c.push("hier"+i),i<4&&s.c.push("list"+i);i=["latitude","longitude","resolution","colorDepth","javascriptVersion","javaEnabled","cookiesEnabled","browserWidth","browserHeight","connectionType","homepage"];s.c=s.c.concat(i);s.z=s.z.concat(i);s.ssl=w.location.protocol.toLowerCase().indexOf("https")>=0;s.charSet="UTF-8";s.contextData={};s.offlineThrottleDelay=0;s.offlineFilename="AppMeasurement.offline";s.wa=0;s.aa=0;
s.G=0;s.va=0;s.linkDownloadFileTypes="exe,zip,wav,mp3,mov,mpg,avi,wmv,pdf,doc,docx,xls,xlsx,ppt,pptx";s.w=w;s.d=w.document;try{s.ab=navigator.appName=="Microsoft Internet Explorer"}catch(t){}s.V=function(){if(s.W)w.clearTimeout(s.W),s.W=k;s.i&&s.A&&s.i.dispatchEvent(s.A);if(s.p)if(typeof s.p=="function")s.p();else if(s.i&&s.i.href)s.d.location=s.i.href;s.i=s.A=s.p=0};s.ya=function(){s.b=s.d.body;if(s.b)if(s.o=function(b){var a,c,e,d,f;if(!(s.d&&s.d.getElementById("cppXYctnr")||b&&b["s_fe_"+s._in])){if(s.ka)if(s.useForcedLinkTracking)s.b.removeEventListener("click",
s.o,!1);else{s.b.removeEventListener("click",s.o,!0);s.ka=s.useForcedLinkTracking=0;return}else s.useForcedLinkTracking=0;s.clickObject=b.srcElement?b.srcElement:b.target;try{if(s.clickObject&&(!s.F||s.F!=s.clickObject)&&(s.clickObject.tagName||s.clickObject.parentElement||s.clickObject.parentNode)){var g=s.F=s.clickObject;if(s.Z)clearTimeout(s.Z),s.Z=0;s.Z=setTimeout(function(){if(s.F==g)s.F=0},1E4);e=s.pa();s.track();if(e<s.pa()&&s.useForcedLinkTracking&&b.target){for(d=b.target;d&&d!=s.b&&d.tagName.toUpperCase()!=
"A"&&d.tagName.toUpperCase()!="AREA";)d=d.parentNode;if(d&&(f=d.href,s.ra(f)||(f=0),c=d.target,b.target.dispatchEvent&&f&&(!c||c=="_self"||c=="_top"||c=="_parent"||w.name&&c==w.name))){try{a=s.d.createEvent("MouseEvents")}catch(i){a=new w.MouseEvent}if(a){try{a.initMouseEvent("click",b.bubbles,b.cancelable,b.view,b.detail,b.screenX,b.screenY,b.clientX,b.clientY,b.ctrlKey,b.altKey,b.shiftKey,b.metaKey,b.button,b.relatedTarget)}catch(k){a=0}if(a)a["s_fe_"+s._in]=a.s_fe=1,b.stopPropagation(),b.kb&&b.kb(),
b.preventDefault(),s.i=b.target,s.A=a}}}}else s.clickObject=0}catch(m){s.clickObject=0}}},s.b&&s.b.attachEvent)s.b.attachEvent("onclick",s.o);else{if(s.b&&s.b.addEventListener){if(navigator&&(navigator.userAgent.indexOf("WebKit")>=0&&s.d.createEvent||navigator.userAgent.indexOf("Firefox/2")>=0&&w.MouseEvent))s.ka=1,s.useForcedLinkTracking=1,s.b.addEventListener("click",s.o,!0);s.b.addEventListener("click",s.o,!1)}}else setTimeout(s.ya,30)};s.ya()}
function s_gi(s){var w,k=window.s_c_il,m,i,o=s.split(","),p,n,r=0;if(k)for(m=0;!r&&m<k.length;){w=k[m];if(w._c=="s_c"&&(w.account||w.oun))if(w.account&&w.account==s)r=1;else{i=w.account?w.account:w.oun;i=w.allAccounts?w.allAccounts:i.split(",");for(p=0;p<o.length;p++)for(n=0;n<i.length;n++)o[p]==i[n]&&(r=1)}m++}r||(w=new AppMeasurement);w.setAccount?w.setAccount(s):w.sa&&w.sa(s);return w}AppMeasurement.getInstance=s_gi;window.s_objectID||(window.s_objectID=0);
function s_pgicq(){var s=window,w=s.s_giq,k,m,i;if(w)for(k=0;k<w.length;k++)m=w[k],i=s_gi(m.oun),i.setAccount(m.un),i.setTagContainer(m.tagContainerName);s.s_giq=0}s_pgicq();



// Finally, run the SiteCat code if we're supposed to:
if (typeof(trackQueryString) != "undefined" && trackQueryString) s.pageURL = document.location;
if (!isMgmtStage && isSiteCatOn) {
	s.t();
}