package p.memory.dto;

public class BookmarkDTO {

	
	private int bookmark_seq; 
	private int fr_seq;
	private String user_id;
	
	public BookmarkDTO() {
		super(); 
	}
	
	public BookmarkDTO(int bookmark_seq, int fr_seq, String user_id) {
		super();
		this.bookmark_seq = bookmark_seq;
		this.fr_seq = fr_seq;
		this.user_id = user_id;
	}

	public int getBookmark_seq() {
		return bookmark_seq;
	}

	public void setBookmark_seq(int bookmark_seq) {
		this.bookmark_seq = bookmark_seq;
	}

	public int getFr_seq() {
		return fr_seq;
	}

	public void setFr_seq(int fr_seq) {
		this.fr_seq = fr_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
}
