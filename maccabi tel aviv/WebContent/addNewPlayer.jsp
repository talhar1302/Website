<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body bgcolor="yellow" text="blue" onload="setInterval('clock()',1000)">
<% 
		// ���� ����� ������
	  		request.setCharacterEncoding("UTF-8");
	  		response.setCharacterEncoding("UTF-8");
		// ���� ����� ������
%>	      
<table style="width:100%; height:100%; border:2px solid blue">        
        			<tr style="height: 110px; vertical-align: middle; text-align:center "  >           				
            				<td style="height: 50px; border:2px solid blue;" dir="rtl">
				  <div>
				   <img src="images/maccabiSymbol.jpg" align="right" width="20%"></img>
                    <span style="font-size:xx-large;text-decoration:underline;font-weight:bold;color:blue">������ ����� ���� ���</span>
					<img src="images/maccabiSymbol.jpg" align="left" width="20%"></img>
                			</div>
                			<% 
                			if ( session.getAttribute("visited")== null )				// ?��� �� ����
				{
					if (application.getAttribute("counter") == null)		// ?��� �� ����		
						application.setAttribute("counter", 1);
					else													// ?��� �� ����
					{						
						Integer counter = (Integer)application.getAttribute ("counter");
						counter = counter + 1;
						application.setAttribute("counter", counter);
					}
					session.setAttribute("visited", "Been Here");				// ?��� �� ����	
				}					
	   		
				out.print("&nbsp;&nbsp;&nbsp;&nbsp; ���� ���� </b>");	
	   			out.print( "<b>#" + application.getAttribute ("counter"));
	   			%>
	   			<br/><br/>
	   			<jsp:include page="clock.jsp"></jsp:include> 
				</td>
        			</tr>
        				<tr style="height: 110px; vertical-align: middle; text-align:center "  >           				
            				<td style="height: 89px; border:2px solid blue;">         				     			
				<jsp:include page="menu.jsp"></jsp:include>
			      
				</td>
        			</tr>		
		
			<tr style="height:700px">            
            				<td  id="main"  style="width: 100%; border:2px solid blue;" dir="rtl">
            		<form action="doAddPlayer.jsp"  method="post">
	  		<table align="center" width="60%" height="200" border="1">
				 	    
					         <tr align="center"><td rowspan="4" colspan="3"><input type="text" name="picture">:�����</td>
					         <td><input type="text" name="name"></td><td>:��</td></tr>
					         <tr align="center"><td><input type="text" name="age"></td><td>:���</td></tr>
					         <tr align="center"><td><input type="text" name="position"></td><td>:����</td></tr>					        
					         <tr align="center"><td><input type="text" name="numShirt"></td><td>:����</td></tr>					         		         				       
				 	  </table>
				 	  <br/><br/>
					         <center><input type="submit" value="���� �� �����"/></center> 			
				 	  </form>	     			                   	
         				</td>				   
        			</tr>
    		</table>	
</body>
</html>