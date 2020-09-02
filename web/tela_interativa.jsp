<%-- 
    Document   : tela_interativa
    Created on : 24/02/2020, 20:47:19
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html lang="pt-br" class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JOB JAPAN ONLINE - Painel</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <!--<link rel="stylesheet" media="all" type="text/css" href="assets/css/reset.css" />-->
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style_original.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/mobile.css" />

        <style>
            body {
                margin:0;
                padding:0;
            }

        </style>
    </head>
    <body>
        <jsp:include page="topo.jsp"/>

        <logic:equal name="tipoPerfil" scope="session" value="candidato">
            <div class="row" align="center" style="padding-top: 50px">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'PessoaFisica.do?action=pageAtualizarCadastro&idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Editar <br/>Cadastro
                    </button>                  
                    <button class="btn-nikken" onclick="javascript:fBreve()">
                        Enviar <br/> Documentos
                    </button>
                    <button class="btn-nikken" onclick="window.open('https://jobjapanonline.com/jobs/')">
                        Verificar <br/>Vagas
                    </button>
                    <button class="btn-nikken" onclick="window.open('https://jobjapanonline.com/contato/')">
                        Entrar <br/> em Contato
                    </button>
                </div>
            </div>
        </logic:equal>

        <logic:equal name="tipoPerfil" scope="session" value="adm">
            <div class="row" align="center" style="padding-top: 50px">
                <div class="col-12 col-s-12">
                    <button class="btn-nikken" onclick="window.location.href = 'PessoaFisica.do?action=pageAtualizarCadastro&idPF=<%=session.getAttribute("idPF").toString()%>'">
                        Editar <br/>Cadastro
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = 'PessoaFisica.do?action=pageConsultar'">
                        Consultar <br/>Candidatos
                    </button>
                    <button class="btn-nikken" onclick="window.location.href = '#'">
                        Relatórios <br/> JobJapan
                    </button>
                </div>

            </div>
        </logic:equal>


        <div>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
<script language="javascript">
    function fBreve() {
        alert("Em Breve!!");
//        window.open("Comunicados.do?action=visualizar&idComunicado=" + idComunicado, "", "width=800,height=600,left=" + (document.documentElement.clientWidth - 800) / 2 + ",top=" + (document.documentElement.clientHeight - 600) / 2);
    }
</script>
