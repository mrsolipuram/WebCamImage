/**
 * 
 */
package com.webcam.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author madhava
 * 
 */
public class WebCamServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			InputStream inputStream = request.getInputStream();
			if (inputStream != null) {
				FileOutputStream ios = new FileOutputStream(new File(
						"/home/madhava/key_backup/camfile.jpg"));
				byte[] buffer = new byte[1024];
				int len;
				while ((len = inputStream.read(buffer)) != -1) {
					ios.write(buffer, 0, len);
				}
				ios.close();
			}
			out.write("success");
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	}

}
