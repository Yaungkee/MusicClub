<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>音乐圈</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="img/favicon.ico"/>
	<link rel="bookmark" href="img/favicon.ico"/>
	<script type="text/javascript" src="js/vue.js"></script>
	<link href="css/video-js.css" rel="stylesheet">
	<script src="js/video.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/layui/css/layui.css">
    <link rel="stylesheet" href="css/sign.css">
    <link rel="stylesheet" href="css/shareform.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/signformchange.js"></script>
	<script src="js/shareform.js"></script>
	<script src="js/validate.js" ></script>
    <script>
    /* window.onload=function(){
    	var share1=document.getElementById("share1");
    	var operate=document.getElementById("operate");
    	share1.onmouseover=function(){
    		operate.style.display="inline-block";
    	}
    	share1.onmouseout=function(){
    		operate.style.display="none";
    	}
    } */
    </script>
	<style>
		[v-cloak] {
            display: none !important;
        }
        .clear{
        	clear:both;
        }
		body {background-color: #525252;}
		/*#divnav{*/
			/*position: sticky;*/
			/*position: -webkit-sticky;*/
			/*background-color: #393D49;*/
			/*top: 0;*/
		/*}*/
		#search{
			border-radius:0.2em;
			width: 290px;
			padding-left:10px;

            -webkit-transition: all 0.30s ease-in-out;
            -moz-transition: all 0.30s ease-in-out;
            -ms-transition: all 0.30s ease-in-out;
            -o-transition: all 0.30s ease-in-out;
		}
        #search:focus{
            box-shadow: 0 0 5px rgba(216,76,41,1);
            border: rgba(216,76,41,1) 1px solid;
        }
        textarea:focus{
            box-shadow: 0 0 5px rgb(115, 115, 255);
            border: rgba(115, 115, 255,1) 1px solid;
        }
		.search-history{
            display: none;
			position: absolute;
			width: 100%;
			margin-top: 1px;
			background: #FFFFFF;
			color: black;
			z-index: 99999;
			border-radius: 2px;
			box-shadow: 0 2px 4px rgba(0,0,0,.16);
			padding: 10px 0;
		}
		.history-item{
            padding: 0px 10px 0px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
			color: black;
			height: 32px;
			line-height: 32px;
			cursor: pointer;
            overflow: hidden;
            white-space: nowrap;
            /*word-wrap: break-word;*/
            /*word-break: break-all;*/
		}
        .history-item a{
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .history-item:hover{
            background: #f4f4f4;
        }
        .history-item i:hover{
            color: blue;
        }
        .sharedivBottom{border-bottom:1px dashed #3F3F3F;}
        .sharedivRight{border-right:1px dashed #3F3F3F;}
        #sharediv a:link {text-decoration:none;color:blue;}
        #resultdiv a:link {text-decoration:none;color:white;}
        /* #download a:link {text-decoration:none;color:white;} */
        #share1 a:link {text-decoration:none;color:#d4d4d4;}
        #share1 p{color:white;}
        #share2 a:link {text-decoration:none;color:white;}
        #resultdiv{
        	position:absolute;
        	color:white;
        	/*background-color:#525252;*/
        	display:flex;
        	flex-direction:row;
        	width:30%;
        	height:auto;
        }
        #sharediv{
        	position:relative;
        	/*background-color:#525252;*/
        	display:flex;
        	flex-direction:column;
        	left:30%;
        	width:60%;
        	height:auto;
        	min-height:92%;
        }
        #share2{
        	/*background:#525252;*/
        	color:white;
        	left:10%;
        	width:30%;
        	min-height:53px;
        	max-height:100px;
        }
        #channelv{
        	width:760px;
		position:relative;
        	left:31%;
        	display:none;
        }
        #audio{
        	position:fixed;
        	bottom:0px;
        	left:40%;
        }
		.playing{

		}
		.playlist{
			color: chartreuse;
		}
        .nav-ul{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
    
</head>
  
<body>
<%!
	/* Cookie */
	/* String name;
	String pwd; */
	/* 根路径 */
	String Path;
%>
<%
	/* Cookie[] cookies=request.getCookies();
	for(Cookie cookie:cookies){
		if("name".equals(cookie.getName())){
			name=cookie.getValue();
		}
	} */
	Path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
 %>
 <%
 	/* 通过Sessoin拦截输入地址访问 */
	/* String username=(String)session.getAttribute("username");
	String password=(String)session.getAttribute("password");
	if(username==null||password==null){
		response.sendRedirect("login.jsp");
	} */
  %>

<div id="main">
    <div  id="divnav">
	    <ul class="layui-nav nav-ul">
		    <div class="nav-left">
			    <li id="li0" class="layui-nav-item">
					<img src="img/logo.png" style="width:50px;height:50px;"></img>
				</li>
				<li id="li1" class="layui-nav-item" >
				  	<a href="jsp/index.jsp">首页</a>
				</li>
				<li id="li2" class="layui-nav-item" >
				    <a href="javascript:void(0)" @click="change()">破解模式</a>
				</li>
				<li id="li3" class="layui-nav-item" >
				  	<a href="javascript:void(0)" @click="playVedio()">Channel V</a>
				</li>
				<!-- <li id="li4" class="layui-nav-item">
					<a href="javascript:void(0)">每月精选</a>
				</li> -->
		    </div>
		    <div class="nav-middle">
                <li class="layui-nav-item" id="search-nav">
                    <input type="search" id="search" name="search" v-model="query" @keyup.enter="searchMusic()" placeholder="歌名/歌手" autocomplete="off" class="layui-input">
                    <button @click="searchMusic()" class="layui-btn layui-btn-primary" style="position: absolute;right: 0;top:0;width: 40px;height: 38px;">
                        <i class="layui-icon">&#xe615;</i>
                    </button>
                    <ul class="search-history" v-show="storageArray.length">
                        <li class="history-item" v-for="(value,index) in storageArray" v-cloak>
                            <a href="javascript:;" @click="searchMusic(value)" style="color: black;">{{value}}</a>
                            <i class="layui-icon layui-icon-close" @click="deleteLocalStorage(index)"></i>
                        </li>
                        <li class="history-item">
                            <a href="javascript:;" @click="clearLocalStorage()" style="color: blue;">清空搜索历史</a>
                            <i class="layui-icon layui-icon-delete" @click="clearLocalStorage()" style="color: blue;"></i>
                        </li>
                    </ul>
                </li>
            </div>
            <div class="nav-right">
                <li id="login" class="layui-nav-item">
                    <a href="javascript:void(0)" onclick ="login()">登录</a>
                </li>
                <li id="register" class="layui-nav-item">
                    <a href="javascript:void(0)" onclick ="register()">注册</a>
                </li>
                <li id="userinfo" class="layui-nav-item" style="display: none;">
                    <a id="username" herf="javascript:void(0)"><span>${sessionScope.username}</span></a>
                    <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <%-- <dd><a href="<%=Path%>/jsp/home.jsp">我的主页</a></dd>
                    <dd><a href="<%=Path%>/jsp/updateinfo.jsp">个人设置</a></dd> --%>
                    <dd><a href="javascript:void(0)" @click="logout()">退出</a></dd>
                    </dl>
                </li>
		    </div>
		    <%--<div class="clear"></div>--%>
		</ul>
	</div>
<noscript style="color:white">
	<strong>We're sorry but webpage doesn't work properly without JavaScript enabled. Please enable it to continue.</strong>
	<br>
	<strong>很抱歉，没有启用JavaScript，网页无法正常工作。请开启后尝试。</strong>  
</noscript>
	<!-- 登录/注册弹窗 -->
	<div class="signform" id="signform" style="display: none;">
	    <div class="signclose layui-icon layui-icon-close" onclick="signclose()"></div>
	    <form action="login" method="post" onsubmit="return validate1()"><!-- 登录action -->
		    <div class="userdiv">
		    <input id="user" class="signinput" type="text" placeholder="用户名" name="user" >
		    </div>
		    <div class="pwddiv">
		    <input id="pwd" class="signinput" type="password" placeholder="密码" name="pwd">
		    </div>
		    <div class="postdiv">
		    	<button class="layui-btn layui-btn-lg layui-btn-normal" value="登录" style="padding:0 125px">登录</button>
		    </div>
	    </form>
	    <br>
	    <div class="change" style="color: #4d4d4d">
	        <p>还没有账号?赶快<a href="javascript:void(0)" style="text-decoration: none;color: #43A047">注册</a>吧</p>
	    </div>
	</div>
	<div class="signform" id="registerform" style="display: none;">
        <div class="signclose layui-icon layui-icon-close" onclick="signclose()"></div>
	        <!-- <form class="layui-form" action="register" method="post" onsubmit="return validate2()"> --><!-- 注册Action -->
	        <!-- <form class="layui-form"> -->
		        <div class="userdiv">
		            <input  id="registeruser" class="signinput" type="text" placeholder="用户名" maxlength="10" name="username" οnblur="loading()">
		        </div>
		        <div class="pwddiv">
		            <input  id="registerpwd" class="signinput" type="password" placeholder="密码" maxlength="16" name="password">
		        </div>
		        <div class="pwddiv">
		            <input  id="registerrepwd" class="signinput" type="password" placeholder="确认密码" maxlength="16" name="repassword">
		        </div>
		        <!-- <div class="layui-form-item">
				    <div class="layui-input-block">
				    	<input type="radio" name="sex" value="男" title="男">
				    	<input type="radio" name="sex" value="女" title="女">
				    </div>
				</div> -->
		        <div class="postdiv">
		            <button class="layui-btn layui-btn-lg layui-btn-normal" onclick="validate2();" style="background-color:#43A047;padding:0 125px">注册</button>
		        </div>
	        <!-- </form> -->
	        <br>
	        <div class="change" style="color: #4d4d4d">
	            <p>已有账号?立刻去<a href="javascript:void(0)" style="text-decoration: none;color: #43A047">登录</a>吧</p>
	            
	        </div>
	</div>
	<!-- 分享弹窗 -->
	<div class="layui-form" id="shareform" style="display: none;">
	    <div class="shareclose layui-icon layui-icon-close" onclick="shareclose()"></div>
	    <form class="layui-form-item layui-form-text" id="share" action="share" method="post"><!-- 分享action -->
		    <span id="sharename" style="padding: 5px">
		    </span>
		    <div>
		    	<textarea id="sharecomment" name="comment" @input="limitcomment()" v-model="sharecomment" placeholder="评论" cols="27" maxlength="180" required ></textarea>
		    	<input type="text" name="musicid" v-model="musicid" style="display:none">
		    	<input type="text" name="musicname" v-model="musicname" style="display:none">
		    </div>
		    <div class="layui-form-item">
		    	<div class="layui-input-block" style="margin-top: 2px;">
			      <input type="submit" v-if="count>=0&&count<180" class="layui-btn" value="分享">
			      <input type="reset" @click="count=180" class="layui-btn layui-btn-primary" value="清空">
			      <span style="position:absolute;right:20px">{{count}}</span>
			    </div>
		    </div>
	    </form>
	</div>
	<!-- 音乐搜索结果列表 -->
	<div id="resultdiv" ><!-- class="layui-bg-green" -->
		<span id="musiclist"style="text-align:left;">
			<!-- 网易云搜索列表 -->
			<ul v-if="musicType==1" id="songlist1">
		  		<li v-for="(song,songindex) in musicList" v-cloak>
		  			<div>
		  				<i>{{songindex+1}}</i>
			  			<a href="javascript:;" @click="playMusic(song.id,'',1,musicList)" class="layui-icon layui-icon-play"></a>
			  			<big :id="song.id">{{song.name}}</big>
			  			<b style="color:#aeaeae">-</b>
			  			<span v-for="(artists,index) in song.artists">
							<a href="javascript:void(0);" style="color:#aeaeae" :title="artists.name" @click="searchMusic(artists.name)">{{artists.name}} </a>
						</span>
			  			<b v-for="alia in song.alias" style="color:#323232">{{alia}}</b>
			  			<a href="javascript:;" @click="share(song.id,song.artists,song.name)" class="layui-icon layui-icon-share" style="position:absolute;right:0"></a>
		  			</div>
		  		</li>
	  		</ul>
			<!-- 酷我搜索列表 -->
	  		<ul v-if="musicType==2" id="songlist2">
		  		<li v-for="(song,songindex) in musicList" v-cloak>
		  			<div>
		  				<i>{{songindex+1}}</i>
			  			<a href="javascript:;" @click="playMusic(song.MUSICRID,'',2,musicList)" class="layui-icon layui-icon-play"></a>
			  			<big :id="song.MUSICRID">{{song.SONGNAME}}</big>
			  			<span style="color:#aeaeae">-{{song.ARTIST}}</span>
			  			<b v-for="alia in song.alias" style="color:#323232">{{alia}}</b>
		  			</div>
		  		</li>
	  		</ul>
			<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 10px;">--%>
				<%--<legend>列边框表格</legend>--%>
			<%--</fieldset>--%>

			<%--<table class="layui-table" lay-skin="line">--%>
				<%--<colgroup>--%>
					<%--<col width="10">--%>
					<%--<col width="30">--%>
					<%--<col width="30">--%>
					<%--<col width="30">--%>
				<%--</colgroup>--%>
				<%--<thead>--%>
					<%--<tr>--%>
						<%--<th>序号</th>--%>
						<%--<th>歌名</th>--%>
						<%--<th>歌手</th>--%>
						<%--<th>操作</th>--%>
					<%--</tr>--%>
				<%--</thead>--%>
				<%--<tbody>--%>
					<%--<tr v-for="(song,songindex) in hotmusicList" v-cloak>--%>
						<%--<td style="text-align: center">{{songindex+1}}</td>--%>
						<%--<td>{{song.name}}</td>--%>
						<%--<td>--%>
                            <%--<span v-for="(artists,index) in song.ar">--%>
							    <%--<a href="javascript:void(0);" :title="artists.name" style="color: black;">{{artists.name}}&nbsp;</a>--%>
						    <%--</span>--%>
                        <%--</td>--%>
						<%--<td><a href="javascript:;" @click="share(song.id,song.ar,song.name)" class="layui-icon layui-icon-share"style="color: black;"></a></td>--%>
					<%--</tr>--%>
			  	<%--</tbody>--%>
			<%--</table>--%>
			<!-- 热歌榜 -->
	  		<ul v-if="musicType==1" id="hotsong">
		  		<li v-for="(song,songindex) in hotmusicList" v-cloak>

		  				<i>{{songindex+1}}</i>
			  			<a href="javascript:;" @click="playMusic(song.id,'',3,hotmusicList)" class="layui-icon layui-icon-play"></a>
			  			<big :id="song.id">{{song.name}}</big>
			  			<b style="color:#aeaeae">-</b>
			  			<span v-for="(artists,index) in song.ar">
							<a href="javascript:void(0);" :title="artists.name" @click="searchMusic(artists.name)" style="color:#aeaeae">{{artists.name}}&nbsp;</a>
						</span>
			  			<b v-for="alia in song.alia" style="color:#323232">{{alia}}</b>
			  			<a href="javascript:;" @click="share(song.id,song.ar,song.name)" class="layui-icon layui-icon-share" style="position:absolute;right:0"></a>

		  		</li>
	  		</ul>
		</span>
	</div>
	<!-- ChannelV -->
	<div id="channelv">
		<!-- <video id="MY_VIDEO_1" class="video-js vjs-default-skin" controls autoplay preload="none" width="960" height="540" data-setup="{}">
            <source src="rtmp://ivi.bupt.edu.cn:1935/livetv/channelv" type="rtmp/flv">
		</video> -->
	</div>
	<!-- 分享区域 -->
	<div id="sharediv">
		<div v-for="(share,index) in shareList" class="sharedivBottom" style="display:flex;flex-direction:row;height:auto;min-height:50px;margin-top:10px;"v-cloak>
			<%-- <div >
				<img src="<%=Path%>/img/head.jpg"style="width:100px;height:97px;"></img>
			</div> --%>
			<span id="share1"class="comment" style="margin-left:10px;padding-left:3px;width:70%;height:auto;">
				<div >
					<a href="javascript:void(0)">{{share.username}}</a><b style="padding-left:6px;">:&nbsp;</b>
					<p v-html="share.comment" style="padding-left:6px;"></p>
				</div>
				<div style="position:relative;top:auto;margin-top:15px;">
					<span style="color:#afafaf">{{share.create_dt}}</span>
					<span style="float:right">
						<a href="javascript:void(0)" @click="likecomment(index,share.commentid)" class="layui-icon">&#xe6c6;</a><span style="color:#d4d4d4;">({{share.like}})</span>
						<span id="operate" v-if="share.username=='${sessionScope.username}'" style=""><a href="javascript:void(0)" @click="deletecomment(index,share.username,share.commentid)">删除</a></span>
					</span>
				</div>
			</span>
			<span id="share2">
				 <a href="javascript:;" v-if="musicType==1" @click="playMusic(share.musicid,share.commentid,4,shareList)" class="layui-icon layui-icon-play"></a>
				 <span :id="share.commentid">{{share.musicname}}</span>
			</span>
		</div>
	</div>
	<!-- 播放源 -->
	<div id="audio" style="display:none">
		<audio :src="musicUrl" controls autoplay loop></audio>
	</div>
</div>
	<script>
    	var err="${requestScope.err}";
    	if(err!="")alert(err);
    	var success="${requestScope.success}";
    	if(success!="")alert(success);
    </script>
	<script src="resources/layui/layui.js"></script>
	<script>
		layui.use(['element','form'],function(){});
	</script>
	<script>
		var app=new Vue({
	  	el:"#main",
	  	data:{
	  		query:"",
            tempquery:"",
	  		musicList:[],
	  		hotmusicList:[],
	  		artistsList:[],
            playsharemusicFlag:0,
			playingmusicId:"",
            playlist:[],
			musicInfo:{
	  			name:"",
				artist:"",
				album:"",
				cover:"",
				id:""
			},
	  		musicid:"",
	  		musicname:"",
	  		musicUrl:"",
	  		musicType:1,
            playmusicType:0,
            changeFlag:1,
            searchcount:0,
            searchagainFlag:1,
            searchremoveclassFlag:1,
	  		vedioUrl:"",
	  		vedioflag:true,
	  		url:"http://antiserver.kuwo.cn/anti.s?useless=/resource/&format=mp3&response=res&type=convert_url&rid=",
	  		shareList:[],
	  		sharecomment:"",
	  		count:180,
	  		commentid:0,
	  		localStorage:{},
            storageArray:[],
	  	},
	  	methods:{
	  		change:function(){
	  			this.musicList=null;
	  			this.changeFlag=0;
	  			this.searchcount=0;
	  			this.searchagainFlag=0;              //又可以搜重复词了
                this.searchremoveclassFlag=1;
	  			if(this.musicType==1){
		  			this.musicType=2;
		  			document.getElementById("li2").firstChild.innerHTML="普通模式";
		  			$("#musiclist").prepend("<p id='tips1'>已切换到破解模式，请尝试搜索付费歌曲</p>");
		  			if(this.query!="")this.searchMusic();
	  			}
	  			else if(this.musicType==2){
	  				this.musicType=1;
	  				document.getElementById("li2").firstChild.innerHTML="破解模式";
	  				var oP=document.getElementById("tips1");
	  				oP.parentNode.removeChild(oP);
	  				this.loadhotsong();
	  			}
	  		},
	  		searchMusic:function(value){
	  		    var query=this.query;
	  		    if(value)query=value;

	  		    if(!query||(this.searchagainFlag&&query&&this.tempquery==query))return;
	  		    if(query&&this.tempquery!=query)this.tempquery=query;
	  		    this.searchcount+=1;
                if(this.musicType==1&&this.playmusicType==1&&this.playingmusicId&&!this.playsharemusicFlag&&!this.searchremoveclassFlag){
                    document.getElementById(this.playingmusicId).classList.remove("playing", "playlist");
                    this.searchremoveclassFlag=1;
                }
                else if(this.musicType==2&&this.playmusicType==2&&this.searchcount>1&&!this.searchremoveclassFlag){
                    document.getElementById(this.playingmusicId).classList.remove("playing", "playlist");
                    this.searchremoveclassFlag=1;
                }
                /*更新localStorage*/
                if (this.storageArray.indexOf(query)==-1) {//无重复
                    if(this.storageArray.length>=10)
                        this.storageArray.pop();//多出的尾部删除
                }else{//有重复
                    var index=this.storageArray.indexOf(query);
                    this.storageArray.splice(index,1);
                }
                this.storageArray.unshift(query);//头插法
                this.localStorage.setItem("arr",JSON.stringify(this.storageArray));

	  			if(this.musicType==1){
		  			/* 网易云 */
		  			document.getElementById("hotsong").style.display="none";
		  			var url="https://autumnfish.cn/search?keywords="+query+"&limit=100&type=1";
		  			var that=this;
		  			$.get(
		  				url,
		  				function(response){
			  				that.musicList=response.result.songs;
			  				// console.log(that.musicList);
		  				}
		  			);
	  			}
	  			else if(this.musicType==2){
		  			/* 酷我 */
                    var url="http://search.kuwo.cn/r.s?client=kt&all="+query+"&pn=0&rn=200&uid=700538539&ver=kwplayer_ar_99.99.99.99&vipver=1&ft=music&cluster=0&strategy=2012&encoding=utf8&rformat=json&vermerge=1&mobi=1";
                    // var url="http://search.kuwo.cn/r.s?client=kt&all="+query+"&pn=0&rn=200&uid=221260053&ver=kwplayer_ar_99.99.99.99&vipver=1&ft=music&cluster=0&strategy=2012&encoding=utf8&rformat=json&vermerge=1&mobi=1";
		  			var that=this;
		  			$.ajax({
					    url: url,
					    type: 'get',
					    dataType: 'jsonp',  // 请求方式为jsonp
					    crossDomain: true,
						success: function(response){
                            if(response.abslist===undefined)alert("未找到歌曲，尝试换一个关键词吧");
                            else {
                                that.musicList=response.abslist;
                            }
                        },
                        error: function(){
					        console.log("请求失败！");
                        },
					    data: {}
					});
					// document.getElementById("songlist2").style.display="block";
				}
                this.searchagainFlag=1;
	  		},
			/*axios.get("https://autumnfish.cn/search?keywords="+query)
	  			.then(function(response){
	  				console.log(response);
	  				that.musicList=response.data.result.songs;
	  				console.log(that.musicList);
	  				for(var i=0;i<that.musicList.length;i++){
	  					that.artistsList=that.musicList[i].artists;
	  				}
	  				console.log(that.artistsList.name);
	  			},function(err){});
	  		}*/
			changePlayingClass:function(musicId,commentid) {
				if(commentid)musicId=commentid;
				if (((!this.searchremoveclassFlag&&(this.searchcount>1||this.changeFlag))||(this.playmusicType==1&&this.musicType==2&&this.playsharemusicFlag))&&this.playingmusicId && this.playingmusicId != musicId) {
                        document.getElementById(this.playingmusicId).classList.remove("playing", "playlist");
				}
				this.searchremoveclassFlag=0;
                document.getElementById(musicId).classList.add("playing", "playlist");
				this.playingmusicId = musicId;
                this.changeFlag=1;
				if(commentid)this.playsharemusicFlag=1;
				else this.playsharemusicFlag=0;
			},
	  		playMusic:function(musicId,commentid,listType,musicList){
	  			var that=this;
	  			if(this.musicType==1){
		  			/* 网易云 */
			   		/*
		  			$.get(
			  			"https://autumnfish.cn/song/url?id="+musicId,
			  			function(response){
			  			    // console.log(response);
			  				that.musicUrl=response.data[0].url;
							if(that.musicUrl==null){
			  					alert("此曲要收费，暂时播放不了！");
			  				}
			  				else{
								that.changePlayingClass(musicId,commentid);
								that.playmusicType=1;
								document.getElementById('audio').style.display="block";
			  				}
			  			}
			  		);
			   		*/
			   		that.musicUrl = 'http://music.163.com/song/media/outer/url?id=' + musicId;
			   		that.changePlayingClass(musicId,commentid);
                                        that.playmusicType=1;
                                        document.getElementById('audio').style.display="block";
				}
		  		else if(this.musicType==2){
			  		/* 酷我 */
					this.musicUrl=this.url+musicId;
					that.changePlayingClass(musicId);
					that.playmusicType=2;
					document.getElementById('audio').style.display="block";
				}
		  	},
		  	playVedio:function(){
		  		function hasUsableFlash(){
				    var flashObj;
				    if(typeof window.ActiveXObject != "undefined"){
				        flashObj= new  ActiveXObject("ShockwaveFlash.ShockwaveFlash");
				    }else{
				        flashObj= navigator.plugins['Shockwave Flash'];
				    }
				    return flashObj? true : false;
				}
				var result= hasUsableFlash();
				if(!result) {//不支持或未运行flash
				    alert("您未安装flash插件，或浏览器未启用flash插件！提示：由于Adobe公司停止了对手机浏览器Flash的支持，请打开电脑浏览器并开启Flash功能后尝试");
				}
				else{//支持并开启flash
					if(this.vedioflag){
				  		$('#channelv').html("<video id='MY_VIDEO_1' class='video-js vjs-default-skin' controls autoplay preload='none' width='760' height='540' data-setup='{}'></video>'");
				  		$('#MY_VIDEO_1').html("<source src='rtmp://ivi.bupt.edu.cn:1935/livetv/channelv' type='rtmp/flv'>");
				  		var myPlayer1 = videojs("#MY_VIDEO_1");
						videojs("#MY_VIDEO_1").ready(
							function(){
								var myPlayer1 = this;
								myPlayer1.play();
							}
						);
				  		document.getElementById("channelv").style.display="block";
						document.getElementById("channelv").childNodes[1].textContent="";
				  		document.getElementById("li3").firstChild.innerHTML="关闭Channel V";
				  		this.vedioflag=false;
			  		}
			  		else this.closevedio();
				}
		  	},
		  	closevedio:function(){
		  		videojs("MY_VIDEO_1").dispose();
		  		$('#channelv').innerHTML="";
		  		document.getElementById("li3").firstChild.innerHTML="Channel V";
		    		this.vedioflag=true;
		    	},
	  			/* axios.get("https://autumnfish.cn/song/url?id="+musicId)
	  			.then(function(response){
	  				that.musicUrl=response.data.data[0].url;
	  				if(that.musicUrl==null){
	  					alert("此曲要收费，暂时播放不了！");
	  				}
	  				else document.getElementById('audio').style.display="block";
	  			},function(err){}) */
	  		share:function(musicId,artistslist,songname){
	  			var artistsname="";
	  			var aList=[];
	  			for(var i=0;i<artistslist.length;i++){
                    aList[i]=artistslist[i].name;
	  			}
	  			artistsname=aList.join('、');
	  			this.musicname=artistsname+"-"+songname;
	  			var that=this;
	  			$.get(
	  				"https://autumnfish.cn/song/url?id="+musicId,
	  				function(response){
		  				if(response.data[0].url==null)
		  					alert("此曲要收费，暂时不能分享！");
		  				else {
		  					var username="${sessionScope.username}";
    						if(username==""){
    							document.getElementById("signform").style.display="block";
    						}
    						else {
    							document.getElementById("sharename").innerText="分享  "+that.musicname;
    							document.getElementById("shareform").style.display="block";
    							document.getElementById("sharecomment").focus();
    							that.musicid=musicId;
    						}
		  				}
	  				}	  				
	  			)
	  		},
	  		download:function(musicrid,artist,songname){
	  			var url=this.url+musicrid;
	  			var filename=artist+"-"+songname+".MP3";
	  			var that = this;
		        /* var oReq = new XMLHttpRequest();        
	            oReq.open("GET",url, true);       
	            oReq.responseType = "blob";  
	            oReq.withCredentials = true;//如果跨域             
	            oReq.onload = function(){           
			        var content = oReq.response;            
			        var a = document.createElement('a');            
			            a.download = filename;    
			            a.style.display = 'none';               
			        var blob = new Blob([content]);
			            a.href = URL.createObjectURL(blob);            
			            document.body.appendChild(a);            
			            a.click();
			            document.body.removeChild(a);        
		        };       
            	oReq.send(); */
            	/* $.ajax({
				    url: "http://antiserver.kuwo.cn/anti.s?useless=/resource/&format=mp3&rid=MUSIC_6767884&type=convert_url",
				    type: 'get',
				    dataType: 'text',  // 请求方式为jsonp
				    crossDomain: true,
					success: function(response){
							console.log(response);
						},
				    data: {}
				}); */
	  		},
	  		limitcomment:function(){
	  			this.sharecomment=this.sharecomment.replace(/\n/g,"\r\n");//js中换行表示为'\n',java、数据库表现为'\r\n'，存入数据库算两个字符
	  			var currentcount=this.sharecomment.length;
	  			this.count=180-currentcount;
	  		},
	  			/* axios.get("https://autumnfish.cn/song/url?id="+musicId)
	  			.then(function(response){
	  				that.musicUrl=response.data.data[0].url;
	  				if(that.musicUrl==null){
	  					alert("此曲要收费，暂时不能分享！");
	  				}
	  				else that.musicUrl=null;//防止自动播放
	  			},function(err){}) */
	  		likecomment:function(index,commentid){
	  			var that=this;
	  			that.commentid=commentid;
	  			/* alert(this.shareList[index].like); */
	  			
	  			var username="${sessionScope.username}";
				if(username==""){
					document.getElementById("signform").style.display="block";
				}
				else {
					$.post(
						"like",
						{"username":username,"commentid":that.commentid},
						function(result){
							if(result=="like")that.shareList[index].like++;
							else if(result=="dislike")that.shareList[index].like--;
							else alert("系统异常");
						},"text")
				}
	  		},
            deletecomment:function(index,username,commentid){
                /* var that=this;  */
                var currentusername="${sessionScope.username}";
                if(currentusername==""){
                    document.getElementById("signform").style.display="block";
                }
                else if(currentusername!=username){
                    alert("抱歉，您不是该评论的用户，不能操作");
                }
                else{
                    $.post(
                        "delete",
                        {"username":username,"commentid":commentid},
                        function(result){
                            if(result=="true")
                                window.location.reload();
                            else alert("系统异常，删除失败");
                        },"text");
                }
            },
	  		loadhotsong:function(){
	  			var that=this;
	  			$.get(
    				"https://autumnfish.cn/playlist/detail?id=3778678",
    				function(response){
    					// console.log(response);
		  				that.hotmusicList=response.playlist.tracks;
		  				that.hotmusicList.length=100;
		  			}
    			);
	  		},
	  		loaddata:function(){
	  			var that=this;
	  			var username="${sessionScope.username}";
		    	if(username!=""){
		    		document.getElementById("login").style.display="none";
				    document.getElementById("register").style.display="none";
				    document.getElementById("userinfo").style.display="inline-block";
		    	}
		    	
	  		 $.post(
    			 "load",
    			 function(result){
    			 	$.each(result,function(i,element){
    			 		this.comment=this.comment.replace(/(\r\n)+/g,"<br/>");
    			 	});
    			 	that.shareList=eval(result);
    			 },"json");
	  		},
            initEvent:function(){
                var history_flag=false;
                var focus_flag=false;
                var search_history_div=document.getElementsByClassName("search-history")[0];
                var input_search=document.getElementById("search");
                var that=this;
                function setFocusFlag(){
                    // console.log("focus---true");
                    return true;
                }
                function setBlurFlag(){
                    // console.log("focus---false");
                    return false;
                }
                function setHistoryEnterFlag(){
                    // console.log("historyenter---true");
                    return true;
                }
                function setHistoryLeaveFlag(){
                    // console.log("historyleave---false");
                    return false;
                }
                function historyShow(){
                    if (focus_flag&&that.storageArray.length) {
                        search_history_div.style.display="block";
                    }
                    if (!focus_flag&&!history_flag) {
                        search_history_div.style.display="none";
                    }
                }
                input_search.onfocus=function(){
                    focus_flag=setFocusFlag();
                    historyShow();
                }
                input_search.onblur=function(){
                    focus_flag=setBlurFlag();
                    historyShow();
                }
                search_history_div.onmouseenter=function(){
                    history_flag=setHistoryEnterFlag();
                    historyShow();
                }
                search_history_div.onmouseleave=function(){
                    history_flag=setHistoryLeaveFlag();
                    historyShow();
                }
            },
            initLocalStorage:function(){
                this.localStorage=window.localStorage;
                if (this.localStorage.length==0) {
                    this.localStorage.setItem("arr",JSON.stringify(this.storageArray));
                }else {
                    var localStorageString=this.localStorage.getItem("arr");
                    this.storageArray=JSON.parse(localStorageString);
                    if (this.storageArray.length>10){
                        this.storageArray.length=10;
                        this.localStorage.setItem("arr",JSON.stringify(this.storageArray));
                    }
                }
            },
            deleteLocalStorage:function(index){
	  		    this.storageArray.splice(index,1);
                this.localStorage.setItem("arr",JSON.stringify(this.storageArray));
            },
            clearLocalStorage:function(){
                this.storageArray.length=0;
                this.localStorage.setItem("arr",JSON.stringify(this.storageArray));
                document.getElementsByClassName("search-history")[0].style.display="none";
                document.getElementById("search").focus();
            },
            init:function(){
                this.initLocalStorage();//初始化localStorage
                this.initEvent();//初始化事件
            },
   			logout:function(){
		    	$.post(
		    		"logout",
		    		function(result){
		    			if(result=="success"){
		    				document.getElementById("login").style.display="inline-block";
				    		document.getElementById("register").style.display="inline-block";
							document.getElementById("userinfo").style.display="none";
		    			}
		    		}
		    	)
		    },
	  	},
	  	mounted:function(){
	  		this.loadhotsong();
	  		this.loaddata();
	  		this.init();
	  	}
	})
	</script>
</body>
</html>
