<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content  = "text/html; charset=UTF-8" >
		<title>Insert title here</title>
	</head>
	<body bgcolor="#78c2f4">
<% 
		// בכדי שיראו עיברית
	  		request.setCharacterEncoding("UTF-8");
	  		response.setCharacterEncoding("UTF-8");
		// בכדי שיראו עיברית	      


		String toDel []  =  request.getParameterValues("toDel");
		
		if(request.getParameterValues("toDel") != null)
		{	
				
			String strDel="";
			
			for (int i = 0; i < toDel.length-1 ; i++ )
			{
				strDel = strDel + toDel[i] + "," ;	// בונים מחרוזת המכילה את מספרי האינדקס, מופרדים בפסיקים
			}
			
			strDel= strDel + toDel[toDel.length-1];	// משרשרים את האיבר האחרון בלי פסיק אחריו
			
			
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
				String mySQL = "DELETE FROM tMembers WHERE ID IN (" + strDel + ")"; 
				
								
				
				//שלב ה: עדכון מסד הנתונים
		  		int n = st.executeUpdate(mySQL);	// מכיל את מספר הרשומות שהושפעו מהפעלת השאילתה n המשתנה  				
				
		  		System.out.println("number of records affected =" + n );
		  		
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  				  						
				//oRS.close();	- במקרה זה לא יוצרים רזלטסט
				st.close();
				con.close();
				
			} 
	  		catch (Exception e) 
	  		{
	  			
				//e.printStackTrace();
				System.out.println("page2-Error in connecting");
				
			} // the connection is closed	  		
	  		
		}// end if	
			
			response.sendRedirect("deleteUsers.jsp");
	  	%>
    	
    </body>
</html>





