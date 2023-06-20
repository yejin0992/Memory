package p.memory.dto;

import java.util.List;

import org.springframework.lang.Nullable;

public class PerfumeFilter {
	
	@Nullable
	private List<String> checkedValue;
	@Nullable
	private int startPrice;
	@Nullable
	private int endPrice;
	@Nullable
	private String category;
	@Nullable
	private String searchText;
	public PerfumeFilter() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PerfumeFilter(List<String> checkedValue, int startPrice, int endPrice, String category, String searchText) {
		super();
		this.checkedValue = checkedValue;
		this.startPrice = startPrice;
		this.endPrice = endPrice;
		this.category = category;
		this.searchText = searchText;
	}
	public List<String> getCheckedValue() {
		return checkedValue;
	}
	public void setCheckedValue(List<String> checkedValue) {
		this.checkedValue = checkedValue;
	}
	public int getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}
	public int getEndPrice() {
		return endPrice;
	}
	public void setEndPrice(int endPrice) {
		this.endPrice = endPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	@Override
	public String toString() {
		return "PerfumeFilter [checkedValue=" + checkedValue + ", startPrice=" + startPrice + ", endPrice=" + endPrice
				+ ", category=" + category + ", searchText=" + searchText + "]";
	}
	

	

}
