<%@ page language="java" import="java.util.*,bean.*;" pageEncoding="UTF-8"%>
<!--jsp to edit a message record-->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
Object obj=request.getAttribute("record");
Record record = (Record)obj;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hot Pitt Event Detail</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>  
<script type="text/javascript" src="js/Forum_400.font.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script> 
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/tablesort.js"></script>
<script type="text/javascript" src="js/jquery.nyromodal-1.6.2.pack.js"></script>
<script type="text/javascript" charset="utf-8" src="js/jquery.uniform.min.js" ></script>
<script type="text/javascript" src="js/jquery-ui-1.8.4.custom.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/custom.js" ></script>
<script type="text/javascript" charset="utf-8"></script>
 <!--dynamic rate javascript-->
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/comment.js"></script>
<style>
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif;}
/*quiz style*/
.quiz{border:solid 1px #ccc;height:270px;width:772px;margin: 10px auto;}
.quiz h3{font-size:14px;line-height:35px;height:35px;border-bottom:solid 1px #e8e8e8;padding-left:20px;background:#f8f8f8;color:#666;position:relative;}
.quiz_content{padding-top:10px;padding-left:20px;position:relative;height:205px;}
.quiz_content .btm{border:none;width:100px;height:33px;background:url(images/btn.gif) no-repeat;margin:10px 0 0 64px;display:inline;cursor:pointer;}
.quiz_content li.full-comment{position:relative;z-index:99;height:41px;}
.quiz_content li.cate_l{height:24px;line-height:24px;padding-bottom:10px;}
.quiz_content li.cate_l dl dt{float:left;}
.quiz_content li.cate_l dl dd{float:left;padding-right:15px;}
.quiz_content li.cate_l dl dd label{cursor:pointer;}
.quiz_content .l_text{height:120px;position:relative;padding-left:18px;}
.quiz_content .l_text .m_flo{float:left;width:47px;}
.quiz_content .l_text .text{width:634px;height:109px;border:solid 1px #ccc;}
.quiz_content .l_text .tr{position:absolute;bottom:-18px;right:40px;}
/*goods-comm-stars style*/
.goods-comm{height:41px;position:relative;z-index:7;}
.goods-comm-stars{line-height:25px;padding-left:12px;height:41px;position:absolute;top:0px;left:0;width:400px;}
.goods-comm-stars .star_l{float:left;display:inline-block;margin-right:5px;display:inline;}
.goods-comm-stars .star_choose{float:left;display:inline-block;}
/* rater star */
.rater-star{position:relative;list-style:none;margin:0;padding:0;background-repeat:repeat-x;background-position:left top;float:left;}
.rater-star-item, .rater-star-item-current, .rater-star-item-hover{position:absolute;top:0;left:0;background-repeat:repeat-x;}
.rater-star-item{background-position: -100% -100%;}
.rater-star-item-hover{background-position:0 -48px;cursor:pointer;}
.rater-star-item-current{background-position:0 -48px;cursor:pointer;}
.rater-star-item-current.rater-star-happy{background-position:0 -25px;}
.rater-star-item-hover.rater-star-happy{background-position:0 -25px;}
.rater-star-item-current.rater-star-full{background-position:0 -72px;}
/* popinfo */
.popinfo{display:none;position:absolute;top:30px;background:url(images/infobox-bg.gif) no-repeat;padding-top:8px;width:192px;margin-left:-14px;}
.popinfo .info-box{border:1px solid #f00;border-top:0;padding:0 5px;color:#F60;background:#FFF;}
.popinfo .info-box div{color:#333;}
.rater-click-tips{font:12px/25px;color:#333;margin-left:10px;background:url(images/infobox-bg-l.gif) no-repeat 0 0;width:125px;height:34px;padding-left:16px;overflow:hidden;}
.rater-click-tips span{display:block;background:#FFF9DD  url(images/infobox-bg-l-r.gif) no-repeat 100% 0;height:34px;line-height:34px;padding-right:5px;}
.rater-star-item-tips{background:url(images/star-tips.gif) no-repeat 0 0;height:41px;overflow:hidden;}
.cur.rater-star-item-tips{display:block;}	
.rater-star-result{color:#FF6600;font-weight:bold;padding-left:10px;float:left;}
.uparrowdiv
{
width:600px;
min-height:40px; /*min height of DIV should be set to at least 2x the width of the arrow*/
background: black;
color:white;
padding:5px;
position:relative;
word-wrap:break-word;
-moz-border-radius:5px; /*add some nice CSS3 round corners*/
-webkit-border-radius:5px;
border-radius:5px;
margin-bottom:2em;
}

.uparrowdiv:after{ /*arrow added to uparrowdiv DIV*/
content:'';
display:block;
position:absolute;
top:-20px; /*should be set to -border-width x 2 */
left:30px;
width:0;
height:0;
border-color: transparent transparent black transparent; /*border color should be same as div div background color*/
border-style: solid;
border-width: 10px;
}

            h1,h2,a
            { 
                padding-left:30%;
                margin-bottom: 20px;
            }

            #eventForm{
                width: 70%;
                font-size: 16px; /* Primary font size of form. Contained elements' font size are all relative to this setting */
            }


            #eventForm input, #eventForm textarea{
                width: 98%;
                border-radius: 5px;
                border: 1px solid gray;
                font: normal 1.5em auto; /* 24px, or 16px x 1.5 */
                padding: 0.4166666666666667em; /* 10px, or 24px x 0.4166666666666667 */
                box-shadow: 0 0 10px gray inset;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

            #eventForm textarea{
                resize:vertical; /* allow vertical resize of textarea */
                height: 200px;
            }


            #eventForm input:focus, #eventForm textarea:focus{
                box-shadow: 0 0 10px green inset;
            }


            #eventForm input[type="radio"], #eventForm input[type="checkbox"]{
                padding: 0;
                width: auto;
                height: auto;
                border-radius: 0;
            }

            #eventForm select{
                width: 80%;
                font-size: 1.5em;
                border: 2px solid #eee;
            }

            #eventForm .formcolumn{ /* column div inside form */
                width: 49%;
                float: left;
            }
#eventForm .formcolumn:first-of-type{
                margin-right: 2%; /* 2% margin after first column */
            }
            #eventForm .formcolumn label, #eventForm .infobox label, #eventForm .formcolumn fieldset{
                font: bold 0.8em Verdana; /* font size is 12.8px, or 16 x 0.8 */
                text-transform: uppercase;
                display: block;
                margin-top: 2em;
                margin-bottom: 3px;
            }

            #eventForm fieldset{
                width: 98%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

            #eventForm .formcolumn label:first-child, #eventForm .formcolumn fieldset:first-child{
                margin-top: 0; /* first label or fieldset within each column should not no top margin */
            }

            #eventForm fieldset ul{
                list-type: none;
                margin: 0;
                padding: 0;
            }

            #eventForm fieldset ul li{
                display: inline-block;
                margin-bottom: 5px;
                margin-right: 1em;
            }

            #eventForm .infobox {
                clear: both;
                margin: 5px;
                text-align: left;
            }

            #eventForm div.buttons{
                clear: both;
                text-align: center;
            }

            #eventForm input.button{
                margin-top: 1.5EM;
                width: 50%;
                box-shadow: 0 0 10px gray;
                text-transform: uppercase;
                cursor: pointer;
                min-width: 100px;
                max-width: 600px;
                color: white;
                font-weight: bold;
                letter-spacing: 7px;
                text-shadow: 0 -2px 1px #8a8a8a;
                background: rgb(169,3,41);
                background: -moz-linear-gradient(top,  rgba(169,3,41,1) 0%, rgba(143,2,34,1) 44%, rgba(109,0,25,1) 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(169,3,41,1)), color-stop(44%,rgba(143,2,34,1)), color-stop(100%,rgba(109,0,25,1)));
                background: -webkit-linear-gradient(top,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 44%,rgba(109,0,25,1) 100%);
                background: -o-linear-gradient(top,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 44%,rgba(109,0,25,1) 100%);
                background: -ms-linear-gradient(top,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 44%,rgba(109,0,25,1) 100%);
                background: linear-gradient(to bottom,  rgba(169,3,41,1) 0%,rgba(143,2,34,1) 44%,rgba(109,0,25,1) 100%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a90329', endColorstr='#6d0019',GradientType=0 );
            }
 #eventForm input.button:active{
                text-shadow: 0 0 1px #8a8a8a;
                background: rgb(109,0,25);
                background: -moz-linear-gradient(top,  rgba(109,0,25,1) 0%, rgba(143,2,34,1) 56%, rgba(169,3,41,1) 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(109,0,25,1)), color-stop(56%,rgba(143,2,34,1)), color-stop(100%,rgba(169,3,41,1)));
                background: -webkit-linear-gradient(top,  rgba(109,0,25,1) 0%,rgba(143,2,34,1) 56%,rgba(169,3,41,1) 100%);
                background: -o-linear-gradient(top,  rgba(109,0,25,1) 0%,rgba(143,2,34,1) 56%,rgba(169,3,41,1) 100%);
                background: -ms-linear-gradient(top,  rgba(109,0,25,1) 0%,rgba(143,2,34,1) 56%,rgba(169,3,41,1) 100%);
                background: linear-gradient(to bottom,  rgba(109,0,25,1) 0%,rgba(143,2,34,1) 56%,rgba(169,3,41,1) 100%);
                filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6d0019', endColorstr='#a90329',GradientType=0 );
            }

            @media screen and (max-width: 480px){ /* responsive form settings, when window width is 480px or less */

                #eventForm{
                    font-size: 14px; /* decrease form font size */
                }

                #eventForm .formcolumn{
                    width: 100%;
                    float: none;
                }

                #eventForm .formcolumn:first-of-type{
                    margin-right: 0; /* remove right margin from first form column */
                }

                #eventForm .formcolumn:nth-of-type(2){
                    padding-top: 2em; /* add padding to top of 2nd form column, so there is a gap between the 1st and 2nd column */
                }

                #eventForm select{
                    width: 98%;
                }

            }

</style>



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
<body id="page4">
<div class="body6">
	<div class="body1">
		<div class="main">
<!-- header -->
			<header>
				<h1><a href="index.html" id="logo"></a></h1>
				<nav>
					<ul id="top_nav">
						<li><a href="index.jsp"><img src="images/icon_1.gif" alt=""></a></li>
						<li><a href="#"><img src="images/icon_2.gif" alt=""></a></li>
						<li class="end"><a href="Contacts.jsp"><img src="images/icon_3.gif" alt=""></a></li>
					</ul>
				</nav>
				<nav>
					<ul id="menu">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="EventList.jsp">EventList</a></li>
						<li class="active"><a href="">EventDetail</a></li>
						<li ><a href="Publish.jsp">Publish</a></li>
						<li><a href="Contacts.jsp">Contacts</a></li>
					</ul>
				</nav>
			</header>
<!-- / header -->
<!-- content -->
<article id="content">
				<div class="wrap">
                	
					<section class="col6">
						<div class="box" >
                        
                            <div class="col5">
								<h2>Event <span>Details</span></h2>
                                <br>
								<ul class="list1 pad_bot1">
                                
                                    
                                   <!--event details-->
                                   <li><h3 style="color:white">Title:</h3><h4> <%=record.title%></h4></li><br>
                                   <li><h3 style="color:white">Start Time:</h3> <h4><%=record.startTime%></h4></li><br>
                                   <li><h3 style="color:white">End Time:</h3><h4> <%=record.endTime%> </h4></li><br>
                                   <li><h3 style="color:white">Location:</h3><h4> <%=record.loc%> </h4></li><br>
                                   <li><h3 style="color:white">Category: </h3><h4><%=record.type%> </h4></li><br>
                                   <li><h3 style="color:white">Department: </h3><h4><%=record.dpt%> </h4></li><br>
                                   <li><h3 style="color:white">Contact: </h3><h4><%=record.contact%> </h4></li><br>
                                   <li><h3 style="color:white">Information: </h3><h4><%=record.info%> </h4></li><br>
                                   <li><h3 style="color:white">Average Rate: </h3><h4><%=record.aRate%> points </h4></li><br>
                                   <li><h4><%=record.cntCome%> people will come, <%=record.cntMayCome%> people may come.</h4></li><br>
                                    
                                    
                                    
                                    
								</ul>
                                    
                                    <input type=button onClick="parent.location='operate?optype=5&eid=<%=record.eid%>'" value='Join'>
								
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <input type=button onClick="parent.location='operate?optype=6&eid=<%=record.eid%>'" value='Maybe'><br>
                                
                                
							</div>
                                <h3><a href="operate?optype=8&eid=<%=record.eid%>" ><em>Add to Google Calendar</em></a></h3>
                        </div>
					</section>
					
				</div>
			</article>
		</div>
	</div>
</div>


<div class="body2">
			
	<div class="main">
    
		<article id="content2">
        	<br><br>
         	<!--Dynamic Rate-->
                               <div class="goods-comm">
                                    <div class="goods-comm-stars">
                                        <span class="star_l">Rate this event: </span>
                                        <div id="rate-comm-1" class="rate-comm"></div>
                                    </div>
                                </div>
                       			<!--End Dynamic Rate-->
			<div class="wrapper">
            
            	<%
                    obj=request.getAttribute("list");
                    Collection<Comment> list;
                    Iterator it;
                    int i=1;
                    Comment comment;
                    if (obj==null){
                        response.sendRedirect("operate?optype=12&eid="+record.eid);
                        list=null;
                    }else{
                        list=(Collection<Comment>)obj;
                    }
                %>
                <% if (list==null){%>
                        <span> No Comments in this Event! </span>
                        <%}else{
                            it=list.iterator();
                            while(it.hasNext()){
                                comment = (Comment)it.next();
                        %>
                            <div class="comment-block">
                
                                    <h4 class="commenter">
                                        <p>User: <%=comment.email%></p> 
                                        
                                    </h4>
                                  	<div class="clear"></div>
                                   
                                    <div id = "arrowbox" class="uparrowdiv">
                                        <%=comment.comment%>
                                    </div>

                                    
                                        <div class="clear"></div>
                                    
                                    
                                </div>
                                <%} }%>
                                <!-- New Page Button -->
                                <div style="margin:10px 0px 20px 10px">
                                    
                                    <script type="text/javascript"> Cufon.now(); </script>
									 <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                     <input type="button" class="submit button large ui-corner-all" name="Add New Comment"  value="Add New Comment"></a> 
                                    <div id="light" class="white_content"> 
                                    <a href="javascript:void(0)" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"> 
                                    <img src="images/windows-close.png" style="float:right; display:inline;"></a>
                                    <p style="color:red; font-size:24px;">Your Comment:</p> 
                                    
                                    <form id="eventForm" method ="post" action = "operate">
                                    <div class="formcolumn">
                                        <label for="email">Email</label>
                                        <input type="text" name="email" value="" size="20" />
                                    </div>
                                        
                                    <div class = "infobox">
                                        <p><br></p>
                                        <label for="comment">More Info:</label>
                                        <textarea name="comment" rows="8" cols="30"></textarea>
                                    </div>

                                    <div class="buttons">
                                        <input class="button" type="submit" value="Submit"/>
                                    </div>
                                        <input type="hidden" name="optype" id="optype" value="11">
                                        <input type="hidden" name="eid" id="eid" value="<%=record.eid%>">
                               	</form>

                                    </div> 
                                    <div id="fade" class="black_overlay"></div> 
                                </div>
                                <!-- END New Page Button -->
                                
                                    </div>
            </div>
        </article>
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


</body>
</html>