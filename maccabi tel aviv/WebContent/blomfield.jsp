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
            				<td  id="main"  style="width: 100%; border:2px solid blue;font-size:x-large" dir="rtl">
            				<center>                  		
					<h2 align="center">עמוד ראשי</h2>
					      				<img src="images/blomfield.png" width="60%" height="500"></img><p></p>
                  				<br/><br/>אצטדיון בלומפילד  הינו אצטדיון כדורגל הנמצא בעיר  תל אביב- יפו במתחם המצואצטדיון בלומפילד  הינו אצטדיון כדורגל הנמצא בעיר  תל אביב- יפו במתחם המצוי בין הרחובות שדרות ירושלים במערב, דרך קיבוץ גלויות ודרך סלמה בצפון, רחוב שלבים במזרח ורחוב דרך בן צבי בדרום.
                  				 <br/><br/>האצטדיון מהווה מגרשה הביתי של קבוצת מכבי תל אביב ומכיל  כמות של כ- 14,500 מקומות ישיבה.
                  				  <br/><br/>בלומפילד נחשב לאחד האצטדיונים הגדולים והטובים בארץ  ומהווה בית לאוהדים הצהובים.
<br/><br/>בשנת 1968 עברה גם מכבי תל אביב לארח שם את משחקיה.
 <br/><br/>ובמשך מספר שנים שימש האצטדיון כמגרשה הביתי של קבוצות שמשון תל אביב, בית"ר תל אביב ואפילו עבור בית"ר ירושלים שאף זכתה באליפות בעונה בה שיחקה באצטדיון.
  <br/><br/>גם קבוצת בני יהודה עברה לארח במגרש בשנת 2004.
   <br/><br/>אצטדיון בלומפילד עבר שדרוג שבמסגרתו יהפוך לאצטדיון בו הצופים נהנים משיפור באיכות המושבים וחווית הצפייה.
   <br/><br/>היסטוריה - אצטדיון בלומפילד הוקם בשטח שבו היה קיים שנים רבות לפני כן אצטדיון באסה, שהיה מגרשה הביתי של הפועל תל אביב מאז שנת 1950.
    <br/><br/>אצטדיון זה נקרא גם "אצטדיון הפועל" ונוהל על ידי ההסתדרות במסגרת תנועת הספורט "הפועל".
     <br/><br/>המימון להקמת האצטדיון החדש הושג בעזרת תרומה של קרן האחים בלומפילד (ע"ש לואיס וברנרד בלומפילד), ונקרא על שמם "אצטדיון הפועל על שם האחים בלומפילד".
      <br/><br/>האצטדיון נחנך ב־12 באוקטובר 1962 במשחק של הפועל תל אביב נגד שמשון תל אביב.
       חודשיים אחר כך, ב־2 בדצמבר 1962, התקיים לכבוד הקמת האצטדיון משחק חגיגי שבו שיחקה הפועל תל אביב נגד קבוצת טוונטה אנסחדה מהולנד.
   
					</center>               			                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>