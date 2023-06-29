package p.memory.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class FrReplyDTO {

	private int re_seq;
	private String re_writer;
	private String re_contents;
	private Timestamp re_write_date;
	private int fr_seq;
	private String formattedDate;

	public FrReplyDTO() {
		super();
	}

	public FrReplyDTO(int re_seq, String re_writer, String re_contents, Timestamp re_write_date, int fr_seq,
			String formattedDate) {
		super();
		this.re_seq = re_seq;
		this.re_writer = re_writer;
		this.re_contents = re_contents;
		this.re_write_date = re_write_date;
		this.fr_seq = fr_seq;
		this.formattedDate = formattedDate;
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

	public Timestamp getRe_write_date() {
		return re_write_date;
	}

	public void setRe_write_date(Timestamp re_write_date) {
		this.re_write_date = re_write_date;
	}

	public int getFr_seq() {
		return fr_seq;
	}

	public void setFr_seq(int fr_seq) {
		this.fr_seq = fr_seq;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	// 형식화된 시간 반환
	public String formatWriteDate() {
		LocalDateTime writeDateTime = re_write_date.toLocalDateTime();
		LocalDateTime now = LocalDateTime.now();
		// writeDateTime의 날짜부분과 현재 날짜를 비교
		if (writeDateTime.toLocalDate().equals(LocalDate.now())) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
			return writeDateTime.format(formatter);
		} else {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			return formatter.format(re_write_date);
		}
	}

}
