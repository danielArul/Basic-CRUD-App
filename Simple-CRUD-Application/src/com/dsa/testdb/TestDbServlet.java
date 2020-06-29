package com.dsa.testdb;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user="springstudent";
		String pass="springstudent";
		
		
		String jdbcurl="jdbc:mysql://localhost:3306/simple_crud_app?useSSL=false";
		String driver = "com.mysql.jdbc.Driver";
		
		try {
			PrintWriter out=response.getWriter();
			
			out.println("Connecting to database: "+jdbcurl);
			
			Class.forName(driver);
			
			Connection myConn=DriverManager.getConnection(jdbcurl,user,pass);
			
			out.println("Connection to MySQL is successful");
			
			myConn.close();
		}
		catch(Exception exc) {
			exc.printStackTrace();
			throw new ServletException(exc);
		}
	}

}
