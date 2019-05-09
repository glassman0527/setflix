package board.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class NaverVideo {
	private static final String domain = "https://movie.naver.com";
	private static NaverVideo instance = new NaverVideo();
	public NaverVideo() {}
	
	public static NaverVideo getInstance() {
		return instance;
	}

	public String GetSrc(String src) throws MalformedURLException, IOException {
		
		Document doc = Jsoup.parse(new URL(src), 5000);
		
		src = domain+doc.select("._videoPlayer").attr("src");
		return src;
	}

}
