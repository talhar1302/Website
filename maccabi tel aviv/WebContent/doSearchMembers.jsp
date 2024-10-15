<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>		
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
            		<%

// בכדי שיראו עיברית
	  		request.setCharacterEncoding("windows-1255");
	  		response.setCharacterEncoding("windows-1255");
// בכדי שיראו עיברית

%>
        <center>      			 			
    	     <table border="1" cellpadding="4">  				
						<tr bgcolor="#2394e7">
						    <td> ID </td>														
							<td> First Name </td>
							<td> Last Name </td>
							<td> Email </td>
							<td> Age </td>
							<td> Gender </td>
							<td> team </td>
							<td> Password </td>																																										
						</tr>
		<%
		   String fname=request.getParameter("fname");
	  		try 
	  		{
	  			// שלב א: טעינת המתפעל - דרייבר
				Class.forName("com.mysql.jdbc.Driver").newInstance();	
	  		
	  		
				//שלב ב:חיבור למסד הנתונים
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/members?UseUnicode=yes?characterEncoding=UTF-8","root","");
				
	  		
				//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                						   ResultSet.CONCUR_UPDATABLE);
				
				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
				
				
				//שלב ד: יצירת שאילתה עבור מסד הנתונים
				String mySQL = "SELECT * FROM tMembers where fname='" + fname +"'";
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet myResultSet = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  						
				int numColumns = myResultSet.getMetaData().getColumnCount();
				
				
				myResultSet.last();			// המצביע מצביע על הרשומה האחרונה		
				int numRows = myResultSet.getRow();
				
				
				
				if (numRows == 0)	// אין רשומות
				{
					out.print ( "אין רשומים באתר עם שם פרטי זה" );
					out.print("<br/><br/><br/><a href='searchMembers.jsp'>לחיפוש נוסף</a>");
				}
				else
				{
					myResultSet.beforeFirst();
					while (myResultSet.next() )
					{
						out.print("<tr>");	
					    	out.print("<td>" + myResultSet.getInt("ID") + "</td>");
					    	out.print("<td>" + myResultSet.getString("fname") + "</td>");
							out.print("<td>" + myResultSet.getString("lname") + "</td>");
							out.print("<td>" + myResultSet.getString("email")    + "</td>");
							out.print("<td>" + myResultSet.getString("age")     + "</td>");
							out.print("<td>" + myResultSet.getString("gender") + "</td>");
							out.print("<td>" + myResultSet.getString("team")   + "</td>");
							out.print("<td>" + myResultSet.getString("password")      + "</td>");
				 	   out.print("</tr>");				 	   
					}
					out.print("<br/><br/><br/><a href='searchMembers.jsp'>לחיפוש נוסף</a>");
				}
				myResultSet.close();
				st.close();
				
			} 
	  		catch (Exception e) 
	  		{	  			
				//e.printStackTrace();
				System.out.println("page1-Error in connecting");				
			} // the connection is closed	  		
		%>
				</table>			
		</center>   			                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>