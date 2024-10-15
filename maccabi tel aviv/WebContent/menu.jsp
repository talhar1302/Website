<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        
<%@ page import = "java.sql.*" %>

<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("UTF-8");
	  		response.setCharacterEncoding("UTF-8");
		// בכדי שיראו עיברית
%>	      
        <div style="font-family: arial; color: blue;">   

<%
		if (session.getAttribute("connected") != null || session.getAttribute("eMail") != null)
		{
			//Integer id = (Integer)session.getAttribute("connected");


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
				String mySQL;
				
				if (session.getAttribute("connected") != null)
					mySQL = "SELECT * FROM tMembers WHERE ID = " + session.getAttribute("connected");
				else
					mySQL = "SELECT * FROM tMembers WHERE email = '" + session.getAttribute("eMail")+"'";
		
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
				
			
			String firstName = result[0][1];
			System.out.println("firstName = " + firstName);											
			response.sendRedirect("homepage.jsp");
			out.print("<h2 align='right'>");
			if (result[0][5].equals("male"))
				out.print("ברוך הבא, ");
			else
				out.print("ברוכה הבאה, ");			
			out.print(firstName);
			out.print("</h2>");
			out.print("<a href='logoff.jsp' >להתנתקות</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='updateProfile.jsp'>עריכת פרופיל</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='titels.jsp'>תארים</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='players.jsp'>שחקני הקבוצה</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='coaches.jsp'>מאמני עבר</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='seker.jsp'>לסקר</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='videos.jsp'>סרטונים</a>");
			out.print("&nbsp;&nbsp;&nbsp;");			
			out.print("<a href='blomfield.jsp'>בלומפילד</a>");			
		}
%>
      <% 	                               
    	  if( session.getAttribute("admin")==("true"))
			      {
					String  result [][] = null;	

					try 
					{
						// שלב א: טעינת המתפעל - דרייבר
						Class.forName("com.mysql.jdbc.Driver").newInstance();	


						//שלב ב:חיבור למסד הנתונים
						Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/admin?useUnicode=yes&characterEncoding=UTF-8","root","");



						//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
						Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
						                   	   	   		   ResultSet.CONCUR_UPDATABLE);

						// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך ריזלטסט



				
						//שלב ד: יצירת שאילתה עבור מסד הנתונים
						String mySQL;												
							mySQL = "SELECT * FROM tAdmin";							
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
						
					
					String firstName = result[0][0];
					System.out.println("firstName = " + firstName);
					response.sendRedirect("homepage.jsp");
					out.print("<h2 align='right'>");
					if (result[0][4].equals("male"))
						out.print("ברוך הבא המנהל ");
					else
						out.print("ברוכה הבאה המנהלת");			
					out.print(firstName);
					out.print("</h2>");
				out.print("<h3>תפריט מנהלים</h3>");
				out.print("<a href='logoff.jsp' >להתנתקות</a>");
				out.print("&nbsp;&nbsp;&nbsp;");			
				out.print("<a href='showUsers.jsp' >לצפייה ברשומים לאתר</a>");
				out.print("&nbsp;&nbsp;&nbsp;");
				out.print("<a href='deleteUsers.jsp' >מחיקת רשומים</a>");
				out.print("&nbsp;&nbsp;&nbsp;");
				out.print("<a href='searchMembers.jsp' >חיפוש רשומים </a>");
				out.print("&nbsp;&nbsp;&nbsp;");
				out.print("<a href='showPlayersToUpdate.jsp' >עריכת שחקני הקבוצה</a>");
				out.print("&nbsp;&nbsp;&nbsp;");
				out.print("<a href='deletePlayers.jsp' >מחיקת שחקני הקבוצה<a>");
				out.print("&nbsp;&nbsp;&nbsp;");
				out.print("<a href='addNewPlayer.jsp' >הוספת שחקנים לקבוצה<a>");
			}       
		// end connected
%>		         
				<h3>תפריט האתר</h3>	
<% 	            
				if (session.getAttribute("connected") == null && session.getAttribute("eMail") == null &&  session.getAttribute("admin") == null)
				{					
					out.print("<h2 align='right'>ברוך הבא, אורח!</h2>");										
					out.print("<a href='submit.jsp'>להרשמה</a>");
					out.print("&nbsp;&nbsp;&nbsp;&nbsp;");					
					out.print("<a href='connect.jsp' >להתחברות</a>");
					out.print("&nbsp;&nbsp;&nbsp;&nbsp;");					
				}

%>        		
                    <a href="homepage.jsp">לדף הבית</a>                         
                    </div>              

 
