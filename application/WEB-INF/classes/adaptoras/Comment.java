package adaptoras;

public class Comment {

   private int id;
   private int s_id;
   private int r_id;
   private String name;
   private String surname;
   private String comment;
   private String date;

   public Comment(int sender_id,String name,String surname, String comment,String date) {
	    this.s_id = sender_id;
   		this.name = name;
   		this.surname = surname;
   		this.comment=comment;
   		this.date=date;
   }
   public Comment(int s_id,int r_id,String comment) {
      		this.s_id=s_id;
      		this.r_id=r_id;
      		this.comment=comment;
   }

    public int getId() {
		return id;
	}

    public void setName(String name) {
   			this.name = name;
   	}

   	public String getName() {
   		return name;
   	}

   	public void setSurname(String surname) {
   		this.surname = surname;
   	}

   	public String getSurname() {
   		return surname;
	}

	public void setComment(String comment) {
		this.comment=comment;
    }

	public String getComment() {
		return comment;
	}

	public void setDate(String date) {
		this.date=date;
	}

	public String getDate() {
		return date;
	}

	public void setSid(int sid) {
		this.s_id=sid;
	}

	public int getSid() {
		return s_id;
	}
	public void setRid(int rid) {
		this.r_id=rid;
	}

	public int getRid() {
		return r_id;
	}


}