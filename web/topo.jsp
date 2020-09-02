<head>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>

<table width="90%" align="center">
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td width="25%">
            <a href="tela_interativa.jsp">
                <img src="imagens/logo_jobjapanonline.png" width="100%"/>
            </a>
        </td>
        <td align="center" width="50%">
            Bem vindo ao Portal Nikken, 
            <strong> 
                <%if (session.getAttribute("nome") != null) {%>
                <%=session.getAttribute("nome").toString()%>
                <%}%>
            </strong>
        </td>
        <td width="25%" align="right">
            <!--            <button class="btn btn-big btn-grey" onclick="window.location.href = 'AlterarSenha.do'">
                            Alterar Senha
                        </button>-->
            <a href="AlterarSenha.do" class="btn btn-default">Alterar Senha</a>
            <a href="desconectar.jsp" class="btn btn-danger">Deslogar</a>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="border-bottom: 0px solid #CCCCCC;">&nbsp;</td>
    </tr>
</table>