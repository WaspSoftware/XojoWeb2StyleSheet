
for (let n=0; n< document.styleSheets.length; n++){

	if (document.styleSheets[n].href.includes("WASP.css")){
	
		for(let i = 0; i < document.styleSheets[n].cssRules.length; i++) {
			if(document.styleSheets[n].cssRules[i].selectorText.includes('.WASPWebPopupMenu li')) {
					console.log(document.styleSheets[n].cssRules[i]);
					document.styleSheets[n].cssRules[i].cssText = ".[id={controlId}_menu'] li { background-color: blue; }";
					console.log(document.styleSheets[n].cssRules[i].cssText);

			}
		}
		
	}
}





var style = document.createElement("style");
    style.type = "text/css";
    style.id = '{controlId}_mystyle';
    if (style.styleSheet) {
        style.styleSheet.cssText = ".[id={controlId}_menu'] li { background-color: blue; }";
    } else {
        style.appendChild(document.createTextNode("[id='{controlId}_menu'] li { background-color: blue; }"));
    }
var head = document.head || document.getElementsByTagName("head")[0];
head.appendChild(style);










		for(let i = 0; i < document.styleSheets[n].cssRules.length; i++) {
			if(document.styleSheets[n].cssRules[i].selectorText.includes('.WASPWebPopupMenu li')) {
					console.log(document.styleSheets[n].cssRules[i]);
					var thisSelectorText = ".{WASPclassName] li, [id='Dkhjqf_menu'] li";
					document.styleSheets[n].cssRules[i].selectorText= thisSelectorText;
					console.log(document.styleSheets[n].cssRules[i].selectorText);
					console.log(thisSelectorText);
			}
		}


	

	for(let i = 0; i < document.styleSheets[n].cssRules.length; i++) {


	  if(document.styleSheets[n].cssRules[i].selectorText.substring(0, {WASPclassNameLength} + 3) === '.{WASPclassName} UL') {


		

	  }
	}
}
