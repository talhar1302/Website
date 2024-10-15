<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<%@ page import = "java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>
	</head>
	<body bgcolor="lightgreen">
        <%	
//בכדי שיראו עיברית
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
//בכדי שיראו עיברית
	     
		 String picture    = request.getParameter("picture");
	     String name    = request.getParameter("name");
	     String age    = request.getParameter("age");
	     String position      = request.getParameter("position");
	     String numShirt   = request.getParameter("numShirt");	    	         
	     	     	     	 	
	     try 
	 		{
	 		// שלב א: טעינת המתפעל - דרייבר
	 		Class.forName("com.mysql.jdbc.Driver").newInstance();	
	 	
	 	
	 		//שלב ב:חיבור למסד הנתונים
	 		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/players?UseUnicode=yes?characterEncoding=UTF-8","root","");
	 	
	 	
	 	
	 		//שלב ג: יצירת עצם הסטיטמנט "שידבר" עם מסד הנתונים, כמו מזכירה של בוס
	 		Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
	             						       ResultSet.CONCUR_UPDATABLE);
	 		  		
	 		// Statement st = con.createStatement(); // כאשר אין פרמטרים, אז אי אפשר לנוע למעלה - למטה בתוך הרקורדסט
	 	
	 		
	 		
	 		
	 		//שלב ד: יצירת שאילתה עבור מסד הנתונים
	 		String mySQL  = "INSERT INTO tPlayers ( picture, name, age, position, numShirt) ";
	 		mySQL 		 += " VALUES('"+picture+"','"+name+"',"+age+",'"+position+"',"+numShirt+")";
	 		System.out.println(mySQL);
	 		
	 		
	 		
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
	 		System.out.println("2- Error in connecting");
	 	
	 		} //======================= the connection is closed
					 		
    	 	response.sendRedirect("showPlayers.jsp");	       		
  	 // end else exist or not
  	
%> 	
	
</body>
</html>