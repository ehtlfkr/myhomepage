package dto;

public class Myhome {

	private static final long serialVersionUID = -4274700572038677000L;

	private String myhomePost;
	private String username;
	private String notice;
	private String title;
	private String text;
	private String image;
	private String date;

	public Myhome() {
		super();
	}

	public Myhome(String myhomePost, String username, String notice) {
		this.myhomePost = myhomePost;
		this.username = username;
		this.notice = notice;
	}
	
	public String getMyhomePost() {
		return myhomePost;
	}

	public void setMyhomePost(String myhomePost) {
		this.myhomePost = myhomePost;

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

	public String getTitle() {
		return title;

	}

	public void setTitle(String title) {
		this.title = title;

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
