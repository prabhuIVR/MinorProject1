package JavaFiles;

import java.io.*;
import java.sql.*;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import ServletClasses.DBConnect;

@WebServlet(name = "uploadLectures", urlPatterns = { "/uploadLectures" })
public class LecturesUploadDB extends HttpServlet{

	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			Connection con = DBConnect.connect();
			String name = request.getParameter("fname");
			String year = request.getParameter("syear");
			String branch = request.getParameter("sbranch");
			String target = request.getParameter("taudi");
			String title = request.getParameter("pname");
			String dates = request.getParameter("sdate");
			PrintWriter out = response.getWriter();
			String query = "INSERT into GUEST_LECTURE_IT VALUES (?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(query);
			
			st.setString(1, year);
			st.setString(2, name);
			st.setString(3, title);
			st.setString(4, branch);
			st.setString(5, target);
			st.setString(6, dates);
			
			st.executeUpdate();
			
			out.println("<script>");
			out.println("alert('Successfully inserted Guest Lecture data...');");
			out.println("window.open('CareerGuide.jsp','_self');");
			out.println("</script>");
			st.close();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse   response) throws ServletException, IOException {
        doPost(request, response);
	}


}
