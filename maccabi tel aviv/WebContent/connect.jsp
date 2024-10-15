<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
<script language="javascript">

   function valid()
  	{
		var a=" `~!#$%^&*()_+=-;:[]{}|/<>,?1234567890.@אבגדהוזחטיכלמנסעפצקרשתץףך";						
		//E-mail//
		if (document.frm.email.value == "")    //e-mail is missing  
		{
			document.getElementById('emailValid').innerHTML="* הכנס/י דואר אלקטרוני";
			document.frm.email.focus();
			return false; 
		}
		else
			document.getElementById('emailValid').innerHTML="";

		for(i=0;a.charAt(i)!="1";i++)	//bad char
		{
			var badChar=a.charAt(i);
			if(document.frm.email.value.indexOf(badChar) != -1)
			{
				document.getElementById('emailValid').innerHTML="* אימייל לא תקין";
				return false;
			}
			else
				document.getElementById('emailValid').innerHTML="";
		}

		var shtrudel=document.frm.email.value.indexOf("@",1);
		if(shtrudel==-1)
		{
			document.getElementById('emailValid').innerHTML="* השטרודל חסר או שהוא לא נמצא במקום המתאים";
			return false;
		}
		else if(document.frm.email.value.split("@").length>2)
		{
			document.getElementById('emailValid').innerHTML="* יש יותר מדי שטרודלים באימייל שלך";
			return false;
		}
		else
			document.getElementById('emailValid').innerHTML="";

		var dot=document.frm.email.value.split("@");
		{
			if(dot[0].charAt(dot[0].length-1) == ".")
			{
				document.getElementById('emailValid').innerHTML="* את/ה לא יכול לשים נקודה לפני השטרודל";
				return false;
			}
			else
				document.getElementById('emailValid').innerHTML="";
		}
		var dot=dot[1].split(".");

		if (dot.length < 2){
			document.getElementById('emailValid').innerHTML="* אין אף נקודה אחרי השטרודל";
			return false;
		}
		else{
		if(dot.length > 3)
		{
			document.getElementById('emailValid').innerHTML="* יש יותר מ2 נקודות אחרי השטרודל";
			return false;
		}
		else
			document.getElementById('emailValid').innerHTML="";

		if(dot[0].length < 3)
		{
			document.getElementById('emailValid').innerHTML="* צריכות להיות לפחות 3 אותיות בין השטרודל לנקודה הראשונה";
			return false;
		}
		else
			document.getElementById('emailValid').innerHTML="";

		if(dot[1].length < 2)
		{
			document.getElementById('emailValid').innerHTML="* צריכות להיות לפחות 2 אותיות אחרי הנקודה הראשונה";
			return false;
		}
		else
			document.getElementById('emailValid').innerHTML="";

		if(dot[dot.length-1].length < 2)
		{
			document.getElementById('emailValid').innerHTML="* צריכות להיות לפחות 2 אותיות אחרי הנקודה האחרונה";
			return false;
		}
		else
			document.getElementById('emailValid').innerHTML="";
		}
		//End of E-mail//				
		//Password//
		if ( (document.frm.password.value.length < 4))                
			{
			  document.getElementById('passwordValid').innerHTML="* על הסיסמה להכיל לפחות 4 תווים";
	          document.frm.password.value="";    // to reset the area of the password
			  document.frm.password.focus();		
			  return false;
			}
		else
			document.getElementById('passwordValid').innerHTML="";
	
		if(document.frm.password.value.charAt(0) == " ")
			{
			document.getElementById('passwordValid').innerHTML="* תמחק/י את הרווח בתחילת הסיסמה";
	                	  document.frm.password.value="";    // to reset the area of the password
			  document.frm.password.focus();
			  return false;
			}
		else
			document.getElementById('passwordValid').innerHTML="";
	
		if (document.frm.password.value != document.frm.repeat_password.value )
			{
			  document.getElementById('passwordValid').innerHTML="* הסיסמאות לא מתאימות";
			  document.frm.password.value="";        //to reset the area of the password
			  document.frm.repeat_password.value=""; //to reset the area of the repeat_password
			  document.frm.password.focus();		
			  return false;
			}
		else
			document.getElementById('passwordValid').innerHTML="";
		//End of Password//      
		return true;		
   } 	// end valid()//       
</script>
 </head>
<body bgcolor="yellow" text="blue" onload="setInterval('clock()',1000)">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("UTF-8");
	  		response.setCharacterEncoding("UTF-8");
		// בכדי שיראו עיברית
%>	      
<table style="width:100%; height:100%; border:2px solid blue">        
        			<tr style="height: 110px; vertical-align: middle; text-align:center "  >           				
            				<td style="height: 50px; border:2px solid blue;" dir="rtl">
				  <div>
				   <img src="images/maccabiSymbol.jpg" align="right" width="20%"></img>
                    <span style="font-size:xx-large;text-decoration:underline;font-weight:bold;color:blue">ברוכים הבאים לאתר שלי</span>
					<img src="images/maccabiSymbol.jpg" align="left" width="20%"></img>
                			</div>
                			<% 
                			if ( session.getAttribute("visited")== null )				// ?מתי זה קורה
				{
					if (application.getAttribute("counter") == null)		// ?מתי זה קורה		
						application.setAttribute("counter", 1);
					else													// ?מתי זה קורה
					{						
						Integer counter = (Integer)application.getAttribute ("counter");
						counter = counter + 1;
						application.setAttribute("counter", counter);
					}
					session.setAttribute("visited", "Been Here");				// ?מתי זה קורה	
				}					
	   		
				out.print("&nbsp;&nbsp;&nbsp;&nbsp; מבקר מספר </b>");	
	   			out.print( "<b>#" + application.getAttribute ("counter"));
	   			%>
	   			<br/><br/>
	   			<jsp:include page="clock.jsp"></jsp:include> 
				</td>
        			</tr>
        				<tr style="height: 110px; vertical-align: middle; text-align:center "  >           				
            				<td style="height: 89px; border:2px solid blue;" dir="rtl">         				     			
				<jsp:include page="menu.jsp"></jsp:include>
			      
				</td>
        			</tr>		
		
			<tr style="height:700px">            
            				<td  id="main"  style="width: 100%; border:2px solid blue;" dir="rtl">
            				<center>                  							     			                      				
            <form name="frm"
            action="checkConnection.jsp"  			 					  
			method  ="post"
			onsubmit="return valid()">
			
     <table border="1" bordercolor="blue">	  	   
	   <tr>
		<td>אימייל</td>		
		<td><input type="text" name="email"></td>
		<td> <span style="background-color:yellow;border:none;text-align:center;font-weight:bold" class="formValid" id="emailValid"> </span> </td>		
	   </tr>			   		   	   		
	   <tr>	  
		<td>סיסמא</td>	
		<td><input type="password" name="password"  maxlength="6" ></td>
		 <td> <span style="background-color:yellow;border:none;text-align:center;font-weight:bold" class="formValid" id="passwordValid"> </span> </td>
	   </tr>
	   <tr align="center">
	   <td align="center"><input type="Reset" value="איפוס" ></td>
	   <td colspan="2"><input type="submit" name="submit" value="שלח"></td>	  
	   </tr>
	   </table> 	
	    </form>	       	                      	 			                
                			     </center>
                	
         				</td>
				
        			</tr>
    		</table>
</body>
</html>