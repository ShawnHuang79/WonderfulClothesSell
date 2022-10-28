<%@page pageEncoding='UTF-8'%>
<!DOCTYPE HTML>
<html>
	<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="UTF-8">
	    <title>會員登入</title>

	    <style>
			@import url(/wcs/css/wcs.css);
	
			header{
		        /*定位對齊*/
		        position:relative;   
		        margin: auto;
		        top: 20px;
		        text-align:center; 
	        }
			input, .loginAndSignup, #genderContainer{
	        	width: 250px;
	        	height: 20px;
	       	 	margin: 10px;
	        	color: #df5334;
	        }
			input{
		        padding: 5px;
		        border: none; 
		        border:solid 1px #ccc;
		        border-radius: 5px;
	        }
			input[type="radio"], #showPwdBox{
				width: 30px;
	        	height: 15px;
	       	 	margin: 0px;
			}
			#genderContainer{
				height: 50px;
			}
	
	        div .switchBotton{
		        margin: 20px;
		        color: #a3a2a3;
	        }
	
	        div .switchBotton:hover{
	        	color: black;
	        }
			#loginContainer, #signupContainer{
		        padding: 10px;
		        width: 280px;
		        height: 300px;
		        background-color: white;
		        border-radius: 5px;
		        border-top: 10px solid #df5334;
		        box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
		        /*定位對齊*/
		        position:relative;   
		        margin: auto;
		        top: 200px;
	        }
			#signupContainer{
		        /*display: none;*/
		        height: 600px;
	        }
			
	

	
	        .submit{
		        color: white;  
		        background: #df5334;
		        width: 200px;
		        height: 30px;
		        margin: 10px;
		        padding: 5px;
		        border-radius: 5px;
		        border: 0px;
	        }
	        .submit:hover{
	        	background: #db6937;
	        }
	        #captchaImage{
	        	cursor: pointer;
	        }
	        
	        footer{
				position:relative; 
		        text-align: center;
		        color: #a3a2a3;
		        margin: 220px 0px 0px 0px;
		        font-size: 14px;
	        }
	

    	</style>
	    <script src="https://code.jquery.com/jquery-3.0.0.js" 
	    integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script>
			$(document).ready(init);
			function init(){
				$("#showPwdBox").click(showPasswordHandler);
			}
			function showPasswordHandler(){
				if ((($("#showPwdBox").prop("checked")))){
					$("#Pwd").attr("type", "text");
				}else{
					$("#Pwd").attr("type", "password");
				}	
			}
			function refreshCaptcha(){
				$("#captchaImage").attr("src","images/login_captcha.jpg?refresh="+ new Date());
			}

		</script>

	</head>  
  	<body>
	    <header>
	    	<h2>網站首頁</h2>
	    </header>
	    <div id="loginContainer"> <!-- 改article -->
	        <div class="loginAndSignup">  
	        	<h3>登入 Login</h3>
	        </div>
        	<form action="login.do" method="POST">
        		<div>${errorList}</div>
	            <input type="text" name="id" placeholder="帳號或email" required>
	            <input type="password" id="Pwd" name="password" placeholder="密碼" required>
				<input type="checkbox" id="showPwdBox"><label>顯示密碼</label>
				<input name='captcha' required placeholder="請輸入驗證碼">
				<img src="images/login_captcha.jpg" id="captchaImage" onclick="refreshCaptcha()" title="點選即可更新圖片"><br>
	        	<input type="submit" value="登入" class="submit" onclick="location.href='https://'">

        	</form>  

	    </div>
	
		<footer id="copyright">
	      	<h4>Copyright &copy;2022 All rights reserved</h4>
	    </footer>    
  	</body>
</html>