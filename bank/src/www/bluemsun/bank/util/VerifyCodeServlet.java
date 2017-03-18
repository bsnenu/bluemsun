package www.bluemsun.bank.util;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
public class VerifyCodeServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();//鑾峰彇涓�鎬ч獙璇佺爜鍥剧墖
		// 璇ユ柟娉曞繀椤诲湪getImage()鏂规硶涔嬪悗鏉ヨ皟鐢�
		System.out.println(vc.getText());//鑾峰彇鍥剧墖涓婄殑鏂囨湰
		VerifyCode.output(image, response.getOutputStream());//鎶婂浘鐗囧啓鍒版寚瀹氭祦涓�
		
		request.getSession().setAttribute("vCode", vc.getText());
	}
}
