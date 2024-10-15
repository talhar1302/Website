<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ page import = "java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>Insert title here</title>
			<script language="javascript">
			var a=' `~!#$%^&*()_+=-;:[]{}|/<>,?1234567890.@אבגדהוזחטיכלמנסעפצקרשתץףך';		
			var formErrors ;
   function valid()
  	{
	   formErrors = '' ;
		
		check_picture() ;
		check_name() ;
		check_age() ;
		check_position() ;
		check_numShirt() ;
		
		if (formErrors.length == 0)  
			{			
			return true ;
			}
		else
			{
			alert(formErrors) ;
			window.document.frm.name.focus() ;
			return false ;
			}
  	}
	   //picture//
	   function check_picture()	//אין eus ,nubv 
		{
		
			var pic=window.document.frm.picture.value;
			if(pic.lenght==0)
			formErrors+='שגיאה:חסר קוד התמונה'+ '\n'; 
		}	     	   
	   //end picture//
	       					

		// Name//
		function check_name()
		{
		
			var name=window.document.frm.name.value;
		if (name.length == "")	//אין שם 
		{
		formErrors+='שגיאה:חסר שם של השחקן'+ '\n';
		}		
	
		if(name.charAt(0) == " ") //רווח לפני השם 
		{
			formErrors+='שגיאה:תמחק/י את הרווח בתחילת השם'+ '\n';			
		}		
		
		for(var i=1;i<a.length;i++)	//תווים אסורים
		{
			var badChar=a.charAt(i);
			if(name.indexOf(badChar) != -1)			
				formErrors+='שגיאה: השם חייב להכיל רק אותיות באנגלית'+ '\n';			
		}
		}
		//End of  Name//
		
		//Age//
		function check_age()
		{
		if(window.document.frm.age.value<17||window.document.frm.age.value>41)			
			formErrors+='שגיאה:הגיל חייב להיות בן 17-41'+ '\n';
		}
		    //end age//
		    
		    //position//
		    function check_position()
		    {
		    for(var i=1;i<a.length;i++)	//תווים אסורים
		    {
			var badChar=a.charAt(i);
			if(window.document.frm.position.value.indexOf(badChar) != -1)			
				formErrors+='שגיאה:העמדה של השחקן חייבת להכיל רק אותיות באנגלית'+ '\n';
		    }
		    }
			//end position//
			
			//numShirt//
			function check_numShirt()
			{
			if(window.document.frm.numShirt.value<0||window.document.frm.numShirt.value>99)			
			formErrors+='שגיאה:מספר החולצה  חייב להיות בן 0-99'+ '\n';
			}
   	
			// end valid()//       
</script>
 </head>
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
                  String name=request.getParameter("name");
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
				String mySQL = "SELECT * FROM tPlayers WHERE name='" + name + "'";
				session.setAttribute("PlayerToUpdate",name);
		  		
				
				//שלב ה: יצירת הרזלטסט - טבלה המחזיקה בתוכה חלק מ-(לפעמים את כל) מסד הנתונים
		  		ResultSet oRS = st.executeQuery(mySQL);				
				
		  		//=====================סוף ההתחברות למסד הנתונים======================
		  		
		  		
		  		oRS.beforeFirst();
				while (oRS.next() )
					{
					%>
					 <form name="frm" action="doUpdatePlayers.jsp"  method="post" onsubmit="return valid()">
				  		<table align="center" width="60%" height="200" border="1">							 	    
								         <tr align="center"><td rowspan="4" colspan="3"><img src="<%=oRS.getString("picture")%>" width="100%"><input type="text" name="picture" value="<%=oRS.getString("picture")%>"></td>	
								         <td><input type="text" name="name" value="<%=oRS.getString("name")%>"><td>:שם</td></tr>
								         <tr align="center"><td><input type="text" name="age" value="<%=oRS.getString("age")%>"></td><td>:גיל</td></tr>
								         <tr align="center"><td><input type="text" name="position" value="<%=oRS.getString("position")%>"></td><td>:עמדה</td></tr>					        
								         <tr align="center"><td><input type="text" name="numShirt" value="<%=oRS.getString("numShirt")%>"><td>:מספר</td></tr>
								          <tr align="center"><td colspan="7"><input type="submit" value="עדכן"/></td></tr>						         		         				       
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
