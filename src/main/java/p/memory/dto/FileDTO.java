package p.memory.dto;

public class FileDTO {
	private int file_seq;
	private String oriName;
	private String sysName;
	private int per_seq;
	public FileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileDTO(int file_seq, String oriName, String sysName, int per_seq) {
		super();
		this.file_seq = file_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.per_seq = per_seq;
	}
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
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
	public int getPer_seq() {
		return per_seq;
	}
	public void setPer_seq(int per_seq) {
		this.per_seq = per_seq;
	}
	}
