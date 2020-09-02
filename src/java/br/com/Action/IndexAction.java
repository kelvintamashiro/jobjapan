/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.PessoaFisica;
import br.com.Form.LoginForm;
import br.com.Form.PessoaFisicaForm;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class IndexAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("redirecionarAcesso")) {
            this.redirecionarAcesso(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        LoginForm loginForm = new LoginForm();
        request.setAttribute("LoginForm", loginForm);
    }

    private void redirecionarAcesso(ActionForm form, HttpServletRequest request, Errors errors) {
        Connection conn = null;
        HttpSession session = request.getSession(true);
        try {
            conn = connectionPool.getConnection();
            String login = request.getParameter("login");
            String tipoPerfil = request.getParameter("tipoPerfil");

            //obter dados pessoa_fisica pelo login
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            pfForm = PessoaFisica.getInstance().obterDadosPessoaFisicaPorLogin(conn, login);

            switch (tipoPerfil) {
                case "candidato":
                    System.out.println("Perfil de Candidato");
                    break;
                case "adm":
                    System.out.println("Perfil de Adm");
                    break;
                default:
                    break;
            }

            session.setAttribute("nome", pfForm.getNome());
            session.setAttribute("tipoPerfil", tipoPerfil);
            session.setAttribute("login", login);
            session.setAttribute("idPF", pfForm.getIdPF());
            request.setAttribute("PessoaFisicaForm", pfForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
    }

}
