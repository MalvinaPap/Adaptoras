package adaptoras;

public class User {

    private int id;
	private String email;
	private String password;
	private String name;
	private String surname;
	private String gender;
	private String lives;
	private String from;
	private String birthday;
	private String description;

	/**
	 * Constructor
	 *
	 * @param username, String
	 * @param password, String
	 * @param email, String
	 */
	public User(String email, String password) {
		this.password = password;
		this.email = email;
	}
	public User(String email, String password,String name,String surname,String gender,String lives) throws Exception{
		this.email = email;
		this.password = password;
		this.name=name;
		this.surname=surname;
		this.gender=gender;
		this.lives=lives;
	}
	public User(String email, String password,String name,String surname,String gender,String lives,String from,String birthday,String description) throws Exception{
			this.email = email;
			this.password = password;
			this.name=name;
			this.surname=surname;
			this.gender=gender;
			this.lives=lives;
			this.from=from;
			this.birthday=birthday;
			this.description=description;
	}
	public User(int id,String email,String name,String surname,String description) {
		this.id=id;
		this.email = email;
		this.name=name;
		this.surname=surname;
		this.description=description;
	}


	/*Getters and Setters*/
    public int getId() {
		return id;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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



	public String getGender() {
		return gender;
	}

	  public void setGender(String gender) {
			this.gender = gender;
	}

	public String getLives() {
			return lives;
	}

    public void setLives(String lives) {
			this.lives = lives;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getBirthday() {
			return birthday;
		}

	public void setBirthday(String birthday) {
			this.birthday = birthday;
	}
	public String getDescription() {
			return description;
	}

	public void setDescription(String description) {
			this.description = description;
	}



} //End of class
