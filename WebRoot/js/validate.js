/*登录注册验证*/
	function validate1(){
		var user=document.getElementById('user').value;
		var pwd=document.getElementById('pwd').value;
		if(user==""){
			alert("用户名不能为空！");
			return false;
		}
		if(pwd==""){
			alert("密码不能为空！");
			return false;
		}
		else return true;
	}
	/*function validate2(){
		var registeruser=document.getElementById('registeruser').value;
		var registerpwd=document.getElementById('registerpwd').value;
		var registerrepwd=document.getElementById('registerrepwd').value;
		if(registeruser==""){
			alert("用户名不能为空！");
			return false;
		}
		if(registerpwd==""||registerrepwd==""){
			alert("密码不能为空！");
			return false;
		}
		if(registerpwd!=registerrepwd){
			alert("两次密码不一致！请重新输入");
			return false;
		}
		else return true;
	}*/
//	异步登录
	/*function validate1(){
		var user=document.getElementById('user').value;
		var pwd=document.getElementById('pwd').value;
		if(user==""){
			alert("用户名不能为空！");
			document.getElementById('user').focus();
		}
		else if(pwd==""){
			alert("密码不能为空！");
			document.getElementById('pwd').focus();
		}
		else{
			$.post(
					"login",
					{"user":user,"pwd":pwd},
					function(result){
						if(result=="false")alert("用户名或密码错误!");
						else{
							document.getElementById("registerform").style.display="none";
							document.getElementById("signform").style.display="none";
							document.getElementById("login").style.display="none";
				    		document.getElementById("register").style.display="none";
				    		$("#username").text(user);
							document.getElementById("userinfo").style.display="inline-block";
						}
					}
			)
		}
	}*/
//	异步注册
	function validate2(){
		var registeruser=document.getElementById('registeruser').value;
		var registerpwd=document.getElementById('registerpwd').value;
		var registerrepwd=document.getElementById('registerrepwd').value;
		if(registeruser==""){
			alert("用户名不能为空！");
			document.getElementById('registeruser').focus();
//			return false;
		}
		else if(registerpwd==""||registerrepwd==""){
			alert("密码不能为空！");
//			return false;
		}
		else if(registerpwd!=registerrepwd){
			alert("两次密码不一致！请重新输入");
//			return false;
		}
		else{
			$.post(
					"register",
					{"registeruser":registeruser,"registerpwd":registerpwd},
					function(result){
						if(result=="success"){
							alert("注册成功!");
							document.getElementById("registerform").style.display="none";
							document.getElementById("signform").style.display="block";
						}
						else alert("用户已存在！");
					}
			)
		}
	}