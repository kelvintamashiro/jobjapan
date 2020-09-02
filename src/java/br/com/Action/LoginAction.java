/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Form.LoginForm;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class LoginAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            return validar(mapping, form, request, errors);
        } else if (action.equals("pageEsqueceuSenha")) {
            this.pageEsqueceuSenha(form, request, errors);
        } 

        return mapping.findForward(forward);
    }

    private ActionForward validar(ActionMapping mapping, ActionForm form, HttpServletRequest request, Errors errors) {
        LoginForm loginForm = (LoginForm) form;
        Connection conn = null;
        String strForward = "";
        try {
            conn = connectionPool.getConnection();

            //verificar se o login tem acesso e se esta correto
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String tipoPerfil = request.getParameter("tipoPerfil");

            boolean isLogin = loginForm.verificarLogin(conn, login, password, tipoPerfil);

            if (isLogin) {
                System.out.println("Login OK");

                loginForm.setLogin(login);
                loginForm.setTipoPerfil(tipoPerfil);

                if (tipoPerfil.equals("candidato")) {
                    strForward = "frwCandidato";
                } else if (tipoPerfil.equals("adm")) {
                    strForward = "frwAdm";
                } 

            } else {
                System.out.println("erro de login e/ou senha");
                request.setAttribute("erroLogin", "true");
                strForward = "frwErroLogin";
            }

            request.setAttribute("LoginForm", loginForm);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            connectionPool.free(conn);
        }
        return mapping.findForward(strForward);
    }

    private void pageEsqueceuSenha(ActionForm form, HttpServletRequest request, Errors errors) {
        LoginForm loginForm = new LoginForm();
        try {
            request.setAttribute("LoginForm", loginForm);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
