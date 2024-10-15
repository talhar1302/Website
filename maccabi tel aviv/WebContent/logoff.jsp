<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
       

<html>
 	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
		<title>login</title>
    	<link rel="stylesheet" type="text/css" href="myStyle.css"/>
    	
    	<jsp:include page="clock.jsp"></jsp:include>
    	
		<script language="javascript">


			function refresh()
			{
				window.top.location="homepage.jsp";
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
            				<td  id="main"  style="width: 100%; border:2px solid blue;" dir="rtl">
            				<center>                  		
					<h2 align="center">התנתקות</h2>	
<%
						session.removeAttribute("connected");
			
						session.removeAttribute("visited");
			
						session.removeAttribute("eMail");
			
						session.removeAttribute("admin");											
						
						session.removeAttribute("seker");
												
															
						// session.invalidate();
			
						out.print("התנתקת בהצלחה!");
						out.print("<br />");
						out.print("אנא המתן, אתה מועבר לעמוד הראשי...");
						out.print("<script language='javascript'>");
						out.print("setTimeout('refresh()',3000)");
						out.print("</script>");
						%>
	                	</center>
         				</td>				   
        			</tr>
    		</table>
</body>
</html>