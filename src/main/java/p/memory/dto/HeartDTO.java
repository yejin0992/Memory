package p.memory.dto;

public class HeartDTO {
	private int heart_seq;
	private int heart_flag;
	private int per_seq;
	private int fr_seq;
	private String writer;
	public HeartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HeartDTO(int heart_seq, int heart_flag, int per_seq, int fr_seq, String writer) {
		super();
		this.heart_seq = heart_seq;
		this.heart_flag = heart_flag;
		this.per_seq = per_seq;
		this.fr_seq = fr_seq;
		this.writer = writer;
	}
	public int getHeart_seq() {
		return heart_seq;
	}
	public void setHeart_seq(int heart_seq) {
		this.heart_seq = heart_seq;
	}
	public int getHeart_flag() {
		return heart_flag;
	}
	public void setHeart_flag(int heart_flag) {
		this.heart_flag = heart_flag;
	}
	public int getPer_seq() {
		return per_seq;
	}
	public void setPer_seq(int per_seq) {
		this.per_seq = per_seq;
	}
	public int getFr_seq() {
		return fr_seq;
	}
	public void setFr_seq(int fr_seq) {
		this.fr_seq = fr_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
