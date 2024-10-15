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
תארים
<p></p><p></p>
<img src="images/titels.jpg">
<p></p>
21 אליפויות
<p></p>
1936, 1937, 1939, 1941/42, 1946/47, 1949/50, 1951/52, 1953/54, 1955/56, 1957/58, 1967/68, 1969/70, 1971/72, 1976/77, 1978/79, 1991/92, 1994/95, 1995/96, 2002/03, 2012/13, 2013/14
<p></p>
22 גביעי מדינה
<p></p>
1928/29, 1929/30, 1932/33, 1940/41, 1945/46, 1946/47, 1953/54, 1954/55, 1957/58, 1958/59, 1963/64, 1964/65, 1966/67, 1969/70, 1976/77, 1986/87, 1987/88, 1993/94, 1995/96, 2000/01, 2001/02, 2004/05
<p></p>
2 גביעי אסיה
<p></p>
1968/69, 1970/71
<p></p>
3 גביעי טוטו
<p></p>
1992/93, 1998/99, 2008/09
</center>      			                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>