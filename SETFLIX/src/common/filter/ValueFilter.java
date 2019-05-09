package common.filter;


public class ValueFilter {
	private static ValueFilter instance = new ValueFilter();

	private ValueFilter() {
	};

	public static ValueFilter getInstance() {
		return instance;
	}
	
	public boolean isNumber(String str) {
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
