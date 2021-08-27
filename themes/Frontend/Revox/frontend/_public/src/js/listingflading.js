// Select all links with hashes
$('a[href*="#"]')
    // Remove links that don't actually link to anything
    .not('[href="#"]')
    .not('[href="#0"]')
    .click(function(event) {
        // On-page links
        if (
            location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
            &&
            location.hostname == this.hostname
        ) {
            // Figure out element to scroll to
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            // Does a scroll target exist?
            if (target.length) {
                // Only prevent default if animation is actually gonna happen
                event.preventDefault();
                $('html, body').animate({
                    scrollTop: target.offset().top
                }, 1000, function() {
                    // Callback after animation
                    // Must change focus!
                    var $target = $(target);
                    $target.focus();
                    if ($target.is(":focus")) { // Checking if the target was focused
                        return false;
                    } else {
                        $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
                        $target.focus(); // Set focus again	
                    };
                });
				
            }
        }
    });



$(document).ready(function() {
    $("a").removeAttr("title");
});

$(document).scroll(function(){
  if(document.getElementById('mobiljumpline')){	
	  var jumpline = document.getElementById('mobiljumpline').parentNode;
	  if(jumpline != null){
		if(jumpline.style.visibility == "hidden"){
			jumpline.style.visibility = "visible";
		}
	  }
	}
});

function visiblejumpline(wert){
var jumpline = document.getElementById('mobiljumpline').parentNode;
	if(jumpline != null){
		wert = wert.replace('#','');
		if(wert == "equipment"){
			header = document.getElementById('equipmentDesc')
			content = document.getElementById('equipmentDescCont')
			header.classList.add('is--active');
			content.classList.add('is--collapsed');
			content.style.display = "block";
		}
		wert = wert+"Desc";
		var look = document.getElementById(wert);
		if(look != null){
			toggleshort(wert);
		}
		if (jumpline.style.visibility == "visible"){
			setTimeout(function(){ 
				jumpline.style.visibility = "hidden";
			},50);
		}
	}	
}

/*
function isMobile(){
	return navigator.userAgent.match(/(iPhone|iPod|iPad|blackberry|android|Kindle|htc|lg|midp|mmp|mobile|nokia|opera mini|palm|pocket|psp|sgh|smartphone|symbian|treo mini|Playstation Portable|SonyEricsson|Samsung|MobileExplorer|PalmSource|Benq|Windows Phone|Windows Mobile|IEMobile|Windows CE|Nintendo Wii)/i);
}*/


function swapBackgroundm(strImg) {
    document.getElementById('imagefadingmobile').style.backgroundImage = "url("+strImg+")";
}

function swapBackgroundd(strImg) {
    document.getElementById('imagefadingdesktop').style.backgroundImage = "url("+strImg+")";
}

function swapNewBackground(strImg,imagelink,subCat,artId) {
	var isactive = document.getElementById(subCat).classList[1];
	var old = document.getElementsByClassName('isartactive')[0];
	if(isactive == 'subopen'){
		old.classList.remove('isartactive');
		document.getElementById(artId).classList.add('isartactive');
		document.getElementById('categorybackgroundpicture').style.backgroundImage = "url("+strImg+")";
		document.getElementById('backgroundlink').href = imagelink;
	}
}

function swapSmallBackground(strImg,imagelink,artId) {
	var old = document.getElementsByClassName('isartactive')[0];
	old.classList.remove('isartactive');
	document.getElementById(artId).classList.add('isartactive');
	document.getElementById('categorybackgroundpicture').style.backgroundImage = "url("+strImg+")";
	document.getElementById('backgroundlink').href = imagelink;
}

//Hover-Effekt Sticky Bar im Detail Bereich
function stickyOnHover(boldid){
	document.getElementById(boldid).style.textShadow = "0.4px 0px 0px #000000";
	document.getElementById(boldid).style.textDecoration = "underline #000000";
}
function stickyOffHover(boldid){
	document.getElementById(boldid).style.textShadow = "unset";
	document.getElementById(boldid).style.textDecoration = "unset";
}

//Einblenden der Details "weitere Beschreibungen" mobil ohne effect
function toggleshort(control){
	var elem = document.getElementById(control);
	var parele = document.getElementById(control).parentNode;
	
	if(elem.style.maxHeight == "1px"){
		parele.classList.add('active');
		elem.style.maxHeight = "5000px";
	}
}

//Einblenden der Details "weitere Beschreibungen" mobil
function toggle(control){
	var elem = document.getElementById(control);
	var parele = document.getElementById(control).parentNode;
	
	if(elem.style.maxHeight == "1px"){
		parele.classList.add('active');
		elem.style.maxHeight = "5000px";
		elem.style.transition = "max-height 2s ease";
	}else{
		parele.classList.remove('active');
		elem.style.maxHeight = "1px";
		elem.style.transition = "max-height 0.5s ease";
	}
}

//Accordion Funktion für Kategorien Desktop
function categorymenuebar(control){
	var link = "sub"+control;
	var parele = document.getElementById(link);
	var old = document.getElementsByClassName('sub--active')[0];
	var elem = document.getElementById(control);
	var gib = document.getElementsByClassName('subopen')[0];
	
	if(elem.style.maxHeight == "1px"){
		old.classList.remove('sub--active');
		parele.classList.add('sub--active');
		elem.style.maxHeight = "550px";
		gib.style.maxHeight = "1px";
	}else{
		elem.style.maxHeight = "1px";
		gib.style.maxHeight = "550px";
	}
	gib.classList.remove('subopen');
	
	setTimeout(function(){ 
		elem.classList.add("subopen");
	},600);	
}

//Accordion Funktion für FAQ Inner
function faqmenuebar(control){
      	var link = "inn"+control;
      	var parele = document.getElementById(link);  
      	var elem = document.getElementById(control);

      	if(elem.style.maxHeight == "1px"){
      		elem.style.maxHeight = "max-content";
			parele.classList.add('subopen');
      	}else{
			parele.classList.remove('subopen');
      		elem.style.maxHeight = "1px";
      	}
      }

