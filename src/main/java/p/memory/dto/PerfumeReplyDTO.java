package p.memory.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class PerfumeReplyDTO {
	private int re_seq;
	private String id;
	private String contents;
	private Timestamp writeDate;
	private int per_seq;
	private int cpage;
	public PerfumeReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PerfumeReplyDTO(int re_seq, String id, String contents, Timestamp writeDate, int per_seq, int cpage) {
		super();
		this.re_seq = re_seq;
		this.id = id;
		this.contents = contents;
		this.writeDate = writeDate;
		this.per_seq = per_seq;
		this.cpage = cpage;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	public int getPer_seq() {
		return per_seq;
	}
	public void setPer_seq(int per_seq) {
		this.per_seq = per_seq;
	}
	public int getCpage() {
		return cpage;
	}
	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public String getFormedDate() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		return date.format(this.writeDate.getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis();
		long write_time = this.writeDate.getTime();
		long time_gap = current_time - write_time;

		if(time_gap<60000) {
			return "1분 이내" ;
		}else if(time_gap < 300000) {
			return "5분 이내";
		}else if(time_gap<3600000) {
			return "1시간 이내";
		}else if(time_gap <86400000) {
			return "오늘";
		}else {
			return getFormedDate();
		}
	}
	
	
	
}
