<%-- 
    Document   : pessoa_fisica
    Created on : 29/07/2020, 22:11:35
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
        <title>Job Japan Online - Cadastro</title>
        <link rel="shortcut icon" href="imagens/favico.png">
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
            <%--<jsp:include page="topo.jsp"/>--%>

            <table width="80%" align="center">
                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td width="30%">
                        <a href="index.jsp">
                            <img src="imagens/logo_jobjapanonline.png" width="100%"/>
                        </a>
                    </td>
                    <td width="70%" align="right">
                        Bem vindo ao Portal JobJapanOnline 

                    </td>
                </tr>

            </table>

            <table border="0" align="center" style="margin-top: 20px; background-color: #8B1A1A" width="100%">
                <tr>
                    <td width="10%" style="padding-left: 50px">
                        &nbsp;
                        <a href="index.jsp" class="btn btn-default">Voltar</a>
                    </td>
                    <td width="80%" align="center">
                        <h1 style="color: white">Cadastro de Candidato</h1>
                    </td>
                    <td width="10%">&nbsp;</td>
                </tr>
            </table>
            <div class="form-group">
                <table border="0" align="center" style="margin-top: 20px;" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="3">
                            <b>Dados Básico</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nome:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="nome" styleId="nome"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Sexo:</label>
                                <html:select name="PessoaFisicaForm" property="sexo" styleId="sexo" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="masculino">Masculino</html:option>
                                    <html:option value="feminino">Feminino</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Data de Nascimento:</label>
                                <html:text name="PessoaFisicaForm" property="dataNascimento" styleId="dataNascimento" styleClass="form-control" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataNascimento')" onblur="hide('dataNascimento')"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">E-mail:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="email" styleId="email"/>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Senha:</label>
                                <html:password styleClass="form-control" name="PessoaFisicaForm" property="password" styleId="password"/>
                            </div>
                        </td>

                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Telefone:</label>
                                <html:text name="PessoaFisicaForm" property="telefone" styleId="telefone" styleClass="form-control"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Estado Civil:</label>
                                <html:select name="PessoaFisicaForm" property="estadoCivil" styleId="estadoCivil" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="casado">Casado(a)</html:option>
                                    <html:option value="solteiro">Solteiro(a)</html:option>
                                    <html:option value="mora_junto">Mora Junto</html:option>
                                    <html:option value="divorciado">Divorciado</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Licença de Habilitação:</label>
                                <html:select name="PessoaFisicaForm" property="habilitacao" styleId="habilitacao" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="carro">Carro</html:option>
                                    <html:option value="lift">Lift</html:option>
                                    <html:option value="caminhao">Caminhão</html:option>
                                    <html:option value="outros">Outros</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Visto:</label>
                                <html:select name="PessoaFisicaForm" property="visto" styleId="visto" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="dupla_nacionalidade">Dupla Nacionalidade</html:option>
                                    <html:option value="nissei">Nissei</html:option>
                                    <html:option value="sansei">Sansei</html:option>
                                    <html:option value="yonsei">Yonsei</html:option>
                                    <html:option value="sem_descendencia">Sem Descendência</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Data Entrada no Japão:</label>
                                <html:text name="PessoaFisicaForm" property="dataEntradaJapao" styleId="dataEntradaJapao" styleClass="form-control" size="15" maxlength="10" onkeyup="formatarData(this);" onkeypress="return(validarConteudo(event, 'numero'))" onfocus="show('dataEntradaJapao')" onblur="hide('dataEntradaJapao')"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Pretende ficar quantos anos:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="anosFicarJapao" styleId="anosFicarJapao"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>


            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="4">
                            <b>Entendimento da Língua Japonesa/Inglês</b>
                            (até 30% básico - 31% à 60% intermediário - 61% à 80% Avançado - Acima de 80% Fluente)
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nível Japonês</label>
                                <html:select name="PessoaFisicaForm" property="nivelJapones" styleId="nivelJapones" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="nenhum">Nenhum</html:option>
                                    <html:option value="basico">Básico</html:option>
                                    <html:option value="intermediario">Intermediário</html:option>
                                    <html:option value="avancado">Avançado</html:option>
                                    <html:option value="fluente">Fluente</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Nível Inglês</label>
                                <html:select name="PessoaFisicaForm" property="nivelIngles" styleId="nivelIngles" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="nenhum">Nenhum</html:option>
                                    <html:option value="basico">Básico</html:option>
                                    <html:option value="intermediario">Intermediário</html:option>
                                    <html:option value="avancado">Avançado</html:option>
                                    <html:option value="fluente">Fluente</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="3">
                            <b>Dados Endereço</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="50%">
                            <div class="col-lg-12">
                                <label for="usr">Endereço:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="dsEndereco" styleId="dsEndereco"/>
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Província:</label>
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
                            </div>
                        </td>
                        <td width="25%">
                            <div class="col-lg-12">
                                <label for="usr">Cidade:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="cidade" styleId="cidade"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>



            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="3">
                            <b>Dados Escolaridade</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Nível Escolaridade:</label>
                                <html:select name="PessoaFisicaForm" property="escolaridade" styleId="escolaridade" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="ensino_fundamental">Ensino Fundamental</html:option>
                                    <html:option value="ensino_medio">Ensino Médio</html:option>
                                    <html:option value="ensino_superior">Ensino Superior</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Curso Superior:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="cursoEscolaridade" styleId="cursoEscolaridade"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Profissão no Brasil:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="profissaoBrasil" styleId="profissaoBrasil"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>


            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="4">
                            <b>Dados Corporal</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Peso:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="peso" styleId="peso"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Tamanho Sapato:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="tamanhoSapato" styleId="tamanhoSapato"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Tamanho Uniforme:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="tamanhoUniforme" styleId="tamanhoUniforme"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Altura:</label>
                                <html:text styleClass="form-control" name="PessoaFisicaForm" property="altura" styleId="altura"/>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Tipo Sanguíneo:</label>
                                <html:select name="PessoaFisicaForm" property="tipoSanguineo" styleId="tipoSanguineo" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="A+">Sangue A+</html:option>
                                    <html:option value="A-">Sangue A-</html:option>
                                    <html:option value="B+">Sangue B+</html:option>
                                    <html:option value="B-">Sangue B-</html:option>
                                    <html:option value="AB+">Sangue AB+</html:option>
                                    <html:option value="AB-">Sangue AB-</html:option>
                                    <html:option value="O+">Sangue O+</html:option>
                                    <html:option value="O-">Sangue O-</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="33%">
                            <div class="col-lg-12">
                                <label for="usr">Usa Óculos:</label>
                                <html:select name="PessoaFisicaForm" property="usaOculos" styleId="usaOculos" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>



            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="5">
                            <b>Verificação de Disponibilidade</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Zangyo:</label>
                                <html:select name="PessoaFisicaForm" property="trabalharZangyo" styleId="trabalharZangyo" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Yakin:</label>
                                <html:select name="PessoaFisicaForm" property="trabalharYakin" styleId="trabalharYakin" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Trabalhar no Feriado:</label>
                                <html:select name="PessoaFisicaForm" property="trabalharFeriado" styleId="trabalharFeriado" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Turnos Alternados:</label>
                                <html:select name="PessoaFisicaForm" property="trabalharNikoutai" styleId="trabalharNikoutai" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                        <td width="20%">
                            <div class="col-lg-12">
                                <label for="usr">Folgas Alternados:</label>
                                <html:select name="PessoaFisicaForm" property="folgasAlternadas" styleId="folgasAlternadas" styleClass="form-control">
                                    <html:option value="">Selecione</html:option>
                                    <html:option value="S">SIM</html:option>
                                    <html:option value="N">NÃO</html:option>
                                </html:select>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="5">
                            <b>Histório de Trabalho</b> (Você pode informar todos os lugares no qual você trabalhou)
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <html:textarea name="PessoaFisicaForm" property="historicoTrabalho" styleClass="form-control" rows="7">
                                </html:textarea>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>           
            <div class="form-group">
                <table border="0" align="center" width="80%" class="table-condensed">
                    <tr style="background-color: #F4F4F4; color: #8B1A1A">
                        <td colspan="5">
                            <b>Observação</b> (Informação adicional que queira informar)
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <div class="col-lg-12">
                                <html:textarea name="PessoaFisicaForm" property="descricao" styleClass="form-control" rows="7">
                                </html:textarea>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>           




            <div align="center">
                <br/>
                <br/>
                <input class="btn btn-green" type="button" value="Cadastrar" onClick="fCadastrar();">
            </div>

            <logic:equal name="cadastro" value="true">
                <br/>
                <div class="alert alert-info" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Cadastro Realizado com Sucesso!</b>
                </div>
            </logic:equal>
            <logic:equal name="cadastro" value="false">
                <br/>
                <div class="alert alert-danger alert-dismissible" id="myAlert" style="text-align: center">
                    <a href="#" class="close">&times;</a>
                    <b>Erro no Cadastro. Favor verificar!</b>
                </div>
            </logic:equal>

            <%--<jsp:include page="footer.jsp"/>--%>
        </html:form>
    </body>
</html>
<script language="javascript">
    function fCadastrar() {
        var nome = document.PessoaFisicaForm.nome.value;
        var sexo = document.PessoaFisicaForm.sexo.value;
        var dataNascimento = document.PessoaFisicaForm.dataNascimento.value;
        var email = document.PessoaFisicaForm.email.value;
        var password = document.PessoaFisicaForm.password.value;
        var telefone = document.PessoaFisicaForm.telefone.value;
        var nivelJapones = document.PessoaFisicaForm.nivelJapones.value;
        var provincia = document.PessoaFisicaForm.provincia.value;

        if (nome.length < 2) {
            alert("Deve ser informado o nome do aluno corretamente!");
            document.getElementById('nome').focus();
        } else if (sexo === "") {
            alert("Deve ser informado o sexo corretamente!");
            document.getElementById('sexo').focus();
        } else if (dataNascimento.length < 2) {
            alert("Deve ser informado a data de nascimento corretamente!");
            document.getElementById('dataNascimento').focus();
        } else if (email.length < 2) {
            alert("Deve ser informado o E-mail corretamente!");
            document.getElementById('email').focus();
        } else if (password.length < 2) {
            alert("Deve ser informado a Senha corretamente!");
            document.getElementById('password').focus();
        } else if (telefone.length < 2) {
            alert("Deve ser informado o Telefone corretamente!");
            document.getElementById('telefone').focus();
        } else if (nivelJapones === "") {
            alert("Deve ser informado o Nível de Japonês!");
            document.getElementById('nivelJapones').focus();
        } else if (provincia === "") {
            alert("Deve ser informado a PROVÍNCIA onde mora!");
            document.getElementById('provincia').focus();
        } else {
            document.PessoaFisicaForm.action = "PessoaFisica.do?action=salvar";
            document.PessoaFisicaForm.submit();
        }
    }
</script>


