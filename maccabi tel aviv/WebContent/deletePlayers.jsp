<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>
		<script>
			function sure()
			{
				return confirm('אתה בטוח שאתה רוצה למחוק שחקן זה?');
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
            				<td style="height: 50px; border:2px solid blue;">
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
            				<td  id="main"  style="width: 100%; border:2px solid blue;">
            	<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");
		// בכדי שיראו עיברית
    %> 
    <%    
	  		try 
	  		{
	  			// שלב א: טעינת המתפעל - דרייבר
				Class.forName("com.mysql.jdbc.Driver").newInstance();	
	  		
	  		
				//שלב ב:חיבור למסד הנתונים
				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/players?UseUnicode=yes?characterEncoding=UTF-8","root","");
				
	  		
				//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
		                						   ResultSet.CONCUR_UPDATABLE);
				
				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
				
				
				//שלב ד: יצירת שאילתה עבור מסד הנתונים
				String mySQL = "SELECT * FROM tPlayers";
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  		
		  		oRS.beforeFirst();
				while (oRS.next() )
					{
					%>	
					       <form action="doDeletePlayers.jsp"  method="post" onsubmit="return sure()">									 
				  		<table align="center" width="60%" height="200" border="1">							 	    
								         <tr align="center"><td rowspan="4" colspan="3"><img src="<%=oRS.getString("picture")%>" width="100%"></td>								      
								         <td><input type="text" style="background-color:yellow;border:none;text-align:center;font-weight:bold" name="name" value="<%=oRS.getString("name")%>" readonly></td><td>:שם</td></tr>
								         <tr align="center"><td><input type="text" style="background-color:yellow;border:none;text-align:center;font-weight:bold" name="age" value="<%=oRS.getString("age")%>" readonly></td><td>:גיל</td></tr>
								         <tr align="center"><td><input type="text" style="background-color:yellow;border:none;text-align:center;font-weight:bold" name="position" value="<%=oRS.getString("position")%>" readonly></td><td>:עמדה</td></tr>					        
								         <tr align="center"><td><input type="text" style="background-color:yellow;border:none;text-align:center;font-weight:bold" name="numShirt" value="<%=oRS.getString("numShirt")%>" readonly></td><td>:מספר</td></tr>					         		         				       
							 	  		 <tr align="center"><td colspan="7"><input type="submit" value="מחיקה"/></td></tr>							 	
							 	  		 <br/><br/><br/><br/>						  						 	  		
				 	  </table>
				 	  </form>				 	 			 	  				 	 
				 	  <% 					         
					}	
				
				oRS.close();
				st.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("Error in connecting");
				
			} // the connection is closed	  		
		%>							             				 	             	
         				</td>				   
        			</tr>
    		</table>
	</body>
</html>
