/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ajaxrequest;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Logidrone;
import models.Rota;
import models.Usuario;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;


@WebServlet(name = "CadastrarRota", urlPatterns = {"/CadastrarRota"})
public class CadastrarRota extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
        String type_request = "cadastrar_rota";
        System.out.println(type_request);
        switch(type_request){
            case "cadastrar_rota":
                cadastrarRota(request, response);
                break;
        }
    }
    private void cadastrarRota(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException, SQLException, Exception{
        
        HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
        if(sessao.getAttribute("usuario") == null){
           //request.getRequestDispatcher("index.jsp").forward(request, response);
            System.err.println("Erro");
        }else{
            usuario =  (Usuario) sessao.getAttribute("usuario");
        }
       
        // Aqui faz o cadastro da Rota
        String name_rota  =  request.getParameter("name_user");
        int id_user   =  usuario.getId_user();
        
                
        Rota rota = new Rota(name_rota, id_user);                        

   /*#### Aqui começa os códigos para upload e processamento do arquivo e inserção dos dados no Banco de Dados ###*/     
   
   response.setContentType("text/html;charset=UTF-8");
                
    Logidrone logidrone = new Logidrone();        
    String filePath  = null;

    filePath = "/tmp";


    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(4096);
    factory.setRepository(new File("/tmp"));
    ServletFileUpload upload = new ServletFileUpload(factory);        
    upload.setSizeMax(1000000);

    
    List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));  
        
// Process the uploaded items
    Iterator<FileItem> iter = items.iterator();
    while (iter.hasNext()) {
        FileItem item = iter.next();
        // Process a regular form field
            if (item.isFormField()) {
                    //String name =  item.getFieldName();
                    String valueNameRota = item.getString();
                    rota.setName_routeidrone(valueNameRota); // Aqui peguei o nome da Rota
                    rota.cadastroRota(id_user); // Insere a Rota

            }
        // Process a file upload
        if (!item.isFormField()){
                    String fileName = item.getName();                       
                    //System.out.println(filePath + fileName);
                    item.write(new File(filePath, fileName));
                    logidrone.gravaCSV(filePath+fileName, id_user);                            
        }
       }



        // Retorna resposta para o Ajax
    
        PrintWriter out = response.getWriter();
        out.print("Hello Word Ajax");
        out.close();
        
  
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
        } catch (Exception ex) {
            Logger.getLogger(CadastrarRota.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (Exception ex) {
            Logger.getLogger(CadastrarRota.class.getName()).log(Level.SEVERE, null, ex);
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
