package v1.board.c9.utils;

import java.util.Properties;

public class QueryUtil {

private static Properties prop = new Properties();
	
	static {
		try {
			prop.load(Class.forName("v1.board.c9.utils.QueryUtil").getResourceAsStream("query.properties"));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 지정된 이름의 쿼리문을 반환한다.
	 * @param name
	 * @return
	 */
	public static String getSQL(String name) {
		return prop.getProperty(name);
	}
}
