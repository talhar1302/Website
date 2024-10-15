<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir = "rtl">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>
		<script language="javascript">

   function valid()
  	{
		var a=" `~!#$%^&*()_+=-;:[]{}|/<>,?1234567890.@אבגדהוזחטיכלמנסעפצקרשתץףך";				

		//First Name//
		if (document.frm.fname.value == "")	//אין שם פרטי
		{
		
			document.getElementById('fNameValid').innerHTML="* חסר שם פרטי";
			document.frm.fname.focus();
			return false; 
		}
		else
			document.getElementById('fNameValid').innerHTML="";
	
		if(document.frm.fname.value.charAt(0) == " ") //רווח לפני השם הפרטי
		{
			document.getElementById('fNameValid').innerHTML="* תמחק/י את הרווח בתחילת השם";
			document.frm.fname.focus();
			return false;
		}
		else
			document.getElementById('fNameValid').innerHTML="";
		
		for(var i=1;i<a.length;i++)	//תווים אסורים
		{
			var badChar=a.charAt(i);
			if(document.frm.fname.value.indexOf(badChar) != -1)
			{
				document.getElementById('fNameValid').innerHTML="* השם הפרטי חייב להכיל רק אותיות באנגלית";
				return false;
			}
			else
				document.getElementById('fNameValid').innerHTML="";
		}
		//End of First Name//


		//Last Name//
		if (document.frm.lname.value == "") //חסר שם משפחה 
		{
			document.getElementById('lNameValid').innerHTML="* חסר שם משפחה";
			document.frm.lname.focus();
			return false; 
		}
		else
			document.getElementById('lNameValid').innerHTML="";
	
		if(document.frm.lname.value.charAt(0) == " ") 
		{
			document.getElementById('lNameValid').innerHTML="* מחק/י את הרווח בתחילת השם משפחה";
			document.frm.lname.focus();
			return false;
		}
		else
			document.getElementById('lNameValid').innerHTML="";
		for(i=1;i<a.length;i++)
		{
			var badChar=a.charAt(i);
			if(document.frm.lname.value.indexOf(badChar) != -1)
			{
				document.getElementById('lNameValid').innerHTML="* השם משפחה יכול להכיל רק אותיות באנגלית";
				return false;
			}
			else
				document.getElementById('lNameValid').innerHTML="";
		}
		//End of Last Name//
	
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
		
		//Age//
		if(document.frm.age.value<4||document.frm.age.value>99)
			{
			document.getElementById('ageValid').innerHTML="* הגיל חייב להיות בן 4-99";
			return false;
			}
		else
			document.getElementById('ageValid').innerHTML="";
	
	     //End of age//
	     
	     //Team//
	     var indexTeam=document.frm.team.selectedIndex;
		 var Team= document.frm.team.options[indexTeam].value;
	     if(Team==0)
	    	 {
	    	 document.getElementById('teamValid').innerHTML="* חובה לבחור קבוצה אהובה עליך[מקווה שלא הפועל]";
				return false;
	    	 }
	     else
	    	 document.getElementById('teamValid').innerHTML="";
	     //End of team//
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
		<h2 align="center">הנתונים שברצונך לעדכן</h2>
		<center>
		<%

// בכדי שיראו עיברית
	  		request.setCharacterEncoding("UTF-8");
	  		response.setCharacterEncoding("UTF-8");
// בכדי שיראו עיברית

	

	if (session.getAttribute("connected")== null && session.getAttribute("eMail")== null )	//כלומר המשתמש הגיע לעמוד זה לא לפי המסלול שנקבע
		response.sendRedirect ("homepage.jsp");

	
	
%>				        				
<% 
	     String  result [][] = null;	
	 	
	 	 try 
	 		{
	 		// שלב א: טעינת המתפעל - דרייבר
	 		Class.forName("com.mysql.jdbc.Driver").newInstance();	
	 	
	 	
	 		//שלב ב:חיבור למסד הנתונים
	 		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/members?useUnicode=yes&characterEncoding=UTF-8","root","");
	 	
	 	
	 	
	 		//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
	 		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	             						       ResultSet.CONCUR_UPDATABLE);
	 		  		
	 		// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך ריזלטסט
	 	
	 		
	 		
	 		
	 		//שלב ד: יצירת שאילתה עבור מסד הנתונים
	 		String mySQL = "SELECT * FROM tMembers WHERE ID =" + session.getAttribute("connected")+" or email='"+session.getAttribute("eMail")+"'"; 
	 		System.out.println(mySQL);
	 		
	 		
	 		//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים		  		
	 		ResultSet oRS = st.executeQuery(mySQL);				
	 	
	 	
	 		//=====================סוף ההתחברות למסד הנתונים======================
	 			
	 		int numColumns = oRS.getMetaData().getColumnCount();
	 	
	 		oRS.last();				
	 		int numRows = oRS.getRow();
	 		 		
	 		result = new String[numRows][numColumns];	
	 		
	 		oRS.beforeFirst();
	 		int i = 0;
	 		while (oRS.next())
	 			{
	 				for(int j = 0; j < numColumns; j++ )
	 					result[i][j]=oRS.getString(j+1);				
	 				i++;
	 			}		
	 		
	 		oRS.close();	
	 		st.close();	
	 		
	 		} 
	 	 catch (Exception e) 
	 		{	  			
	 		//e.printStackTrace();
	 		System.out.println("1- Error in connecting");
	 	
	 		} //======================= the connection is closed
                	               	
%>	
				
					<form name="frm" action="doUpdateProfile.jsp" method="post" onsubmit="return valid()">				
		<table border="1" bordercolor="blue">
	   <tr>
		<td> שם פרטי</td>		
		<td><input type="text" name="fname" value="<%= result[0][1]%>"></td>
		<td> <span class="formValid" id="fNameValid"> </span> </td>		
	   </tr>
	   <tr>
		<td> שם משפחה</td>		
		<td><input type="text" name="lname" value="<%= result[0][2]%>"></td>
		<td> <span class="formValid" id="lNameValid"> </span> </td>		
	   </tr>
	   
	   <tr>
		<td> אימייל</td>		
		<td><input type="text" name="email" value="<%= result[0][3]%>"></td>
		<td> <span class="formValid" id="emailValid"> </span> </td>			
	   </tr>		
	   <tr>
		<td>גיל</td>		
		<td><input type="text" name="age" value="<%= result[0][4]%>"></td>
		<td> <span class="formValid" id="ageValid"> </span> </td>
	   </tr>
	   <tr>
		<td>זכר</td>		
		<td><input type="radio" name="gender" value="male"  <%if (result[0][5].equals( "male"  )) {%>checked<%}%> /></td> 
	   </tr>
	   <tr>
		<td>נקבה</td>		
		<td><input type="radio" name="gender" value="female" <%if (result[0][5].equals( "female" )){%>checked<%}%> /></td> 		
	   </tr>
           	    <tr align="center">				
		<td colspan="2"><b> הקבוצה האהובה עליך</b></td>		
	   </tr>
	   <tr align="center">
		<td colspan="2"><select name="team">			
			<option value="maccabi tel aviv"<%if (result[0][6].equals( "maccabi tel aviv" )) {%>selected<%}%>>מכבי תל-אביב</option>
			<option value="maccabi haifa" <%if (result[0][6].equals( "maccabi haifa")) {%>selected<%}%>>מכבי חיפה</option>
			<option value="maccabi natania"<%if (result[0][6].equals( "maccabi natania")) {%>selected<%}%>>מכבי נתניה</option>
			<option value="beitar jerusalem"<%if (result[0][6].equals( "beitar jerusalem")) {%>selected<%}%>>בית''ר ירושלים</option>
			<option value="kiriat shmona"<%if (result[0][6].equals( "kiriat shmona")) {%>selected<%}%>>קריית שמונה</option>
			<option value="hapoel tel aviv"<%if (result[0][6].equals( "hapoel tel aviv")) {%>selected<%}%>>הפועל תל אביב</option>
			<option value="other"<%if (result[0][6].equals( "other")) {%>selected<%}%>>אחר</option>
		    </select></td>
		    <td> <span class="formValid" id="teamValid"> </span> </td>		
		    </tr>				    		
	   <tr>
		<td><span></span> סיסמא</td>	
		<td><input type="text" name="password" size = "10" maxlength="6" value="<%= result[0][7]%>" /></td>
		<td> <span class="formValid" id="passwordValid"> </span> </td>
	   </tr>
	   <tr>								
								<td><input type="reset" name="reset" value="אתחול" /></td>
								<td align="center"><input type="submit" name="submit" value="עדכון" /></td>
							</tr>	
	               </table>
					</form>
		
					
                </center>
         		</td>
         		         		        					
        	</tr>
    	</table>
</body>
</html>