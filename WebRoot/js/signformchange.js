$(function ()//×¢²áµÇÂ¼´°¿ÚÇÐ»»
{
        $('.change a').click(function ()
        {
            $('.signform').animate({height: 'toggle', opacity: 'toggle'}, 'normal');
        });
})
/*µÇÂ½×¢²á´°¿Ú*/
function login(){
	document.getElementById('signform').style.display="block";
}
function register() {
	document.getElementById('registerform').style.display="block";
}
function signclose() {
    document.getElementById('signform').style.display="none";
    document.getElementById('registerform').style.display="none";
}
