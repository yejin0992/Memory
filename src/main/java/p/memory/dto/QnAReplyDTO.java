package p.memory.dto;

public class QnAReplyDTO {

	private int re_seq ;
	private String re_writer;
	private String re_contents;
	private String  re_write_date;
	private int qa_seq;
	
	
	public QnAReplyDTO() {
		super();
	}
	public QnAReplyDTO(int re_seq, String re_writer, String re_contents, String re_write_date, int qa_seq) {
		super();
		this.re_seq = re_seq;
		this.re_writer = re_writer;
		this.re_contents = re_contents;
		this.re_write_date = re_write_date;
		this.qa_seq = qa_seq;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public String getRe_writer() {
		return re_writer;
	}
	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}
	public String getRe_contents() {
		return re_contents;
	}
	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}
	public String getRe_write_date() {
		return re_write_date;
	}
	public void setRe_write_date(String re_write_date) {
		this.re_write_date = re_write_date;
	}
	public int getQa_seq() {
		return qa_seq;
	}
	public void setQa_seq(int qa_seq) {
		this.qa_seq = qa_seq;
	}
	
	
	
}
