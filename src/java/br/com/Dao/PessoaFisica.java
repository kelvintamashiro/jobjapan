/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Dao;

import br.com.Form.PessoaFisicaForm;
import br.com.abre.Util.IDRDate;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author macuser
 */
public class PessoaFisica {

    private static PessoaFisica pessoaFisica = null;

    public static final PessoaFisica getInstance() {
        if (pessoaFisica == null) {
            pessoaFisica = new PessoaFisica();
        }
        return pessoaFisica;
    }

    public void salvar(Connection conn, PessoaFisicaForm pessoaFisicaForm, String perfil) throws SQLException {
        String query = "INSERT INTO pessoa_fisica (nome, data_nascimento, sexo, estado_civil, ds_endereco, provincia,"
                + " cidade, visto, escolaridade, curso_escolaridade, data_entrada_japao, anos_ficar_japao, profissao_brasil, peso, altura, tamanho_sapato,"
                + " tamanho_uniforme, tipo_sanguineo, usa_oculos, habilitacao, trabalhar_zangyo, trabalhar_yakin, trabalhar_feriado, trabalhar_nikoutai,"
                + " folgas_alternadas, perfil, telefone, email, descricao, password, nivel_japones, nivel_ingles, historico_trabalho, data_cadastro, data_atualizacao)"
                + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),now())";

        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, pessoaFisicaForm.getNome());
        if (pessoaFisicaForm.getDataNascimento() != null && !pessoaFisicaForm.getDataNascimento().equals("")) {
            prep.setString(2, IDRDate.parseDataIso(pessoaFisicaForm.getDataNascimento()));
        } else {
            prep.setString(2, null);
        }
        prep.setString(3, pessoaFisicaForm.getSexo());
        prep.setString(4, pessoaFisicaForm.getEstadoCivil());
        prep.setString(5, pessoaFisicaForm.getDsEndereco());
        prep.setString(6, pessoaFisicaForm.getProvincia());
        prep.setString(7, pessoaFisicaForm.getCidade());
        prep.setString(8, pessoaFisicaForm.getVisto());
        prep.setString(9, pessoaFisicaForm.getEscolaridade());
        prep.setString(10, pessoaFisicaForm.getCursoEscolaridade());
        if (pessoaFisicaForm.getDataEntradaJapao() != null && !pessoaFisicaForm.getDataEntradaJapao().equals("")) {
            prep.setString(11, IDRDate.parseDataIso(pessoaFisicaForm.getDataEntradaJapao()));
        } else {
            prep.setString(11, null);
        }
        prep.setString(12, pessoaFisicaForm.getAnosFicarJapao());
        prep.setString(13, pessoaFisicaForm.getProfissaoBrasil());
        prep.setString(14, pessoaFisicaForm.getPeso());
        prep.setString(15, pessoaFisicaForm.getAltura());
        prep.setString(16, pessoaFisicaForm.getTamanhoSapato());
        prep.setString(17, pessoaFisicaForm.getTamanhoUniforme());
        prep.setString(18, pessoaFisicaForm.getTipoSanguineo());
        prep.setString(19, pessoaFisicaForm.getUsaOculos());
        prep.setString(20, pessoaFisicaForm.getHabilitacao());
        prep.setString(21, pessoaFisicaForm.getTrabalharZangyo());
        prep.setString(22, pessoaFisicaForm.getTrabalharYakin());
        prep.setString(23, pessoaFisicaForm.getTrabalharFeriado());
        prep.setString(24, pessoaFisicaForm.getTrabalharNikoutai());
        prep.setString(25, pessoaFisicaForm.getFolgasAlternadas());
        prep.setString(26, perfil);
        prep.setString(27, pessoaFisicaForm.getTelefone());
        prep.setString(28, pessoaFisicaForm.getEmail());
        prep.setString(29, pessoaFisicaForm.getDescricao());
        prep.setString(30, pessoaFisicaForm.getPassword());
        prep.setString(31, pessoaFisicaForm.getNivelJapones());
        prep.setString(32, pessoaFisicaForm.getNivelIngles());
        prep.setString(33, pessoaFisicaForm.getHistoricoTrabalho());
        prep.execute();
        prep.close();
    }

    public PessoaFisicaForm obterDadosPessoaFisicaPorLogin(Connection conn, String login) throws SQLException {
        String query = "select * from pessoa_fisica pf where pf.email = ?";
        PreparedStatement prep = conn.prepareStatement(query);
        prep.setString(1, login);
        ResultSet rs = prep.executeQuery();
        PessoaFisicaForm pfForm = new PessoaFisicaForm();
        if (rs.next()) {
            pfForm.setIdPF(rs.getInt("id"));
            pfForm.setNome(rs.getString("nome"));
            pfForm.setEmail(rs.getString("email"));
            pfForm.setDataNascimento(IDRDate.parseDataBra(rs.getString("data_nascimento")));
            pfForm.setPerfil(rs.getString("perfil"));
        }
        rs.close();
        prep.close();

        return pfForm;
    }

    public boolean verificarEmailCadastrado(Connection conn, String email) throws SQLException {
        boolean isExisteEmail = false;
        String query = "select * from pessoa_fisica pf where pf.email = '" + email.trim() + "'";
        try (PreparedStatement prep = conn.prepareStatement(query); ResultSet rs = prep.executeQuery()) {
            if (rs.next()) {
                isExisteEmail = true;
            }
        }

        return isExisteEmail;
    }

    public boolean verificarEmailCadastrado2vezes(Connection conn, String email) throws SQLException {
        boolean isExisteEmail = false;
        String query = "select count(*) as qtd from pessoa_fisica where email = '" + email.trim() + "'";
        try (PreparedStatement prep = conn.prepareStatement(query); ResultSet rs = prep.executeQuery()) {
            if (rs.next()) {
                int qtd = rs.getInt("qtd");
                if (qtd > 1) {
                    isExisteEmail = true;
                }
            }
        }

        return isExisteEmail;
    }

    public void atualizar(Connection conn, PessoaFisicaForm pessoaFisicaForm) throws SQLException {
        String query = "UPDATE pessoa_fisica SET nome=?, data_nascimento=?, sexo=?, estado_civil=?, "
                + " ds_endereco=?, provincia=?, cidade=?, visto=?, escolaridade=?, curso_escolaridade=?, "
                + " data_entrada_japao=?, anos_ficar_japao=?, profissao_brasil=?, peso=?, altura=?, "
                + " tamanho_sapato=?, tamanho_uniforme=?, tipo_sanguineo=?, usa_oculos=?, habilitacao=?, "
                + " trabalhar_zangyo=?, trabalhar_yakin=?, trabalhar_feriado=?, trabalhar_nikoutai=?, "
                + " folgas_alternadas=?, perfil=?, telefone=?, email=?, descricao=?, historico_trabalho=?, "
                + " nivel_japones=?, nivel_ingles=?, data_atualizacao=now()"
                + " WHERE id=?";
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setString(1, pessoaFisicaForm.getNome());
            prep.setString(2, IDRDate.parseDataIso(pessoaFisicaForm.getDataNascimento()));
            prep.setString(3, pessoaFisicaForm.getSexo());
            prep.setString(4, pessoaFisicaForm.getEstadoCivil());
            prep.setString(5, pessoaFisicaForm.getDsEndereco());
            prep.setString(6, pessoaFisicaForm.getProvincia());
            prep.setString(7, pessoaFisicaForm.getCidade());
            prep.setString(8, pessoaFisicaForm.getVisto());
            prep.setString(9, pessoaFisicaForm.getEscolaridade());
            prep.setString(10, pessoaFisicaForm.getCursoEscolaridade());
            if (pessoaFisicaForm.getDataEntradaJapao() != null && !pessoaFisicaForm.getDataEntradaJapao().equals("")) {
                prep.setString(11, IDRDate.parseDataIso(pessoaFisicaForm.getDataEntradaJapao()));
            } else {
                prep.setString(11, null);
            }
            prep.setString(12, pessoaFisicaForm.getAnosFicarJapao());
            prep.setString(13, pessoaFisicaForm.getProfissaoBrasil());
            prep.setString(14, pessoaFisicaForm.getPeso());
            prep.setString(15, pessoaFisicaForm.getAltura());
            prep.setString(16, pessoaFisicaForm.getTamanhoSapato());
            prep.setString(17, pessoaFisicaForm.getTamanhoUniforme());
            prep.setString(18, pessoaFisicaForm.getTipoSanguineo());
            prep.setString(19, pessoaFisicaForm.getUsaOculos());
            prep.setString(20, pessoaFisicaForm.getHabilitacao());
            prep.setString(21, pessoaFisicaForm.getTrabalharZangyo());
            prep.setString(22, pessoaFisicaForm.getTrabalharYakin());
            prep.setString(23, pessoaFisicaForm.getTrabalharFeriado());
            prep.setString(24, pessoaFisicaForm.getTrabalharNikoutai());
            prep.setString(25, pessoaFisicaForm.getFolgasAlternadas());
            prep.setString(26, pessoaFisicaForm.getPerfil());
            prep.setString(27, pessoaFisicaForm.getTelefone());
            prep.setString(28, pessoaFisicaForm.getEmail());
            prep.setString(29, pessoaFisicaForm.getDescricao());
            prep.setString(30, pessoaFisicaForm.getHistoricoTrabalho());
            prep.setString(31, pessoaFisicaForm.getNivelJapones());
            prep.setString(32, pessoaFisicaForm.getNivelIngles());
            prep.setInt(33, pessoaFisicaForm.getIdPF());
            prep.execute();
            prep.close();
        }

    }

    public PessoaFisicaForm obterDadosPessoaFisicaPorID(Connection conn, int idPF) throws SQLException {
        String query = "select * from pessoa_fisica pf where pf.id = ?";
        PessoaFisicaForm pfForm;
        try (PreparedStatement prep = conn.prepareStatement(query)) {
            prep.setInt(1, idPF);
            try (ResultSet rs = prep.executeQuery()) {
                pfForm = new PessoaFisicaForm();
                while (rs.next()) {
                    pfForm.setIdPF(rs.getInt("id"));
                    pfForm.setNome(rs.getString("nome"));
                    pfForm.setEmail(rs.getString("email"));
                    pfForm.setDataNascimento(IDRDate.parseDataBra(rs.getString("data_nascimento")));
                    pfForm.setSexo(rs.getString("sexo"));
                    pfForm.setEstadoCivil(rs.getString("estado_civil"));
                    pfForm.setDsEndereco(rs.getString("ds_endereco"));
                    pfForm.setProvincia(rs.getString("provincia"));
                    pfForm.setCidade(rs.getString("cidade"));
                    pfForm.setVisto(rs.getString("visto"));
                    pfForm.setEscolaridade(rs.getString("escolaridade"));
                    pfForm.setCursoEscolaridade(rs.getString("curso_escolaridade"));
                    String data_entrada_japao = rs.getString("data_entrada_japao");
                    if (data_entrada_japao != null && !data_entrada_japao.equals("")) {
                        pfForm.setDataEntradaJapao(IDRDate.parseDataBra(rs.getString("data_entrada_japao")));
                    }
                    pfForm.setAnosFicarJapao(rs.getString("anos_ficar_japao"));
                    pfForm.setProfissaoBrasil(rs.getString("profissao_brasil"));
                    pfForm.setPeso(rs.getString("peso"));
                    pfForm.setAltura(rs.getString("altura"));
                    pfForm.setTamanhoSapato(rs.getString("tamanho_sapato"));
                    pfForm.setTamanhoUniforme(rs.getString("tamanho_uniforme"));
                    pfForm.setTipoSanguineo(rs.getString("tipo_sanguineo"));
                    pfForm.setUsaOculos(rs.getString("usa_oculos"));
                    pfForm.setHabilitacao(rs.getString("habilitacao"));
                    pfForm.setTrabalharZangyo(rs.getString("trabalhar_zangyo"));
                    pfForm.setTrabalharYakin(rs.getString("trabalhar_yakin"));
                    pfForm.setTrabalharFeriado(rs.getString("trabalhar_feriado"));
                    pfForm.setTrabalharNikoutai(rs.getString("trabalhar_nikoutai"));
                    pfForm.setFolgasAlternadas(rs.getString("folgas_alternadas"));
                    pfForm.setPerfil(rs.getString("perfil"));
                    pfForm.setTelefone(rs.getString("telefone"));
                    pfForm.setEmail(rs.getString("email"));
                    pfForm.setDescricao(rs.getString("descricao"));
                    pfForm.setHistoricoTrabalho(rs.getString("historico_trabalho"));
                    pfForm.setNivelJapones(rs.getString("nivel_japones"));
                    pfForm.setNivelIngles(rs.getString("nivel_ingles"));
                    pfForm.setDataCadastro(IDRDate.parseDataBra(rs.getString("data_cadastro")));
                    pfForm.setDataAtualizacao(IDRDate.parseDataBra(rs.getString("data_atualizacao")));
                }
            }
        }

        return pfForm;
    }

    public List<PessoaFisicaForm> consultarCandidato(Connection conn, PessoaFisicaForm pessoaFisicaForm) throws SQLException {
        List<PessoaFisicaForm> listaCandidato = new ArrayList<>();
        StringBuilder sb = new StringBuilder();
        sb.append(" select YEAR(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(pf.data_nascimento))) AS idade, pf.*");
        sb.append(" from pessoa_fisica pf");
        sb.append(" where");
        if (pessoaFisicaForm.getSexo().equals("ambos")) {
            sb.append(" (pf.sexo = 'masculino' or pf.sexo = 'feminino')");
        } else {
            sb.append(" pf.sexo = '").append(pessoaFisicaForm.getSexo()).append("'");
        }
        if (pessoaFisicaForm.getNome() != null && !pessoaFisicaForm.getNome().equals("")) {
            sb.append(" and pf.nome like '%").append(pessoaFisicaForm.getNome()).append("%'");
        }
        if (pessoaFisicaForm.getProvincia() != null && !pessoaFisicaForm.getProvincia().equals("")) {
            sb.append(" and pf.provincia = '").append(pessoaFisicaForm.getProvincia()).append("'");
        }
        if (pessoaFisicaForm.getNivelJapones() != null && !pessoaFisicaForm.getNivelJapones().equals("")) {
            sb.append(" and pf.nivel_japones = '").append(pessoaFisicaForm.getNivelJapones()).append("'");
        }
        if (pessoaFisicaForm.getIdadeInicio() > 0 && pessoaFisicaForm.getIdadeFim() > 0) {
            sb.append(" and YEAR(FROM_DAYS(TO_DAYS(NOW())-TO_DAYS(pf.data_nascimento))) between ").append(pessoaFisicaForm.getIdadeInicio()).append(" and ").append(pessoaFisicaForm.getIdadeFim());
        }
        if (pessoaFisicaForm.getPalavraChave() != null && !pessoaFisicaForm.getPalavraChave().equals("")) {
            sb.append(" and (pf.escolaridade like '%").append(pessoaFisicaForm.getPalavraChave()).append("%' or pf.curso_escolaridade like '%").append(pessoaFisicaForm.getPalavraChave()).append("%' ");
            sb.append(" or pf.profissao_brasil like '%").append(pessoaFisicaForm.getPalavraChave()).append("%' or pf.descricao like '%").append(pessoaFisicaForm.getPalavraChave()).append("%'");
            sb.append(" or pf.historico_trabalho like '%").append(pessoaFisicaForm.getPalavraChave()).append("%')");
        }

        PreparedStatement prep = conn.prepareStatement(sb.toString());
        ResultSet rs = prep.executeQuery();
        while (rs.next()) {
            PessoaFisicaForm pfForm = new PessoaFisicaForm();
            pfForm.setIdPF(rs.getInt("id"));
            pfForm.setNome(rs.getString("nome"));
            pfForm.setSexo(rs.getString("sexo"));
            pfForm.setIdade(rs.getInt("idade"));
            pfForm.setProvincia(rs.getString("provincia"));
            pfForm.setCidade(rs.getString("cidade"));
            pfForm.setTelefone(rs.getString("telefone"));
            pfForm.setNivelJapones(rs.getString("nivel_japones"));
            pfForm.setDataAtualizacao(IDRDate.parseDataBra(rs.getString("data_atualizacao")));

            listaCandidato.add(pfForm);
        }
        rs.close();
        prep.close();

        return listaCandidato;
    }
}
