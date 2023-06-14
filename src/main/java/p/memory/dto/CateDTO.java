package p.memory.dto;

public class CateDTO {
	
	private int seq;
	private String cate_name;
	
	public CateDTO() {
		super(); 
	}
	public CateDTO(int seq, String cate_name) {
		super();
		this.seq = seq;
		this.cate_name = cate_name;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	
	
	

}
