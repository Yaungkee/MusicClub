$(function ()//ע���¼�����л�
{
        $('.change a').click(function ()
        {
            $('.signform').animate({height: 'toggle', opacity: 'toggle'}, 'normal');
        });
})
/*��½ע�ᴰ��*/
function login(){
	document.getElementById('registerform').style.display="none";
	document.getElementById('signform').style.display="block";
}
function register() {
	document.getElementById('registerform').style.display="block";
	document.getElementById('signform').style.display="none";
}
function signclose() {
    document.getElementById('signform').style.display="none";
    document.getElementById('registerform').style.display="none";
}
