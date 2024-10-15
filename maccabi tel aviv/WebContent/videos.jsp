<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            		<center>
            		<div style="text-decoration:underline;font-weight:bold;font-size:xx-large">
ניצחונות גדולים של מכבי
</div>	 
</center>
<p></p> 
<iframe width="420" height="345" align="left"
src="//www.youtube.com/embed/Or0VS2Wx4JA">
</iframe>
<iframe width="420" height="345" align="right"
src="//www.youtube.com/embed/-wUaNqpFDO8">
</iframe>
<br/>
<iframe width="420" height="345" align="left"
src="//www.youtube.com/embed/0khqm9bmJiM">
</iframe>
<br/>
<iframe width="420" height="345" align="right"
src="//www.youtube.com/embed/Phr5pMi8Lwg">
</iframe>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<center>
<div style="text-decoration:underline;font-weight:bold;font-size:xx-large">
שירי אליפות של מכבי
</div>
</center>
<br/><br/><br/><br/>
<iframe width="420" height="345" align="left"
src="//www.youtube.com/embed/5hLO0cGvSs0">
</iframe>
<iframe width="420" height="345" align="right"
src="//www.youtube.com/embed/7RuxlKcKeYY">
</iframe>
<br/>
<iframe width="420" height="345" align="middle"
src="//www.youtube.com/embed/hJ75a5ddtnw">
</iframe>	                                          	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>