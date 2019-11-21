package dto;

public class gallery {
	
	private static final long serialVersionUID = -4274700572038677000L;

	private String myhomegallery;
	private String username;
	private String notice;
	private String text;
	private String image;
	private String date;

	public gallery() {
		super();
	}

	public gallery(String myhomegallery, String username, String notice) {
		this.myhomegallery = myhomegallery;
		this.username = username;
		this.notice = notice;
	}
	
	public String getMyhomegallery() {
		return myhomegallery;
	}

	public void setMyhomegallery(String myhomegallery) {
		this.myhomegallery = myhomegallery;

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;

	}

	public String getNotice() {
		return notice;

	}

	public void setNotice(String notice) {
		this.notice = notice;

	}

	public String getText() {
		return text;

	}

	public void setText(String text) {
		this.text = text;

	}

	public String getImage() {
		return image;

	}

	public void setImage(String image) {
		this.image = image;

	}
	
	public String getDate() {
		return date;

	}

	public void setDate(String date) {
		this.date = date;

	}

}
