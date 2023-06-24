package p.memory.dto;

public class HeartDTO {
	private int per_seq;
	private String id;
	public HeartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HeartDTO(int per_seq, String id) {
		super();
		this.per_seq = per_seq;
		this.id = id;
	}
	public int getPer_seq() {
		return per_seq;
	}
	public void setPer_seq(int per_seq) {
		this.per_seq = per_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
