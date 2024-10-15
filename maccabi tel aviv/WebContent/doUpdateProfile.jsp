<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>		
		<title>Insert title here</title>
	</head>
	<body bgcolor="bgcolor=#78c2f4">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("UTF-8");
	  		response.setCharacterEncoding("UTF-8");
		// בכדי שיראו עיברית      

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
				String mySQL = "UPDATE tMembers SET fname='" + request.getParameter("fname") + "', lname='"+ request.getParameter("lname") + "', email='"+ request.getParameter("email") + "', age=" + request.getParameter("age")+ ", gender='"+ request.getParameter("gender")+ "', team='"+ request.getParameter("team")+ "', password='"+ request.getParameter("password") + "' WHERE ID =" + session.getAttribute("connected")+" or email='"+session.getAttribute("eMail")+"'"; 
								
				System.out.println("mySQL=" + mySQL);
				
				
				//שלב ה: עדכון מסד הנתונים
		  		int n = st.executeUpdate(mySQL);	// מכיל את מספר הרשומות שהושפעו מהפעלת השאילתה n המשתנה  				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  				  						
				//oRS.close();	- במקרה זה לא יוצרים רזלטסט
				st.close();
				con.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("page4-Error in connecting");
				
			} // the connection is closed	  		
	  		
	  		
			
			response.sendRedirect("homepage.jsp");
	  	%>
    	
    </body>
</html>





