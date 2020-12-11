/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GameNumber;
/**
 *
 * @author Soumya
 */
@WebServlet(name = "GameControllerServlet", urlPatterns = {"/GameControllerServlet"})
public class GameControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get input - guess
    GameNumber guess = new GameNumber(Integer.parseInt(request.getParameter("guess")));
    
    // get session attributes
    HttpSession session = request.getSession();
    GameNumber target = (GameNumber)session.getAttribute("target");
    GameNumber guesses = (GameNumber)session.getAttribute("guesses");
    
    // initialize output
    String msg = "";
    String url = "/guess.jsp";
    
    // compare the guess with the target
    if (guess.getValue() == target.getValue()) {
      // winner
      msg = "Correct! You got in " + guesses.getValue() + " guesses.";
      url = "/correct.jsp";
    }
    else {
      // next guess
      guesses.increment();
      if (guess.getValue() < target.getValue()) {
        // low
        msg = "Incorrect guess! Guess higher next time.";
      } else {
        // high
        msg = "Incorrect guess! Guess lower next time.";
      }
    }
    // add values to request object to pass to the destination
    request.setAttribute("msg", msg);
    
    // send control to the next component
    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
    dispatcher.forward(request, response);
	}

}
