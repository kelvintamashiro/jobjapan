/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Action;

import br.com.Dao.PessoaFisica;
import br.com.Form.PessoaFisicaForm;
import br.com.Util.EnvioEmail;
import br.com.Util.GeradorSenha;
import br.com.abre.Util.Errors;
import java.sql.Connection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author macuser
 */
public class PessoaFisicaAction extends IDRAction {

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, Errors errors, String action) {
        String forward = action;
        if (action.equals("page")) {
            this.page(form, request, errors);
        } else if (action.equals("salvar")) {
            this.salvar(form, request, errors);
        } else if (action.equals("pageAtualizarCadastro")) {
            this.pageAtualizarCadastro(form, request, errors);
        } else if (action.equals("atualizar")) {
            this.atualizar(form, request, errors);
        } else if (action.equals("pageConsultar")) {
            this.page(form, request, errors);
        } else if (action.equals("consultar")) {
            this.consultar(form, request, errors);
        }

        return mapping.findForward(forward);
    }

    private void page(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm pessoaFisicaForm = new PessoaFisicaForm();
        request.setAttribute("PessoaFisicaForm", pessoaFisicaForm);
    }

    private void salvar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm pessoaFisicaForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //gerar senha randomica
//            GeradorSenha geradorSenha = new GeradorSenha();
//            String senha = geradorSenha.gerarSenha(5);
//            pessoaFisicaForm.setPassword(senha);
            //verificar se ja existe esse e-mail cadastrado para algum usuario
            boolean isExisteEmail = PessoaFisica.getInstance().verificarEmailCadastrado(conn, pessoaFisicaForm.getEmail());
            if (isExisteEmail) {
                errors.error("Esse E-MAIL já se encontra cadastrado na base de dados!! Favor verificar");
            } else {

                //salvar no banco de dados pessoa_fisica
                PessoaFisica.getInstance().salvar(conn, pessoaFisicaForm, "candidato");

                //enviar a senha por email
                this.enviarEmailAcessoPessoaFisica(pessoaFisicaForm);

                errors.error("CADASTRO REALIZADO COM SUCESSO!!");
                pessoaFisicaForm = new PessoaFisicaForm();
                request.setAttribute("PessoaFisicaForm", pessoaFisicaForm);
            }

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("ERRO NO CADASTRO!!");
        } finally {
            connectionPool.free(conn);
        }

    }

    private void enviarEmailAcessoPessoaFisica(PessoaFisicaForm pessoaFisicaForm) {
        try {
            StringBuilder sb = new StringBuilder();

            sb.append("Olá ").append(pessoaFisicaForm.getNome());
            sb.append("<br/><br/>");
            sb.append("<b>Seja bem vindo ao Portal JobJapanOnline</b>");
            sb.append("<br/>");
            sb.append("Nessa área você poderá acessar para consultar vagas e manter seu currículo sempre atualizado. ");
            sb.append("<br/>");
            sb.append("Segue os dados de acesso: ");
            sb.append("<br/><br/>");
            sb.append("Site: www.jobjapanonline.com");
            sb.append("<br/>");
            sb.append("Login: ").append(pessoaFisicaForm.getEmail());
            sb.append("<br/>");
            sb.append("Senha: ").append(pessoaFisicaForm.getPassword());
            sb.append("<br/>");
            sb.append("<br/>");
            sb.append("Atenciosamente,");
            sb.append("<br/>");
            sb.append("JOB JAPAN ONLINE");

            EnvioEmail envio = new EnvioEmail();
            envio.enviarEmail("kelvin@mitsistemas.com.br", sb.toString(), "Dados de Acesso ao Portal JobJapanOnline");
//            envio.enviarEmail(pessoaFisicaForm.getEmail(), sb.toString(), "Dados de Acesso ao Portal Nikken");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void pageAtualizarCadastro(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm pessoaFisicaForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter dados da pessoa por ID
            pessoaFisicaForm = PessoaFisica.getInstance().obterDadosPessoaFisicaPorID(conn, pessoaFisicaForm.getIdPF());
            request.setAttribute("PessoaFisicaForm", pessoaFisicaForm);

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("ERRO NO CADASTRO!!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void atualizar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm pessoaFisicaForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //verificar se ja existe esse e-mail cadastrado para algum usuario
            boolean isExisteEmail = PessoaFisica.getInstance().verificarEmailCadastrado2vezes(conn, pessoaFisicaForm.getEmail());
            if (isExisteEmail) {
                errors.error("Esse E-MAIL já se encontra cadastrado na base de dados!! Favor verificar");
            } else {
                //salvar no banco de dados pessoa_fisica
                PessoaFisica.getInstance().atualizar(conn, pessoaFisicaForm);

                errors.error("CADASTRO ATUALIZADO COM SUCESSO!!");
                request.setAttribute("PessoaFisicaForm", pessoaFisicaForm);
            }

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("ERRO NO CADASTRO!!");
        } finally {
            connectionPool.free(conn);
        }
    }

    private void consultar(ActionForm form, HttpServletRequest request, Errors errors) {
        PessoaFisicaForm pessoaFisicaForm = (PessoaFisicaForm) form;
        Connection conn = null;
        try {
            conn = connectionPool.getConnection();

            //obter dados da pessoa pelos parametros de pesquisa
            List<PessoaFisicaForm> listaCandidato = PessoaFisica.getInstance().consultarCandidato(conn, pessoaFisicaForm);
            request.setAttribute("listaCandidato", listaCandidato);
            
            request.setAttribute("PessoaFisicaForm", pessoaFisicaForm);

        } catch (Exception e) {
            e.printStackTrace();
            errors.error("ERRO NO CADASTRO!!");
        } finally {
            connectionPool.free(conn);
        }
    }

}
