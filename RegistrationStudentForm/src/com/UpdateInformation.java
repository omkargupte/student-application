package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateInformation")
public class UpdateInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
     static Connection con=null;
     PreparedStatement ps=null;
    
    public UpdateInformation() {
        super();
       
    }
    static
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");    		
    	}
    	catch(SQLException | ClassNotFoundException e)
    	{
    		e.printStackTrace();
    	}
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		HttpSession hs=request.getSession();
		String uid=(String)hs.getAttribute("u");
		String pwd=(String)hs.getAttribute("p");
		try
		{
			String fname=request.getParameter("fname");
			String mname=request.getParameter("mname");
			String lname=request.getParameter("lname");
			String addr=request.getParameter("addr");
			int pincode=Integer.parseInt(request.getParameter("pcode"));
			String ct=request.getParameter("city");
			String st=request.getParameter("state");
			String mail=request.getParameter("email");
			String phno=request.getParameter("phone");
			String bday=request.getParameter("birth");
			String username=request.getParameter("uid");
			
			String sql="update OMKAR.registrationDetails set firstname=?, middlename=?, lastname=?, address=?, pin=?, city=?, state=?, mail=?,phone=?,birthday=?,username=? where username=? and pass=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, mname);
			ps.setString(3, lname);
			ps.setString(4, addr);
			ps.setInt(5, pincode);
			ps.setString(6, ct);
			ps.setString(7, st);
			ps.setString(8, mail);
			ps.setString(9,phno);
			ps.setString(10,bday);
			ps.setString(11, username);
			ps.setString(12, uid);
			ps.setString(13, pwd);

			int i=ps.executeUpdate();
			if(i>0)
			{
				pw.print("Successfull");
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
