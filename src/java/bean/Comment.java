package bean;

//a java bean is used to save Record object and its data.

public class Comment {
    
        
        public String comment;
        public String email;
        public String title;
        
        public Comment(String comment, String email, String title) {
            
            this.comment = comment;
            this.email = email;
            this.title = title;
        }
    
}
