<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html dir="rtl">
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
//בכדי שיראו עיברית
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
//בכדי שיראו עיברית
%>
    	<div align="center">
      		<font size="5">
       		 מאמני עבר 
      		</font>
      		</div>
      		<hr width="60%"/>      
<%		 	 
		 													// the first time the page is sent to the user
		 													// the SUBMIT button was not pressed yet.		 												
			if(request.getParameter("submit1") == null )	//it means that the form is seen the first time
		 	{
 %>
            <center> 
      		<form name="detailsForm" 
           		  action="coaches.jsp"
                  method="post">
       		 הכנס שם של מאמן או חלק מהשם	:
        		<input type="text" name="name" />
        		<br /><br />
        		<input type="text" name="year2" />
        		בין השנים
        		<input type="text" name="year1" />
        		<br/>
        		<input type="submit" value="חפש" name="submit1"/>
      		</form>
      		</center>
 <%
		 	}
			else  // connect to db
			{
				String  result [][]= null;
				try 
		  		{
		  			// שלב א: טעינת המתפעל - דרייבר
					Class.forName("com.mysql.jdbc.Driver").newInstance();	
		  		
		  		
					//שלב ב:חיבור למסד הנתונים
					Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/coaches?UseUnicode=yes?characterEncoding=UTF-8","root","");
					
		  		
					//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
					Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
			                						   ResultSet.CONCUR_UPDATABLE);
					
					// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
					
					
					//שלב ד: יצירת שאילתה עבור מסד הנתונים
					String mySQL = "SELECT * FROM tCoaches  WHERE name LIKE '%" + request.getParameter("name") +"%' and beginYear>='" +request.getParameter("year1")+"'and finishYear<='" +request.getParameter("year2")+"'";
			  		System.out.println("mySQL ="+ mySQL);
					
			  		
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

	 			if(result.length==0)
		     	{	
		     		out.print("<center><h3>");
		    	 	out.print(" לא נמצא מאמן עבר בשם זה בשנים אלו");
		    	 	out.print("</h3><br />");
		     		out.print("<a href='coaches.jsp'>חפש שוב</a> ");
		     		out.print("</center>");
		     	}
	 			else
	 			{
	 				out.print("<center>");
	 				out.print( "להלן תוצאות החיפוש");
	 				out.print( "<br />" );

	 				out.print( "<table border='1' cellpadding='4' bordercolor='black'>");
	 					out.print("<tr bgcolor='yellow'>");
	 						out.print("<td>");
	 							out.print("שם");
	 						out.print("</td>");
	 						out.print("<td>");
	 		   		       		out.print("שנת התחלה");
	 		   		    	out.print("</td>");
	 		   		    	out.print("<td>");
	 		   		    		out.print(" שנת סיום");
	 		   		    	out.print("</td>");	 	   		    	
	 		   		    out.print("</tr>");
	 		   		for(int row=0;row<result.length;row++)
	  				{
	     				out.println("<tr>");
	     				
	     				//for (int col=0; col<result[row].length; col++)
	     				//{
		 				//	out.print("<td>"+result[row][col]+"</td>");
	     				//}
	     				
	     				out.print("<td>"+result[row][0]+"</td>");	
	     				out.print("<td>"+result[row][1]+"</td>");	     				
	     				out.print("<td>"+result[row][2]+"</td>");			
	     				out.println("</tr>");
	  				}// end for
	  	 			out.print("</table>");
	  	 			out.print("<br /><br />");
	  	 			out.print("<br />");
	 				
	  	 			out.print("<a href='coaches.jsp'>חיפוש נוסף</a> ");
	  	 			out.print("</center>");
	 			}// end else some one was found
			}// end connect to db
 %>        	
          			</td>				   
        			</tr>
    		</table>
          
  </body>
</html>
         			                   	
         	