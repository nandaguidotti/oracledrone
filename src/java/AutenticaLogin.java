/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Usuario;
/**
 *
 * @author guidotti
 */


@WebServlet(name = "AutenticaLogin",urlPatterns = {"/AutenticaLogin"})
public class AutenticaLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        
        String tipoRequisicao = request.getParameter("tipoRequisicao");
        
        
        switch (tipoRequisicao){
            case "Login":
                login(request, response);
                break;

            default:
                break;
        }      
                
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AutenticaLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AutenticaLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

     private void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String email = request.getParameter("frm_email_user");
        String pswd = request.getParameter("frm_pass_user");
       
        // Verifica se o usuário forneceu e-mail/Senha
        if(email == "" || pswd == ""){        
       
             request.getRequestDispatcher("ErroLogin.jsp").forward(request, response);
        }
      
        Usuario usuario = new Usuario();
        
        usuario.setEmail_user(email);
        usuario.setPass_user(pswd);
        
        response.setContentType("text/html;charset=UTF-8");
        if(usuario.logar()){
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuario", usuario);
         
            request.getRequestDispatcher("aplicacao.jsp").forward(request, response);
            
                      
            
        }else{
            request.setAttribute("status", "Usuário não encontrado!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }      
    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession sessao = request.getSession();
        sessao.removeAttribute("usuario");
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AutenticaLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AutenticaLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
