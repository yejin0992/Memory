package p.memory.dto;

public class QnAFileDTO {

	private int qa_im_seq;
	private String oriName;
	private String sysName;
	private int qa_seq;
	
	
	public QnAFileDTO() {
		super();
	}
	public QnAFileDTO(int qa_im_seq, String oriName, String sysName, int qa_seq) {
		super();
		this.qa_im_seq = qa_im_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.qa_seq = qa_seq;
	}
	public int getQa_im_seq() {
		return qa_im_seq;
	}
	public void setQa_im_seq(int qa_im_seq) {
		this.qa_im_seq = qa_im_seq;
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
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}

	
	
}
