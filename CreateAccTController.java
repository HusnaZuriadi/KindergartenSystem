package kms.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import kms.dao.*;
import kms.model.*;

import java.sql.SQLException;

/**
 * Servlet implementation class CreateAccTController
 */
@WebServlet("/CreateAccTController")
public class CreateAccTController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccTController() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//create teacher object
		teacher teach = new teacher();
		
		//retrieve input from html
		teach.setTeacherName(request.getParameter("name"));
		teach.setTeacherEmail(request.getParameter("email"));
		teach.setTeacherPass(request.getParameter("password"));
		teach.setTeacherRole(request.getParameter("role"));
		teach.setTeacherPhone(request.getParameter("phone"));
		teach.setTeacherType(request.getParameter("teacherType"));
		
		
		teacherDAO.addTeacher(teach);
		
		//set attribute to a servlet request. Set the attribute name to shawls and call getAllShawls() from ShawlDAO class
				request.setAttribute("teachers", teacherDAO.getAllTeacher());
				
				//Obtain the RequestDispatcher from the request object. The pathname to the resource is listShawl.jsp
				RequestDispatcher req = request.getRequestDispatcher("login.jsp");
				
				//Dispatch the request to another resource using forward() methods of the RequestDispatcher
				req.forward(request, response);
		

	}

}
