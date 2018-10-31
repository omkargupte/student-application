package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.RequestDispatcher;

@WebServlet("/UserValidator")
public class UserValidator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con = null;
	RequestDispatcher rd = null;

	public UserValidator() {
		super();

	}

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");

		} catch (SQLException s) {
			s.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int flag=0;
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String uname = request.getParameter("userid");
		String pass = request.getParameter("pass");

		try {
			String sql = "select username, pass from OMKAR.registrationDetails";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String udb = rs.getString("username");// get value from database
				String pdb = rs.getString("pass");// get value from database

				if (uname.equals(udb) && pass.equals(pdb)) {
					HttpSession session=request.getSession();
					session.setAttribute("u", uname);
					session.setAttribute("p", pass);
					response.sendRedirect("UserDetails.jsp");
					flag=1;
				} 
				
			}
			if(flag==0)
			{
				pw.println("<script>");
				pw.println("alert(' Either User Name or Password is incorrect...');");
				pw.println("window.location.href='Login.html'");
				pw.println("</script>");				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			
		}
	}

}
