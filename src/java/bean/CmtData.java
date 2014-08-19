package bean;
import java.util.*;
import bean.*;

//a java bean is used to save all message records
public class CmtData {
	private Collection<Comment> list;
	
	public void setList(Collection<Comment> list){
		this.list=list;
	}
	public Collection<Comment> getList(){
		return this.list;
	}
}
