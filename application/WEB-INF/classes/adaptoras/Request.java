package adaptoras;

public class Request {

   private int id;
   private int sender_id;
   private int receipient_id;
   private String cause;
   private String status;
   private String date;
   private String period;
   private String comment;
   String fullname;

   public Request(int id,int s_id,int r_id,String cause,String status,String date,String period,String comment,String fullname) {
      		this.id = id;
      		this.sender_id = s_id;
      		this.receipient_id = r_id;
      		this.date=date;
      		this.comment=comment;
      		this.status=status;
      		this.cause=cause;
      		this.period=period;
      		this.fullname=fullname;
   }
   public Request(int s_id,int r_id,String cause,String status,String period,String comment) {
           this.sender_id = s_id;
           this.receipient_id = r_id;
           this.comment=comment;
           this.status=status;
           this.cause=cause;
           this.period=period;
   }


   public void setId(int id) {
      		this.id = id;
   }

   public int getId() {
      		return id;
   }
   public void setSenderId(int s_id) {
         	this.sender_id = s_id;
      }

   public int getSenderId() {
        return sender_id;
   }
   public void setReceipientId(int r_id) {
        this.receipient_id = r_id;
    }

    public int getReceipientId() {
        return receipient_id;
   }
   public void setComment(String comment) {
   	   this.comment=comment;
   }

   public String getComment() {
   		return comment;
   }
   public void setStatus(String status) {
   		this.status=status;
       }

   	public String getStatus() {
   		return status;
	}
	public void setCause(String cause) {
	   	this.cause=cause;
    }

	public String getCause() {
	   	return cause;
	}
	public void setDate(String date) {
		   	this.date=date;
	 }

		public String getDate() {
		   	return date;
	}
	public void setPeriod(String period) {
			   	this.period=period;
    }

	public String getPeriod() {
			   	return period;
	}
	public void setFullname(String fullname) {
	    this.fullname=fullname;
	}

		public String getFullname() {
		return fullname;
	}





}