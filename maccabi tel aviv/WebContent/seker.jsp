<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Seker</title>
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
            				<%
            				if (application.getAttribute("eranZehavi") == null)
            				{
            				String s="0";
            				
            		  		application.setAttribute("eranZehavi",s);
            		  		application.setAttribute("radePriza",s);
            		  		application.setAttribute("dorMicha",s);
            		  		application.setAttribute("barakhIzhaki",s);
            		  		application.setAttribute("carlosGarcia",s);
            		  		application.setAttribute("eitanTibi",s);
            				}
            				if(session.getAttribute("seker")==null)
            				{
            				if(request.getParameter("Send") == null)
            				{	
            				%>
            		<center>          		
			<h3>בחר את השחקן האהוב עליך במכבי תל אביב</h3>	
			<form  method="post"   action="seker.jsp">
  				ערן זהבי:<input type="radio" name="player" value="eranZehavi">
  				<br />
  				ראדה פריצה:<input type="radio" name="player" value="radePriza">
  				<br />
  				דור מיכה:<input type="radio" name="player" value="dorMicha">
  				<br />
  				ברק יצחקי:<input type="radio" name="player" value="barakhIzhaki">
  				<br />  				
  				קרלוס גארסיה:<input type="radio" name="player" value="carlosGarcia">
  				<br />
  				איתן טיבי:<input type="radio" name="player" value="eitanTibi">
  				<br />  				
  				<input type="submit" value="שלח" name="Send"></form>
  				</center>
  				<%
            	}           				
            		else
            		{
  				%>
  						<center>          		
			<h3>בחר את השחקן האהוב עליך במכבי תל אביב</h3>	
			<form  method="post" action="seker.jsp">
  				ערן זהבי:<input type="radio" name="player" value="eranZehavi">
  				<br />
  				ראדה פריצה:<input type="radio" name="player" value="radePriza">
  				<br />
  				דור מיכה:<input type="radio" name="player" value="dorMicha">
  				<br />
  				ברק יצחקי:<input type="radio" name="player" value="barakhIzhaki">
  				<br />  				
  				קרלוס גארסיה:<input type="radio" name="player" value="carlosGarcia">
  				<br />
  				איתן טיבי:<input type="radio" name="player" value="eitanTibi">
  				<br />  				
  				<input type="submit" value="שלח" name="Send"></form>
  				<br />
  				<br />			
  				<h1>:התוצאות הן</h1>
				<%				
				if(request.getMethod().equals("POST"))
				   {
					 String n=request.getParameter("player");
					 System.out.println("n="+n);
					 String s=(String) application.getAttribute(n);
					 System.out.println("s="+s);					
				      int i=Integer.parseInt(s);
				     i++;
				     s=""+i;				   
				     application.setAttribute(n,s);				    
				   }
				
					String sEran=(String)application.getAttribute("eranZehavi");
					int iEran=Integer.parseInt(sEran);
				
					String sRade=(String) application.getAttribute("radePriza");
					int iRade=Integer.parseInt(sRade);
				
					String sDor=(String) application.getAttribute("dorMicha");
					int iDor=Integer.parseInt(sDor);
				
					String sBarakh=(String) application.getAttribute("barakhIzhaki");
					int iBarakh=Integer.parseInt(sBarakh);
					
					String sCarlos=(String) application.getAttribute("carlosGarcia");
					int iCarlos=Integer.parseInt(sCarlos);
					
					String sEitan=(String) application.getAttribute("eitanTibi");
					int iEitan=Integer.parseInt(sEitan);									
					
					int sum=iEran+iRade+iDor+iBarakh+iCarlos+iEitan;					
					session.setAttribute("seker",""+sum);
					System.out.println("sum="+sum);
					System.out.println("iEran="+iEran);
					double eran,rade,dor,barakh,carlos,eitan;
					eran=(double)iEran;
					rade=(double)iRade;
					dor=(double)iDor;
					barakh=(double)iBarakh;
					carlos=(double)iCarlos;
					eitan=(double)iEitan;					
					if(sum!=0)
   					{
					out.println("<table align='center' width='80%' height='200' border='1'>");
					out.println("<tr align='cetner'><td align='center'>"+Math.round(eran/sum*100*100)/100+"%<hr width='"+eran/sum*100+"%' size='3' color='blue' align='left'></hr>ערן זהבי:"+application.getAttribute("eranZehavi")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(rade/sum*100*100)/100+"%<hr width='"+rade/sum*100+"%' size='3' color='green' align='left'></hr>ראדה פריצה:"+application.getAttribute("radePriza")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(dor/sum*100*100)/100+"%<hr width='"+dor/sum*100+"%' size='3' color='red' align='left'></hr>דור מיכה:"+application.getAttribute("dorMicha")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(barakh/sum*100*100)/100+"%<hr width='"+barakh/sum*100+"%' size='3' color='gray' align='left'></hr>ברק יצחקי:"+application.getAttribute("barakhIzhaki")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(carlos/sum*100*100)/100+"%<hr width='"+carlos/sum*100+"%' size='3' color='orange' align='left'></hr>קרלוס גארסיה:"+application.getAttribute("carlosGarcia")+"</td></tr>");   					
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(eitan/sum*100*100)/100+"%<hr width='"+eitan/sum*100+"%' size='3' color='pink' align='left'></hr>איתן טיבי:"+application.getAttribute("eitanTibi")+"</td></tr>");   					
   					out.println("<tr align='center'><td>total:"+sum+"</td></tr>");
   					out.println("</table>");   					
            	}
					session.setAttribute("seker","voted");
				%>
				<%
            	}
            	%>
            	<% 
            	}
               	else
				{
					%>
				<center><h1>לא ניתן להצביע יותר מפעם אחת כאשר מחוברים לאתר,עמכם הסליחה</h1>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<h1>התוצאות הן:</h1></center>
				<% 
					String sEran=(String)application.getAttribute("eranZehavi");
					int iEran=Integer.parseInt(sEran);
				
					String sRade=(String) application.getAttribute("radePriza");
					int iRade=Integer.parseInt(sRade);
				
					String sDor=(String) application.getAttribute("dorMicha");
					int iDor=Integer.parseInt(sDor);
				
					String sBarakh=(String) application.getAttribute("barakhIzhaki");
					int iBarakh=Integer.parseInt(sBarakh);
					
					String sCarlos=(String) application.getAttribute("carlosGarcia");
					int iCarlos=Integer.parseInt(sCarlos);
					
					String sEitan=(String) application.getAttribute("eitanTibi");
					int iEitan=Integer.parseInt(sEitan);									
					
					int sum=iEran+iRade+iDor+iBarakh+iCarlos+iEitan;					
					session.setAttribute("seker",""+sum);
					System.out.println("sum="+sum);
					System.out.println("iEran="+iEran);
					double eran,rade,dor,barakh,carlos,eitan;
					eran=(double)iEran;
					rade=(double)iRade;
					dor=(double)iDor;
					barakh=(double)iBarakh;
					carlos=(double)iCarlos;
					eitan=(double)iEitan;					
					if(sum!=0)
   					{
					out.println("<table align='center' width='80%' height='200' border='1'>");
					out.println("<tr align='cetner'><td align='center'>"+Math.round(eran/sum*100*100)/100+"%<hr width='"+eran/sum*100+"%' size='3' color='blue' align='left'></hr>ערן זהבי:"+application.getAttribute("eranZehavi")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(rade/sum*100*100)/100+"%<hr width='"+rade/sum*100+"%' size='3' color='green' align='left'></hr>ראדה פריצה:"+application.getAttribute("radePriza")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(dor/sum*100*100)/100+"%<hr width='"+dor/sum*100+"%' size='3' color='red' align='left'></hr>דור מיכה:"+application.getAttribute("dorMicha")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(barakh/sum*100*100)/100+"%<hr width='"+barakh/sum*100+"%' size='3' color='gray' align='left'></hr>ברק יצחקי:"+application.getAttribute("barakhIzhaki")+"</td></tr>");
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(carlos/sum*100*100)/100+"%<hr width='"+carlos/sum*100+"%' size='3' color='orange' align='left'></hr>קרלוס גארסיה:"+application.getAttribute("carlosGarcia")+"</td></tr>");   					
   					out.println("<tr align='cetner'><td align='center'>"+Math.round(eitan/sum*100*100)/100+"%<hr width='"+eitan/sum*100+"%' size='3' color='pink' align='left'></hr>איתן טיבי:"+application.getAttribute("eitanTibi")+"</td></tr>");   					
   					out.println("<tr align='center'><td>total:"+sum+"</td></tr>");
   					out.println("</table>");   						
				}
				}		
				%>			
		</center>					                   	
         				</td>				   
        			</tr>
    		</table>
</body>
</html>