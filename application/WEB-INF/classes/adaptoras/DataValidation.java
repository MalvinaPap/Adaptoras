package adaptoras;

import java.util.List;

public class DataValidation {

	public DataValidation() { }

	public boolean isNameValid(String name) {

			//must return true only when the Fullname is valid (at least 5 characters long)
			if (name == null) {
				return false;
			}
			int length = name.length();

			if (length >= 3) {
				return true;
			}else {
				return false;
			}
	}

	public boolean isSurnameValid(String surname) {

				//must return true only when the Fullname is valid (at least 5 characters long)
				if (surname == null) {
					return false;
				}
				int length = surname.length();

				if (length >= 3) {
					return true;
				}else {
					return false;
				}
	}

	public boolean isValidEmailAddress(String email) {

			if(email == null) {
				return false;
			}

			String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
			java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
			java.util.regex.Matcher m = p.matcher(email);

			return m.matches();
	}

	public boolean isPasswordValid(String password) {
			if(password == null) {
				return false;
			}

			return true;
	}

	public boolean isCityValid(String city) {


			if (city.equals("0")) {
				return false;
			} else {
			  return true;
		    }
	}


	public boolean isValidGender(String gender) {

			return (gender == null || ( !gender.equals("Male") && !gender.equals("Female") ) ? false : true);

	}


	public boolean isValidBirthday(String birthday) {

		String ePattern = "\\d\\d\\d\\d-\\d\\d-\\d\\d";
		java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		java.util.regex.Matcher m = p.matcher(birthday);

		return m.matches();

	}

	public boolean isValidDescription(String descr) {

		if (descr.length()>200) {
			return false;
	    } else {
		    return true;
	    }


	}

}
