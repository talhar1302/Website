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
                    <span style="font-size:xx-large;text-decoration:underline;font-weight:bold;color:blue;text-align:center">ברוכים הבאים לאתר שלי</span>
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
					<h2 align="center">עמוד ראשי</h2>
					ברוך הבא לאתר אוהדי מכבי תל-אביב!
					באתר זה ניתן למצוא מידע על אצטדיון בלומפילד-אצטדיון הקבוצה.
					<br />
					.כמו כן, ניתן לראות סרטונים הקשורים לקבוצה,לראות את הישגי הקבוצה במשך ההיסטוריה
					<br />
				בנוסף ניתן לראות את כרטיסי שחקני הקבוצה כיום ואף להסתכל על שמותיהם של מאמני העבר שהיו במכבי.
					<br /><br />
					בנוסף ניתן לשנות את הפרטים איתם נרשמתם,להצביע בסקר.					
					<br /><br />
					המשך גלישה נעימה!
					</center>               			                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>