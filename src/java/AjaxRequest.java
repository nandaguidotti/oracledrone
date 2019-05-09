/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.Linhacultivo;
import models.Logidrone;
import models.Mosaico;
import models.Rota;
import models.Usuario;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

/**
 *
 * @author vinicius
 */

@WebServlet(name = "AjaxRequest", urlPatterns = {"/AjaxRequest"})
public class AjaxRequest extends HttpServlet {

    private void limpaPastaTemp(File f) {
        if (f.isDirectory()) {
            File[] files = f.listFiles();
            for (int i = 0; i < files.length; ++i) {
                limpaPastaTemp(files[i]);
            }
        }
        f.delete();
    }

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        HttpSession sessao = request.getSession();
        Usuario usuario = new Usuario();
        if (sessao.getAttribute("usuario") == null) {
                    System.err.println("Erro");
        } else {
            usuario = (Usuario) sessao.getAttribute("usuario");
        }

        int id_user = usuario.getId_user();
        String type_request;
        if (request.getParameter("tipoRequisicao") != null) {
            System.out.println("Tipo de requisição recebida com sucesso");
            type_request = request.getParameter("tipoRequisicao");
            System.out.println(type_request);
            switch (type_request) {
                case "plotar_rota":
                    String route_id = request.getParameter("sltnomepais");
                   
                    plotarRota(route_id, id_user, response);
                    break;
                case "gerar_linha_cultivo":

                    String id_mosaico;
                    if (request.getParameter("id_mosaico") != null) {
                        id_mosaico = request.getParameter("id_mosaico");
                    } else {
                        id_mosaico = request.getParameter("sltnomemosaico");
                    }
                    System.out.println("id_mosaico=> " + id_mosaico);
                    gerarLinhaCultivo(id_mosaico, id_user, response);
                    break;
                case "validar_name":
                    String name = request.getParameter("frm_name");
                    String objname = request.getParameter("objname");

                    validarNome(name, objname, id_user, response);
                    break;
                default:
                    break;
            }
        } else {
            
            //Limpa pasta temporaria 
            String ABSOLUTE_PATH_IMG = System.getProperty("user.home") + "/tempOD/"+id_user+"/";
            File f = new File(ABSOLUTE_PATH_IMG);
            if(f.exists()){
                limpaPastaTemp(f);
            }
            
            String filePath = null;

            filePath = "/tmp";

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(4096);
            factory.setRepository(new File("/tmp"));
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(20556868);

            List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
            Iterator<FileItem> iter = items.iterator();
            boolean fora = true;
            do {
                FileItem item = iter.next();
                type_request = item.getString();
                switch (type_request) {
                    case "cadastrar_rota":
                        cadastrarRota(id_user, iter, item, filePath, response);
                        fora = false;
                        break;
                    case "cadastro-mosaico":
                        gerarMosaico(id_user, iter, item, filePath, response);
                        fora = true;
                        break;
                    case "upload_linha_cultivo":
                        uploadMosaico(id_user, iter, item, filePath, response);
                        break;
                    default:
                        break;
                }
            } while (iter.hasNext() && fora);
        }
        // Retorna resposta para o Ajax caso nao ache funcao para executar requisição
        String json = "{\"status\": \"4044\", \"message\": \"Operacao nao existente ou requisicao invalida para url especificada.\"}";
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();

    }

    private void cadastrarRota(int id_user, Iterator<FileItem> iter, FileItem item, String filePath, HttpServletResponse response) throws ServletException, IOException, FileUploadException, SQLException, Exception {

        String name_rota = "";
        Rota rota = new Rota(name_rota, id_user);
        Logidrone logidrone = new Logidrone();

        while (iter.hasNext()) {
            item = iter.next();
            // Process a regular form field
            if (item.isFormField()) {
                //String name =  item.getFieldName();
                String valueNameRota = item.getString();

                rota.setName_routeidrone(valueNameRota); // Aqui peguei o nome da Rota
                rota.cadastroRota(id_user); // Insere a Rota

            }
            // Process a file upload
            if (!item.isFormField()) {
                String fileName = item.getName();
                item.write(new File(filePath, fileName));
                logidrone.gravaCSV(filePath + "/" + fileName, id_user);
            }
        }

        String json = "{\"status\": \"2000\", \"message\": \"Rota Cadastrada.\", \"tipoRequisicao\": \"cadastrar_rota\"}";
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();

    }

    private void plotarRota(String route_id, int id_user, HttpServletResponse response) throws SQLException, IOException {
        Logidrone logidrone = new Logidrone();
        ArrayList<List<String>> dados = logidrone.getRota(route_id, id_user);

        String json = "{\"pontosLat\": [";

        List<String> lat = dados.get(0);
        int j = 0;
        for (j = 0; j < lat.size() - 1; j++) {
            json += lat.get(j) + ", ";
        }

        json += lat.get(j) + "]";
        json += ",\"pontosLong\": [";

        List<String> longui = dados.get(0);
        for (j = 0; j < longui.size() - 1; j++) {
            json += longui.get(j) + ", ";
        }
        json += longui.get(j) + "]}";


        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void gerarMosaico(int id_user, Iterator<FileItem> iter, FileItem item, String filePath, HttpServletResponse response) throws ServletException, IOException, FileUploadException, SQLException, Exception {


        String ABSOLUTE_PATH = System.getProperty("user.home") + "/tempOD/";
        String PATH_IMG_RESULT = System.getProperty("user.home") + "/od_images_mosaico/"+id_user+"/";
        
        // Criar pasta temporaria se nao existir
        File nomePastaTemp = new File(ABSOLUTE_PATH);
        if (!nomePastaTemp.exists()) {
            nomePastaTemp.mkdir();
        }
        // Cria pasta temporaria do usuario; 
        ABSOLUTE_PATH += id_user+"/";
        File nomePastaTempUser = new File(ABSOLUTE_PATH);
        if (!nomePastaTempUser.exists()) {
            nomePastaTempUser.mkdir();
        }

        
        
        Mosaico mosaico = new Mosaico();
        mosaico.setUser_id_user(id_user);


        mosaico.setImg_mosaico(PATH_IMG_RESULT);

        while (iter.hasNext()) {
            item = iter.next();
            // Process a regular form field
            if (item.isFormField()) {
                String valueNameMosaico = item.getString();
                mosaico.setName_mosaico(valueNameMosaico+".png");
            }
            // Process a file upload
            if (!item.isFormField()) {
                String fileName = item.getName();
                item.write(new File(filePath, fileName));

                // Aqui precisa descompactar
                Unzip_File_Folder unzip = new Unzip_File_Folder(filePath + "/" + fileName, ABSOLUTE_PATH);

            }
        }
        boolean statusMosaico = false;
        mosaico.exec(filePath);
        if (mosaico.isMosaicGerated()) {
            statusMosaico = mosaico.mosaico(id_user);
        }



        PrintWriter out = response.getWriter();
        String json;
        if (statusMosaico) {
            json = "{\"status\": \"2000\", \"message\": \"Mosaico gerado.\", \"tipoRequisicao\": \"cadastro-mosaico\", \"name_mosaico\": \""+mosaico.getName_mosaico()+"\"}";
        } else {
            json = "{\"status\": \"5000\", \"message\": \"Erro ao gerar mosaico.\", \"tipoRequisicao\": \"cadastro-mosaico\"}";
        }

        out.print(json);
        out.close();
    }

    private void validarNome(String name, String objname, int id_user, HttpServletResponse response) throws SQLException, IOException {
        boolean isValid = false;

        switch (objname) {
            case "rota":
                Rota rota = new Rota();
                rota.setUser_id_user(id_user);
                isValid = rota.validarNome(name);
                break;
            case "mosaico":
                Mosaico mosaico = new Mosaico();
                mosaico.setUser_id_user(id_user);
                isValid = mosaico.validarNome(name);
                break;
        }

        String json;
        System.out.println(name);
        if (isValid) {
            json = "{\"status\": \"2000\", \"message\": \"Nome válido.\", \"isValid\": true}";
        } else {
            json = "{\"status\": \"2000\", \"message\": \"Nome inválido.\", \"isValid\": false}";
        }
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    private void gerarLinhaCultivo(String id_mosaico, int id_user, HttpServletResponse response) throws IOException, InterruptedException, SQLException {
        Mosaico mosaico = new Mosaico();
        mosaico.setUser_id_user(id_user);
        mosaico.carregarMosaico(id_mosaico);
        String url_img = mosaico.getImg_mosaico() + mosaico.getName_mosaico();

        String PATH_IMG_RESULT = System.getProperty("user.home") + "/od_images_linhacultivo/"+id_user+"/";

        Linhacultivo lc = new Linhacultivo();
        lc.setName_linhacultivo(mosaico.getName_mosaico());
        lc.setUser_id_user(id_user);
        lc.setId_mosaico(mosaico.getId_mosaico());
        PrintWriter out = response.getWriter();
        String json;
        if (lc.exits()) {
            String path_name_linhacultivo = id_user+ "/" + lc.getName_linhacultivo();
            int qtd_arbole = lc.getQtd_arbole();
            json = "{\"status\": \"2000\", \"message\": \"Linha de cultivo ja existente para o mosaico selecionado. Carregando...\", \"tipoRequisicao\": \"gerar_linha_cultivo\", \"qtd_arbole\": " + qtd_arbole + ", \"path_name_linhacultivo\": \"" + path_name_linhacultivo + "\"}";
        } else {
            lc.setImg_linhacultivo(PATH_IMG_RESULT);
            lc.exec(url_img);

            boolean statusLinhacultivo = false;

            if (lc.isLinhaGerated()) {
                statusLinhacultivo = lc.salvarLinhaCultivo();
            }

            if (statusLinhacultivo) {
                String path_name_linhacultivo = id_user+ "/" + lc.getName_linhacultivo();
                int qtd_arbole = lc.getQtd_arbole();
                json = "{\"status\": \"2000\", \"message\": \"Linha de cultivo gerada. Carregando...\", \"tipoRequisicao\": \"gerar_linha_cultivo\", \"qtd_arbole\": " + qtd_arbole + ", \"path_name_linhacultivo\": \"" + path_name_linhacultivo + "\"}";
            } else {
                json = "{\"status\": \"5000\", \"message\": \"Erro ao gerar linha de cultivo.\", \"tipoRequisicao\": \"gerar_linha_cultivo\"}";
            }
        }
        out.print(json);
        out.close();
    }

    private void uploadMosaico(int id_user, Iterator<FileItem> iter, FileItem item, String filePath, HttpServletResponse response) throws ServletException, IOException, FileUploadException, SQLException, Exception {


        String ABSOLUTE_PATH = System.getProperty("user.home") + "/tempOD/";
        String PATH_IMG_RESULT = System.getProperty("user.home") + "/od_images_mosaico/";
        
        
        File FABSOLUTE_PATH_Geral = new File(ABSOLUTE_PATH);
        if (!FABSOLUTE_PATH_Geral.exists()) {
            FABSOLUTE_PATH_Geral.mkdir();
        }

        ABSOLUTE_PATH += id_user+"/";
        File FABSOLUTE_PATH = new File(PATH_IMG_RESULT);
        if (!FABSOLUTE_PATH.exists()) {
            FABSOLUTE_PATH.mkdir();
        }
        
        File FPATH_IMG_RESULT_Geral = new File(PATH_IMG_RESULT);
        if (!FPATH_IMG_RESULT_Geral.exists()) {
            FPATH_IMG_RESULT_Geral.mkdir();
        }

        PATH_IMG_RESULT += id_user+"/";
        File FPATH_IMG_RESULT = new File(PATH_IMG_RESULT);
        if (!FPATH_IMG_RESULT.exists()) {
            FPATH_IMG_RESULT.mkdir();
        }

        Mosaico mosaico = new Mosaico();
        mosaico.setUser_id_user(id_user);

        mosaico.setImg_mosaico(PATH_IMG_RESULT);
        String fileName = "";
        String valueNameMosaico = "";
        while (iter.hasNext()) {
            item = iter.next();
            // Process a regular form field
            if (item.isFormField()) {
                valueNameMosaico = item.getString();
                mosaico.setName_mosaico(valueNameMosaico);
            }
            // Process a file upload
            if (!item.isFormField()) {
                fileName = item.getName();
                mosaico.setName_mosaico(fileName);
                item.write(new File(filePath, fileName));
               // System.out.println("File name>>> " + fileName);
                //Não é necessario compactar

            }
        }
        boolean statusMosaico = false;

        //Somente para uploads com imagens no formato .jpg
        mosaico.saveOneMosaicoLoaded(new File(filePath + "/" + fileName), new File(PATH_IMG_RESULT + "/" + mosaico.getName_mosaico()));
        mosaico.setMosaicGerated(true);
        if (mosaico.isMosaicGerated()) {
            statusMosaico = mosaico.mosaico(id_user);
        }

        //System.out.println("===>Fim do upload do mosaico <===");

        PrintWriter out = response.getWriter();
        String json;
        if (statusMosaico) {
            json = "{\"status\": \"2000\", \"message\": \"Mosaico enviado com sucesso.\", \"tipoRequisicao\": \"upload_linha_cultivo\", \"id_mosaico\": " + mosaico.getId_mosaico() + "}";
        } else {
            json = "{\"status\": \"5000\", \"message\": \"Erro ao enviar mosaico.\", \"tipoRequisicao\": \"upload_linha_cultivo\"}";
        }

        out.print(json);
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
            Logger.getLogger(AjaxRequest.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AjaxRequest.class.getName()).log(Level.SEVERE, null, ex);
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
