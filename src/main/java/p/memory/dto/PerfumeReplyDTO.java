package p.memory.dto;

import java.sql.Timestamp;

public class PerfumeReplyDTO {
private int re_seq;
private String writer;
private String contents;
private Timestamp writeDate;
private int per_seq;
public int getRe_seq() {
	return re_seq;
}
public void setRe_seq(int re_seq) {
	this.re_seq = re_seq;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
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
public PerfumeReplyDTO(int re_seq, String writer, String contents, Timestamp writeDate, int per_seq) {
	super();
	this.re_seq = re_seq;
	this.writer = writer;
	this.contents = contents;
	this.writeDate = writeDate;
	this.per_seq = per_seq;
}
public PerfumeReplyDTO() {
	super();
	// TODO Auto-generated constructor stub
}
}
