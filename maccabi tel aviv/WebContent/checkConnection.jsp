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
			<br /><br />
		<%
		String email    = request.getParameter("email");
		String password = request.getParameter("password");
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
    				
    				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרזלטסט
    				
    				
    				//שלב ד: יצירת שאילתה עבור מסד הנתונים
    				String mySQL = "SELECT * FROM tMembers WHERE email ='" + email + "'and password='"+ password+"'";
    		  		System.out.println("mySQL="+mySQL);
    				
    				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים		  		
 					ResultSet oRS = st.executeQuery(mySQL);				
 	
 					System.out.println(1);
 					//=====================סוף ההתחברות למסד הנתונים======================
 			
 					int numColumns = oRS.getMetaData().getColumnCount();
 					
 					System.out.println(2);
 					
 					oRS.last();				
 					int numRows = oRS.getRow();
 					
 					System.out.println(3);
 					
 					result = new String[numRows][numColumns];	
 		
 					oRS.beforeFirst();
 					int i = 0;
 					while (oRS.next())
 					{
 						for(int j = 0; j < numColumns; j++ )
 							result[i][j]=oRS.getString(j+1);
 						
 						i++;
 					}		 		
 					System.out.println(4);
 					oRS.close();
    				st.close();
              	}
	 			catch (Exception e) 
				{	  			
					//e.printStackTrace();
					System.out.println("1- Error in connecting");
	
				} //======================= the connection is closed    			
 					if(result.length==1)
    		  		{ 
    		  			session.setAttribute("connected",result[0][0]);
    		  			out.print("התחברת בהצלחה!");
						out.print("<br />");
						out.print("אנא המתן, אתה מועבר לעמוד החברים...");
						out.print("<script language='javascript'>");
						out.print("setTimeout('refresh()',3000)");
						out.print("</script>");                      	  		  		        	  			
                    }
                  	else 
                  	{               	
                  		try 
            	  		{
            	  			// שלב א: טעינת המתפעל - דרייבר
            				Class.forName("com.mysql.jdbc.Driver").newInstance();	
            				
            	  		
            				//שלב ב:חיבור למסד הנתונים
            				Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/admin?UseUnicode=yes?characterEncoding=UTF-8","root","");
            				
            	  		
            				//שלב ב:חיבור למסד הנתונים
            				Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
            		                						   ResultSet.CONCUR_UPDATABLE);
            				
            				// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
            				
            				
            				
            				//שלב ד: יצירת שאילתה עבור מסד הנתונים
            				String mySQL = "SELECT * FROM tAdmin WHERE email='" + email + "' AND password =" + password ;
            		  		
            				
            				
            				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים	
            		  		ResultSet oRS = st.executeQuery(mySQL);				
            				
            		  		//=====================סוף ההתחברות למסד הנתונים======================
            		  		
            		  		
            		  		session.setAttribute("MyADMIN", "NotOk");			
            				
            		  		
            		  		
            				oRS.last();			// המצביע מצביע על הרשומה היחידה		
            				int numRows = oRS.getRow();
            				System.out.println("numRows = " + numRows);
            				
            				if (numRows > 0)	// כלומר המשתמש הקליד שם וסיסמה של מנהל רשום. יש רק אחד כזה
            				{   					
            					System.out.println("no. = "+ oRS.getRow()+  "   Name = " + oRS.getString("fname")+ "    password= "+ oRS.getString("password"));					
            						
            					session.setAttribute("MyADMIN", "OK");
            				}
            					oRS.close();
                				st.close();         	  			
                			} 
                	  		catch (Exception e) 
                	  		{
                	  			
                				//e.printStackTrace();
                				System.out.println("Error in connecting");
                		        // the connection is closed	  		                 		
                	  		}            				
            				if ( session.getAttribute("MyADMIN")==("OK") )
                			{
                				session.setAttribute("admin","true");           		
                				out.print("התחברת בהצלחה!");
                				out.print("<br />");
                				out.print("אנא המתן, אתה מועבר לעמוד המנהל...");
                				out.print("<script language='javascript'>");
                				out.print("setTimeout('refresh()',3000)");
                				out.print("</script>");
                			}
                			else
                			{
                				out.print("לא קיים משתמש עם אימייל כזה ועם סיסמא כזאת");
                				out.print("<br/><br/><br/><br/><a href='connect.jsp'>נסה שוב</a>"); 
                			}
                  	}            		
      	%>      	      	           
					</center>               			                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>