package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.*;
import bean.*;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
/**
 * class Operate is a servlet used to process request from jsp.
*/
public class Operate extends HttpServlet {
	DBOperate dbop;
	/**
	 * Constructor of the object.
	 */
	public Operate() {
		super();
		dbop=DBOperate.getInstance();
		dbop.buildConnection();
	}
	
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		Object obj=request.getParameter("optype");
                Object obj1;
		Object obj2;
                Object obj3;
                Object obj4;
                Record record = null;
                String title = "";
                String type;
                Timestamp startTime = null;
                Timestamp endTime = null;
                String loc = "";
                String info = "";
                String contact;
                String dpt;
		int optype;
		int eid, cntCome, cntMayCome, score, rate, cntRate;
                double aRate;
		String sql;
		String contents,author;
                String comment = "";
                String email = "";
                
                eid = -1;
		
		if (obj==null)
			optype=1;
		else
			optype=Integer.parseInt(obj.toString());
		
		//optype=1: present records in memento book
                //optype=2: delete a record
                //optype=3: insert an record
                //optype=4: select a record
                //optype=5: update a record

		if(optype==2){
			obj=request.getParameter("eid");
			if(obj==null)
				go(request,response);
			eid=Integer.parseInt(obj.toString());
			sql="delete from book where id="+eid;
			dbop.operate(sql);
		}else if(optype==3){
                    
                    String startT = "";
                    String endT = "";
			title = request.getParameter("title");
                        type = request.getParameter("type");
                        startT = request.getParameter("startTime");
                        endT = request.getParameter("endTime");
                        loc = request.getParameter("loc");
                        info = request.getParameter("info");
                        contact = request.getParameter("contact");
                        dpt = request.getParameter("dpt");
                        
                        sql = "INSERT INTO Event(title, type, startTime, endTime, loc, info, contact, dpt)"
                    + " VALUES ('"
                    + title + "', '"
                    + type + "', '"
                    + startT + "', '"
                    + endT + "', '"
                    + loc + "', '"
                    + info + "', '"
                    + contact + "', '"
                    + dpt + "')";
                    
                    dbop.operate(sql);
                    
		}else if(optype==4){
                    
                    
                    obj = request.getParameter("eid");
                    eid = Integer.parseInt(obj.toString());
                    
		    
                    sql = "select * from event where eid="+eid;
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EventDetail.jsp");
                    try{
                            ResultSet rs=dbop.select(sql);
                            while(rs.next()){
				
                                eid = rs.getInt("eid");
                                title = rs.getString("title");
                                type = rs.getString("type");
                                startTime = rs.getTimestamp("starttime");
                                endTime = rs.getTimestamp("endtime");
                                loc = rs.getString("loc");
                                info = rs.getString("info");
                                cntCome = rs.getInt("cntcome");
                                cntMayCome = rs.getInt("cntmaycome");
                                score = rs.getInt("score");
                                contact = rs.getString("contact");
                                dpt = rs.getString("dpt");
                                aRate = rs.getDouble("arate");
                                cntRate = rs.getInt("cntrate");
                                record = new Record(eid, title, type, startTime, endTime, loc, info, cntCome, cntMayCome, score, contact, dpt, aRate, cntRate);
                            }
                            request.setAttribute("record", record);
                            requestDispatcher.forward(request, response);
                            
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                    
                    return;
                }else if(optype==5){
                    obj = request.getParameter("eid");
                    /*obj1 = request.getParameter("cntcome");
                    obj2 = request.getParameter("cntmaycome");*/
                    eid = Integer.parseInt(obj.toString());
                    
                    sql = "select cntcome, score from event where eid="+eid;
                    cntCome = 0;
                    score = 0;
                    try{
                            ResultSet rs=dbop.select(sql);
                            while(rs.next()){
				
                                
                                cntCome = rs.getInt("cntcome")+1;
                               
                                score = rs.getInt("score")+2;
                  
                            }
                    
                    
                        if(cntCome!=0&&score!=0){
                            sql = "update event set cntcome = "+cntCome+", score = "+score+" where eid = "+eid;
                        
                            dbop.operate(sql);
                        }
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("operate?optype=12&eid="+eid);
                        requestDispatcher.forward(request, response);
                        return;
                    }catch(Exception e){
                            e.printStackTrace();
                        }
                }else if(optype==6){
                    obj = request.getParameter("eid");
                    /*obj1 = request.getParameter("cntcome");
                    obj2 = request.getParameter("cntmaycome");*/
                    eid = Integer.parseInt(obj.toString());
                    
                    sql = "select cntmaycome, score from event where eid="+eid;
                    cntMayCome = 0;
                    score = 0;
                    try{
                            ResultSet rs=dbop.select(sql);
                            while(rs.next()){
				
                                
                                cntMayCome = rs.getInt("cntmaycome")+1;
                               
                                score = rs.getInt("score")+1;
                  
                            }
                    
                    
                        if(cntMayCome!=0&&score!=0){
                            sql = "update event set cntmaycome = "+cntMayCome+", score = "+score+" where eid = "+eid;
                        
                            dbop.operate(sql);
                        }
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("operate?optype=12&eid="+eid);
                        requestDispatcher.forward(request, response);
                        return;
                    }catch(Exception e){
                            e.printStackTrace();
                        }
                }else if(optype==7){
                    rate = 0;
                    cntRate = 0;
                    aRate = 0;
                    obj = request.getParameter("eid");
                    eid = Integer.parseInt(obj.toString());
                    obj1 = request.getParameter("rate");
                    rate = Integer.parseInt(obj1.toString());
                    sql = "select arate, cntrate from event where eid="+eid;
                    
                    try{
                            ResultSet rs=dbop.select(sql);
                            while(rs.next()){
				
                                
                                aRate = rs.getDouble("arate");
                               
                                cntRate = rs.getInt("cntrate");
                  
                            }
                            
                        aRate = (aRate * cntRate +rate)/(cntRate +1); 
                        cntRate = cntRate +1;
                    
                        if(rate!=0&&aRate!=0){
                            sql = "update event set arate = "+aRate+", cntRate = "+cntRate+" where eid = "+eid;
                        
                            dbop.operate(sql);
                        }
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("operate?optype=12&eid="+eid);
                        requestDispatcher.forward(request, response);
                        return;
                    }catch(Exception e){
                            e.printStackTrace();
                        }
                }else if (optype==8) {
                    String gcTitle = "";
                    String gcDates = "";
                    String gcLocation = "";
                    
                    Timestamp gcStartTime = new Timestamp(0);
                    Timestamp gcEndTime = new Timestamp(0);
                    
                    long start;
                    long end;
                    
                    String gcStart = "";
                    String gcEnd = "";
                    
                    String addToGoogleCalendar;
                                        
                    obj = request.getParameter("eid");
                    eid = Integer.parseInt(obj.toString());
                    
		    
                    sql = "select title, starttime, endtime, loc from event where eid="+eid;
                    
                    try{
                            ResultSet rs=dbop.select(sql);
                            while(rs.next()){
				
                                title = rs.getString("title");
                                startTime = rs.getTimestamp("starttime");
                                endTime = rs.getTimestamp("endtime");
                                loc = rs.getString("loc");
                            }
                            
                            StringTokenizer stT = new StringTokenizer(title, " ");  
                            while(stT.hasMoreElements()){  
                                //System.out.println("Token:" + st.nextToken());
                                gcTitle = gcTitle+"+"+stT.nextToken();
                            }
                            
                            StringTokenizer stL = new StringTokenizer(loc, " ");  
                            while(stL.hasMoreElements()){  
                                //System.out.println("Token:" + st.nextToken());
                                gcLocation = gcLocation+"+"+stL.nextToken();
                            }
                            
                            DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                            
                            System.out.println(startTime);
                            
                            start = startTime.getTime()+1000*60*60*5;
                            gcStartTime.setTime(start);
                            gcStart = sdf.format(gcStartTime);
                            gcStart = gcStart.substring(0, 8) + "T" + gcStart.substring(8, 14) + "Z";
                            
                            end = endTime.getTime()+1000*60*60*5;
                            gcEndTime.setTime(end);
                            gcEnd = sdf.format(gcEndTime);
                            gcEnd = gcEnd.substring(0, 8) + "T" + gcEnd.substring(8, 14) + "Z";
                            
                            gcDates = gcStart + "/"+gcEnd;
                            
                            addToGoogleCalendar = "http://www.google.com/calendar/event?action=TEMPLATE&text="+gcTitle+"&dates="+gcDates+"&location="+gcLocation;
                            System.out.println(addToGoogleCalendar);
                            
                            response.sendRedirect(addToGoogleCalendar);
                            
                            //RequestDispatcher requestDispatcher = request.getRequestDispatcher(addToGoogleCalendar);
                            //requestDispatcher.forward(request, response);
                            }catch(Exception e){
                            e.printStackTrace();
                        }
                    return;
                } else if (optype==9) {
                    obj = request.getParameter("type");
                    type = obj.toString();
                    
                    sql = "SELECT * FROM Event WHERE type = '" + type + "' ORDER BY score DESC, arate DESC, eid DESC";
                    
		ArrayList<Record> list=new ArrayList<Record>();
		RequestDispatcher red=request.getRequestDispatcher("EventList.jsp");
		try{
			ResultSet rs=dbop.select(sql);
			while(rs.next()){
                                eid = rs.getInt("eid");
                                title = rs.getString("title");
                                type = rs.getString("type");
                                startTime = rs.getTimestamp("starttime");
                                endTime = rs.getTimestamp("endtime");
                                loc = rs.getString("loc");
                                info = rs.getString("info");
                                cntCome = rs.getInt("cntcome");
                                cntMayCome = rs.getInt("cntmaycome");
                                score = rs.getInt("score");
                                contact = rs.getString("contact");
                                dpt = rs.getString("dpt");
                                aRate = rs.getDouble("arate");
                                cntRate = rs.getInt("cntrate");
                                list.add(new Record(eid, title, type, startTime, endTime, loc, info, cntCome, cntMayCome, score, contact, dpt, aRate, cntRate));
                            
			}
			request.setAttribute("list", list);
			red.forward(request, response);

                        }catch(Exception e){
                            e.printStackTrace();
                        }
                        return;
                } else if (optype==10) {
                    obj = request.getParameter("type");
                    type = obj.toString();
                    
                    sql = "SELECT * FROM Event WHERE type = '" + type + "' ORDER BY score DESC, arate DESC, eid DESC FETCH FIRST 1 ROWS ONLY";
                    
		
		try{
			ResultSet rs=dbop.select(sql);
			while(rs.next()){
                                eid = rs.getInt("eid");
                                title = rs.getString("title").substring(0, 13) + "...";
                                type = rs.getString("type");
                                startTime = rs.getTimestamp("starttime");
                                endTime = rs.getTimestamp("endtime");
                                loc = rs.getString("loc");
                                info = rs.getString("info").substring(0, 108) + "...";
                                cntCome = rs.getInt("cntcome");
                                cntMayCome = rs.getInt("cntmaycome");
                                score = rs.getInt("score");
                                contact = rs.getString("contact");
                                dpt = rs.getString("dpt");
                                aRate = rs.getDouble("arate");
                                cntRate = rs.getInt("cntrate");
                                System.out.println(title);
                                System.out.println(info);
                                //title = title.substring(0, 13) + "...";
                                //info = info.substring(0, 108) + "...";
                                record = new Record(eid, title, type, startTime, endTime, loc, info, cntCome, cntMayCome, score, contact, dpt, aRate, cntRate);
                            
			}
                        
                        
                        RequestDispatcher red = request.getRequestDispatcher("index.jsp");
                        
                        request.setAttribute("record", record);
			
			red.forward(request, response);

                        }catch(Exception e){
                            e.printStackTrace();
                        }
                        return;
                } else if (optype==11) {
                    obj = request.getParameter("eid");
                    eid = Integer.parseInt(obj.toString());
                    comment = request.getParameter("comment");
                    email = request.getParameter("email");
                    
                    sql = "INSERT INTO Comment(eid, comment,email)"
                    + " VALUES ("
                    + eid + ", '"
                    + comment + "', '"
                    + email + "')";
                    
                    dbop.operate(sql);
                    RequestDispatcher red=request.getRequestDispatcher("operate?optype=12&eid="+eid);
                    red.forward(request, response);
                    return;
                } else if (optype==12) {
                    obj = request.getParameter("eid");
                    eid = Integer.parseInt(obj.toString());
                    
                    sql = "SELECT e.title, c.email, c.comment FROM Event e, Comment c WHERE e.eid =" + eid + " and c.eid = " + eid + " ORDER BY cid DESC";
                    
                    ArrayList<Comment> list=new ArrayList<Comment>();
		RequestDispatcher red=request.getRequestDispatcher("operate?optype=4&eid="+eid);
                
		try{
			ResultSet rs=dbop.select(sql);
			while(rs.next()){
                                title = rs.getString("title");
                                email = rs.getString("email");
                                comment = rs.getString("comment");
                            
                                list.add(new Comment(comment, email, title));
                            
			}
			request.setAttribute("list", list);
			red.forward(request, response);

                        }catch(Exception e){
                            e.printStackTrace();
                        }
                        return;
                }
                
		go(request,response);
	}
        
        //post all messages to homepage:
	private void go(HttpServletRequest request, HttpServletResponse response){
		
                String sql = "SELECT * FROM Event ORDER BY score DESC, arate DESC, eid DESC";
		int eid;
                String title;
                String type;
                Timestamp startTime;
                Timestamp endTime;
                String loc;
                String info;
                int cntCome;
                int cntMayCome;
                int score;
                String contact;
                String dpt;
                double aRate;
                int cntRate;
		ArrayList<Record> list=new ArrayList<Record>();
		RequestDispatcher red=request.getRequestDispatcher("EventList.jsp");
		try{
			ResultSet rs=dbop.select(sql);
			while(rs.next()){
                                eid = rs.getInt("eid");
                                title = rs.getString("title");
                                type = rs.getString("type");
                                startTime = rs.getTimestamp("starttime");
                                endTime = rs.getTimestamp("endtime");
                                loc = rs.getString("loc");
                                info = rs.getString("info");
                                cntCome = rs.getInt("cntcome");
                                cntMayCome = rs.getInt("cntmaycome");
                                score = rs.getInt("score");
                                contact = rs.getString("contact");
                                dpt = rs.getString("dpt");
                                aRate = rs.getDouble("arate");
                                cntRate = rs.getInt("cntrate");
                                list.add(new Record(eid, title, type, startTime, endTime, loc, info, cntCome, cntMayCome, score, contact, dpt, aRate, cntRate));
                            
			}
			request.setAttribute("list", list);
			red.forward(request, response);

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
        
        // get current date:
        public String GetNowDate(){
            String ndt = "";
            int y, m, d;
            Calendar cal = Calendar.getInstance();
            y = cal.get(Calendar.YEAR);
            m = cal.get(Calendar.MONTH)+1;
            d = cal.get(Calendar.DATE);
            ndt = y + "-" + m + "-" +d;
            return ndt;
        }
}
