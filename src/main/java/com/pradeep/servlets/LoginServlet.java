package com.pradeep.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pradeep.model.DBConnection;
import com.pradeep.model.UserDetails;
import com.pradeep.model.UserDetailsDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		UserDetailsDAO userDAO=new UserDetailsDAO();
		int userId=userDAO.authenticateUser(username, password);
		
		if(userId>0) {
			HttpSession session=request.getSession();
			session.setAttribute("userId", userId);
			
			response.sendRedirect("UserProfile.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
