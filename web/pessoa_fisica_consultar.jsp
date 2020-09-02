<%-- 
    Document   : pessoa_fisica_consultar
    Created on : 01/09/2020, 19:32:41
    Author     : macuser
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html>
<html class="js-disabled">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Escola Nikken - Painel</title>
        <link rel="shortcut icon" href="imagens/favico.png" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <script language="javascript1.2" src="js/mizanscene.js"></script>
        <script type="text/javascript" src="js/JQuery/js/jquery-1.3.2.js"></script>

        <link rel="stylesheet" media="all" type="text/css" href="assets/css/fix.css" />
        <link rel="stylesheet" media="all" type="text/css" href="assets/css/style.css" />
        <style>
            body {
                margin:0;
                padding:0;
            }
        </style>
    </head>
    <body style="padding-bottom: 150px">
        <logic:present name="errors">
            <script>
                alert('<bean:write name="errors"/>');
            </script>
        </logic:present>
        <html:form action="PessoaFisica" name="PessoaFisicaForm" type="br.com.Form.PessoaFisicaForm" scope="request">
            <jsp:include page="topo.jsp"/>

            <table border="0" align="center" style="margin-top: 20px; background-color: #ADD8E6" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        <a href="tela_interativa.jsp"><img src="imagens/bt_voltar_2.png" width="100px"/></a>
                    </td>
                    <td width="80%" align="center">
                        <h1>Consulta de Candidato</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="50%" class="table-condensed">
                    <tr>
                        <td width="20%" align="right">Nome:</td>
                        <td width="60%" colspan="3">
                            <html:text styleClass="form-control" name="PessoaFisicaForm" property="nome" styleId="nome"/>
                        </td>
                        <td width="20%">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Sexo:</td>
                        <td colspan="3">
                            <html:select name="PessoaFisicaForm" property="sexo" styleId="sexo" styleClass="form-control">
                                <html:option value="ambos">Ambos</html:option>
                                <html:option value="masculino">Masculino</html:option>
                                <html:option value="feminino">Feminino</html:option>
                            </html:select>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Província:</td>
                        <td colspan="3">
                            <html:select name="PessoaFisicaForm" property="provincia" styleId="provincia" styleClass="form-control">
                                <html:option value="">Selecione</html:option>
                                <html:option value="AICHI">AICHI</html:option>
                                <html:option value="AKITA">AKITA</html:option>
                                <html:option value="AOMORI">AOMORI</html:option>
                                <html:option value="CHIBA">CHIBA</html:option>
                                <html:option value="EHIME">EHIME</html:option>
                                <html:option value="FUKUI">FUKUI</html:option>
                                <html:option value="FUKUOKA">FUKUOKA</html:option>
                                <html:option value="FUKUSHIMA">FUKUSHIMA</html:option>
                                <html:option value="GIFU">GIFU</html:option>
                                <html:option value="GUNMA">GUNMA</html:option>
                                <html:option value="HIROSHIMA">HIROSHIMA</html:option>
                                <html:option value="HOKKAIDO">HOKKAIDO</html:option>
                                <html:option value="HYOGO">HYOGO</html:option>
                                <html:option value="IBARAKI">IBARAKI</html:option>
                                <html:option value="ISHIKAWA">ISHIKAWA</html:option>
                                <html:option value="IWATE">IWATE</html:option>
                                <html:option value="KAGAWA">KAGAWA</html:option>
                                <html:option value="KAGOSHIMA">KAGOSHIMA</html:option>
                                <html:option value="KANAGAWA">KANAGAWA</html:option>
                                <html:option value="KOCHI">KOCHI</html:option>
                                <html:option value="KUMAMOTO">KUMAMOTO</html:option>
                                <html:option value="KYOTO">KYOTO</html:option>
                                <html:option value="MIE">MIE</html:option>
                                <html:option value="MIYAGI">MIYAGI</html:option>
                                <html:option value="MIYAZAKI">MIYAZAKI</html:option>
                                <html:option value="NAGANO">NAGANO</html:option>
                                <html:option value="NAGASAKI">NAGASAKI</html:option>
                                <html:option value="NARA">NARA</html:option>
                                <html:option value="NIIGATA">NIIGATA</html:option>
                                <html:option value="OITA">OITA</html:option>
                                <html:option value="OKAYAMA">OKAYAMA</html:option>
                                <html:option value="OKINAWA">OKINAWA</html:option>
                                <html:option value="OSAKA">OSAKA</html:option>
                                <html:option value="SAGA">SAGA</html:option>
                                <html:option value="SAITAMA">SAITAMA</html:option>
                                <html:option value="SHIGA">SHIGA</html:option>
                                <html:option value="SHIMANE">SHIMANE</html:option>
                                <html:option value="SHIZUOKA">SHIZUOKA</html:option>
                                <html:option value="TOCHIGI">TOCHIGI</html:option>
                                <html:option value="TOKUSHIMA">TOKUSHIMA</html:option>
                                <html:option value="TÓQUIO">TÓQUIO</html:option>
                                <html:option value="TOTTORI">TOTTORI</html:option>
                                <html:option value="TOYAMA">TOYAMA</html:option>
                                <html:option value="WAKAYAMA">WAKAYAMA</html:option>
                                <html:option value="YAMAGATA">YAMAGATA</html:option>
                                <html:option value="YAMAGUCHI">YAMAGUCHI</html:option>
                                <html:option value="YAMANASHI">YAMANASHI</html:option>
                            </html:select>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Nível Japonês:</td>
                        <td colspan="3">
                            <html:select name="PessoaFisicaForm" property="nivelJapones" styleId="nivelJapones" styleClass="form-control">
                                <html:option value="">Selecione</html:option>
                                <html:option value="nenhum">Nenhum</html:option>
                                <html:option value="basico">Básico</html:option>
                                <html:option value="intermediario">Intermediário</html:option>
                                <html:option value="avancado">Avançado</html:option>
                                <html:option value="fluente">Fluente</html:option>
                            </html:select>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Idade:</td>
                        <td>
                            <html:text styleClass="form-control" name="PessoaFisicaForm" property="idadeInicio" styleId="idadeInicio"/>
                        </td>
                        <td>
                            à
                        </td>
                        <td>
                            <html:text styleClass="form-control" name="PessoaFisicaForm" property="idadeFim" styleId="idadeFim"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">Palavra Chave:</td>
                        <td colspan="3">
                            <html:text styleClass="form-control" name="PessoaFisicaForm" property="palavraChave" styleId="palavraChave"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="3" align="center">
                            <input class="btn btn-green" type="button" value="Consultar" onClick="fConsultar();">
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>

            <logic:present name="listaCandidato" scope="request">
                <div class="form-group">
                    <table border="0" class="table" align="center" style="margin-top: 20px;" width="90%">
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td><b>ID</b></td>
                            <td><b>Nome</b></td>
                            <td><b>Sexo</b></td>
                            <td><b>Província/Cidade</b></td>
                            <td><b>Nível Japonês</b></td>
                            <td><b>Idade</b></td>
                            <td><b>Telefone</b></td>
                            <td><b>Data Atualização</b></td>
                            <td>&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                        </tr>
                        <logic:iterate name="listaCandidato" id="lista" scope="request">
                            <tr>
                                <td width="5%" align="center"></td>
                                <td><bean:write name="lista" property="idPF"/></td>
                                <td><bean:write name="lista" property="nome"/></td>
                                <td><bean:write name="lista" property="sexo"/></td>
                                <td><bean:write name="lista" property="provincia"/> - <bean:write name="lista" property="cidade"/></td>
                                <td><bean:write name="lista" property="nivelJapones"/></td>
                                <td><bean:write name="lista" property="idade"/></td>
                                <td><bean:write name="lista" property="telefone"/></td>
                                <td><bean:write name="lista" property="dataAtualizacao"/></td>

                                <td>
                                    <input class="btn btn-info" type="button" value="Editar" onClick="fAtualizar(<bean:write name="lista" property="idPF"/>);">    
                                </td>
                                <td width="5%">&nbsp;</td>
                            </tr>
                        </logic:iterate>
                    </table>
                </div>
                <br/><br/><br/><br/>
            </logic:present>

        </html:form>
    </body>
</html>
<script language="javascript">

    function fConsultar() {
        document.PessoaFisicaForm.action = "PessoaFisica.do?action=consultar";
        document.PessoaFisicaForm.submit();
    }

    function fAtualizar(idPF) {
        document.PessoaFisicaForm.action = "PessoaFisica.do?action=pageAtualizarCadastro&idPF=" + idPF;
        document.PessoaFisicaForm.submit();
    }
</script>




