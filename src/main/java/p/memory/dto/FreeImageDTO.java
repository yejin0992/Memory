package p.memory.dto;

public class FreeImageDTO {
	
	private int im_seq;
	private String oriName;
	private String sysName;
	private int fr_seq;
	
	public FreeImageDTO() {
		super(); 
	}
	
	public FreeImageDTO(int im_seq, String oriName, String sysName, int fr_seq) {
		super();
		this.im_seq = im_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.fr_seq = fr_seq;
	}
	public int getIm_seq() {
		return im_seq;
	}
	public void setIm_seq(int im_seq) {
		this.im_seq = im_seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public int getFr_seq() {
		return fr_seq;
	}
	public void setFr_seq(int fr_seq) {
		this.fr_seq = fr_seq;
	} 
	
	
	

}
