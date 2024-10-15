<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
<script language="javascript">


			function refresh()
			{
				window.top.location="menu.jsp";
			}

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
            				<td  id="main"  style="width: 100%; border:2px solid blue;font-size:x-large" dir="rtl">
            				<center>
            				<% 
	     
		 String fname    = request.getParameter("fname");
	     String lname    = request.getParameter("lname");
	     String email    = request.getParameter("email");
	     String age      = request.getParameter("age");
	     String gender   = request.getParameter("gender");
	     String team     = request.getParameter("team");
	     String password = request.getParameter("password");
	     
	     System.out.println("fname="+fname+" , lname="+lname+"  , email="+email);
	     
	     
	     String  result [][]= null;	
	 	
	 	 try 
	 		{
	 		// שלב א: טעינת המתפעל - דרייבר
	 		Class.forName("com.mysql.jdbc.Driver").newInstance();	
	 	
	 	
	 		//שלב ב:חיבור למסד הנתונים
	 		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/members?useUnicode=yes&characterEncoding=UTF-8","root","");
	 	
	 	
	 	
	 		//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
	 		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	             						       ResultSet.CONCUR_UPDATABLE);
	 		  		
	 		// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
	 	
	 		
	 		
	 		
	 		//שלב ד: יצירת שאילתה עבור מסד הנתונים
	 		String mySQL = "SELECT * FROM tMembers Where email='"+ email + "'"; 
	 		System.out.println(mySQL);
	 		
	 		
	 		//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים		  		
	 		ResultSet oRS = st.executeQuery(mySQL);				
	 	
	 	
	 		//=====================סוף ההתחברות למסד הנתונים======================
	 		
	 		System.out.println("1");
	 		
	 		int numColumns = oRS.getMetaData().getColumnCount();
	 		
	 		System.out.println("2 - " + numColumns);
	 		
	 		oRS.last();				
	 		int numRows = oRS.getRow();
	 	
	 		System.out.println("3 - " + numRows);
	 		result = new String[numRows][numColumns];	
	 		
	 		oRS.beforeFirst();
	 		int i = 0;
	 		while (oRS.next())
	 			{
	 				for(int j = 0; j < numColumns; j++ )
	 					result[i][j]=oRS.getString(j);				
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

	     	if(result.length>0)	     		
	     	{	
	     		out.print("האימייל שהזנת כבר משומש");
				out.print("<br/><br/><br/><br/><a href='submit.jsp'>נסה שוב</a>");	     		     				   	     		
	     	}
	     	else
	     	{
	     		try 
		 		{
		 		// שלב א: טעינת המתפעל - דרייבר
		 		Class.forName("com.mysql.jdbc.Driver").newInstance();	
		 	
		 	
		 		//שלב ב:חיבור למסד הנתונים
		 		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/members?UseUnicode=yes?characterEncoding=UTF-8","root","");
		 	
		 	
		 	
		 		//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
		 		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		             						       ResultSet.CONCUR_UPDATABLE);
		 		  		
		 		// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
		 	
		 		
		 		
		 		
		 		//שלב ד: יצירת שאילתה עבור מסד הנתונים
		 		String mySQL  = "INSERT INTO tMembers ( fname, lname, email, age, gender,team, password ) ";
		 		mySQL 		 += " VALUES('"+fname+"','"+lname+"','"+email+"',"+age+",'"+gender+"','"+team+"','"+password+"')";
		 		System.out.println(mySQL);
		 			 				 		
		 		//שלב ה: עדכון מסד הנתונים
		  		int n = st.executeUpdate(mySQL);	// מכיל את מספר הרשומות שהושפעו מהפעלת השאילתה n המשתנה  				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  				  						
				
		  		//oRS.close();	- במקרה זה לא יוצרים רזלטסט	            
		  		session.setAttribute("eMail",email);
		  		st.close();		  
				con.close();
		 		
		 		} 
		 		catch (Exception e) 
		 		{	  			
		 		//e.printStackTrace();
		 		System.out.println("2- Error in connecting");
		 	
		 		} //======================= the connection is closed		 				 		
	     		out.print("נרשמת בהצלחה!");
				out.print("<br />");
				out.print("אנא המתן, אתה מועבר לעמוד החברים...");
				out.print("<script language='javascript'>");
				out.print("setTimeout('refresh()',3000)");
				out.print("</script>");	       		
	     	} // end else exist or not
	     	
 %> 	
				</center>               			                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>