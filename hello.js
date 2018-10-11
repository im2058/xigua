// a phantomjs example
var page = require('webpage').create();
phantom.outputEncoding="gbk";
page.open("https://www.ixigua.com/c/user/12321779512", function(status) {
	if ( status === "success" ) {
	       console.log(page.content); 
	    } else {
	       console.log("Page failed to load."); 
	    }
	 phantom.exit(0);
	 });
