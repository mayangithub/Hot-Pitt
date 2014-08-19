<%@page language="java" import="java.util.*,bean.*;" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
Object obj=request.getAttribute("list");
Collection<Record> list;
Iterator it;
int i=1;
Record record;
if (obj==null){
 	response.sendRedirect("operate");
 	list=null;
}else{
	list=(Collection<Record>)obj;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
<title>Hot Pitt Event List</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css"  type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>  
<script type="text/javascript" src="js/Forum_400.font.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script> 
 <script src="js/jquery-1.6.2.min.js"></script>
 <script src="js/jquery-1.4.2.min.js"></script>
 <script type="text/javascript" src="js/jquery-func.js"></script>

			
<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<style type="text/css">
		.slider_bg {behavior:url(js/PIE.htc)}
	</style>
<![endif]-->
<!--[if lt IE 7]>
	<div style='clear:both;text-align:center;position:relative'>
		<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" alt="" /></a>
	</div>
<![endif]-->
</head>
<body id="page2">
<div class="body6">
  <div class="body1">
		<div class="main">
<!-- header -->
			<header>
				<h1 style="padding-bottom:-30px;"><a href="index.jsp" id="logo"></a></h1>
				<nav>
					<ul id="top_nav">
						<li><a href="index.jsp"><img src="images/icon_1.gif" alt="Home"></a></li>
						<li><a href="#"><img src="images/icon_2.gif" alt=""></a></li>
						<li class="end"><a href="Contacts.jsp"><img src="images/icon_3.gif" alt="Contacts"></a></li>
					</ul>
				</nav>
				<nav>
					<ul id="menu">
						<li><a href="index.jsp">Home</a></li>
						<li class="active"><a href="EventList.jsp">EventList</a></li>
						<li><a href="Publish.jsp">Publish</a></li>
						<li><a href="Contacts.jsp">Contacts</a></li>
						
					</ul>
				</nav>
			</header>
<!-- / header -->
<!-- content -->
			<article id="content">
            <div >
            
 <div class="main" >
	<div id="table">
    	<table style="width:100%;">
        	<tr>
            	<td class="cols" width="118" style="width:290px;padding:30px 30px 400px 30px">
                	<section  class="box" style="padding:30px;" >
                    	<h3 style="color:white; font-size:36px" > All Events</h3>
                    	 
                        <div style="display:block;font-size:24px;font-family: Impact; line-height:40px;padding:0 20px;;letter-spacing:-1px;">                        	
                    
                            <a href="operate?optype=9&type=Sport" style="font-family: Georgia;"><em>Sport</em></a><br>
                            <a href="operate?optype=9&type=Art" style="font-family: Georgia;"><em>Art</em></a><br>
                            <a href="operate?optype=9&type=Music" style="font-family: Georgia;"><em>Music</em></a><br>
                            <a href="operate?optype=9&type=Speech" style="font-family: Georgia;"><em>Speech </em></a><br>
                            <a href="operate?optype=9&type=Fair" style="font-family: Georgia;"><em>Fair </em></a><br>
                            <a href="operate?optype=9&type=Special" style="font-family: Georgia;"><em>Special</em></a><br>
                            
                            
       	</div>
                	</section>
                </td>
                <td width="528" style="width:auto;">
 
                <div class="wrap"> 
                <% if (list==null){%>
                        <span> No Records in Events List! </span>
                        <%}else{
                            it=list.iterator();
                            while(it.hasNext()){
                                record=(Record)it.next();
                        %>
               <section class="col5 ">
						<div class="box">
                        <!--Static Rate Star-->
							<div>
								<h2 style="display:inline;" ><span><%=record.title%></span> </h2>
								
                                
                         
                                
                              	<p class="pad_bot1">  </p>                              
                                <h3 style="color: white;">Start Time:</h3> <%=record.startTime%>
                                <h3 style="color: white;">Location: </h3><%=record.loc%>
                                
                                <a href="operate?optype=12&eid=<%=record.eid%>" class="button1">Read More</a>
							</div>  
                         <!--End Static Rate Star-->    	  
						</div>
					</section>
                        <br><%} }%>
                           
					
                    
					
				
                    
                </td>
                
            </tr>
        	<tr>
        	  <td class="cols" style="width:290px;padding:30px 30px 400px 30px; ">&nbsp;</td>
        	  <td style="width:auto;">&nbsp;</td>
      	  </tr>
        </table>
    </div>
</div>
          </div>
</div>
<div class="body2">
  <div class="main">
  <!-- / content -->
	</div>
</div>
<div class="body3">
	<div class="body4">
		<div class="main">
<!-- footer -->
			<footer>
				<div class="wrapper">
                <table>
                <tr>
                <td>
					<section class="col4 pad_left1" style="display:block">
					  <h5 style="padding-top:30px;">All rights reserved by Chaoran Zhou, Jun Liu, Yan Ma, Lin Wang.</h5>
		</section>			
				</td>
                <td>	<section class="col2 pad_left1" style="float:right">
						<h3>Follow Us </h3>
						<ul id="icons">
						<li><a href="http://facebook.com" class="normaltip" title="Facebook"><img src="images/icon1.png" alt=""></a></li>
							<li><a href="http://linkedin.com" class="normaltip" title="Linkedin"><img src="images/icon2.png" alt=""></a></li>
							<li><a href="http:twitter.com" class="normaltip" title="Twitter"><img src="images/icon3.png" alt=""></a></li>
							<li><a href="http://flickr.com" class="normaltip" title="Flickr"><img src="images/icon4.png" alt=""></a></li>
							<li><a href="http://renren.com" class="normaltip" title="RenRen"><img src="images/icon5.png" alt=""></a></li>
						</ul>
					</section>
                  </td>
                  </tr>
                  </table>
				</div>
				<!-- {%FOOTER_LINK} -->
			</footer>
<!-- / footer -->
		</div>
	</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>