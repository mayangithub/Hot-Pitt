<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hot Pitt Publish</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="饭店/css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="饭店/css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="饭店/css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="饭店/js/jquery-1.6.js" ></script>
        <script type="text/javascript" src="饭店/js/cufon-yui.js"></script>
        <script type="text/javascript" src="饭店/js/cufon-replace.js"></script>  
        <script type="text/javascript" src="饭店/js/Forum_400.font.js"></script>
        <script type="text/javascript" src="饭店/js/atooltip.jquery.js"></script> 
        <style>           
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
    <body id="page3">
        <div class="body6">
            <div class="body1">
                <div class="main">
                    <!-- header -->
                    <header>
                        <h1><a href="index.jsp" id="logo">Hot Pitt</a></h1>
                        <nav>
                            <ul id="top_nav">
                                <li><a href="index.jsp"><img src="饭店/images/icon_1.gif" alt=""></a></li>
                                <li><a href="#"><img src="饭店/images/icon_2.gif" alt=""></a></li>
                                <li class="end"><a href="Contacts.jsp"><img src="images/icon_3.gif" alt="Contacts.jsp"></li>
                            </ul>
                        </nav>
                        <nav>
                            <ul id="menu">
                                <li><a href="index.jsp">Home</a></li>
                                <li><a href="EventList.jsp">EventList</a></li>
                                <li class="active"><a href="Publish.jsp">Publish</a></li>
                                <li><a href="Contacts.jsp">Contacts</a></li>
                            </ul>
                        </nav>
                    </header>
                    <!-- / header -->
                    <!-- content -->
                    <article id="content">
                        <div class="wrap">

                            <div class="box" >
                            <h2 class="letter_spacing" style="padding-left:30px;">Publish <span>New Event</span></h2>
                            <div id="publishdetail">
                                <form id="eventForm" method ="post" action = "SetComment">
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
                               	</form>
                            
                            </div>
                            </div>

                        </div>
                    </article>
                </div>
            </div>
        </div>
        <div class="body2">
            <div class="main">
                <article id="content2">
                    <div class="wrapper">
                        <section class="pad_left1">
                            <div class="line1">

                            </div>
                        </section>
                    </div>
                </article>
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
                                            <h5 style="padding-top:30px;">All rights reserved by Travis Zhou, Jun Liu, Yan Ma, Lin Wang.</h5>
                                        </section>			
                                    </td>
                                    <td>	
                                        <section class="col2 pad_left1" style="float:right">
                                            <h3>Follow Us </h3>
                                            <ul id="icons">
                                                <li><a href="#" class="normaltip" title="Facebook"><img src="饭店/images/icon1.gif" alt=""></a></li>
                                                <li><a href="#" class="normaltip" title="Linkedin"><img src="饭店/images/icon2.gif" alt=""></a></li>
                                                <li><a href="#" class="normaltip" title="Twitter"><img src="饭店/images/icon3.gif" alt=""></a></li>
                                                <li><a href="#" class="normaltip" title="Delicious"><img src="饭店/images/icon4.gif" alt=""></a></li>
                                                <li><a href="#" class="normaltip" title="Technorati"><img src="饭店/images/icon5.gif" alt=""></a></li>
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
        <script type="text/javascript"> Cufon.now();</script>
    </body>
</html>