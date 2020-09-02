/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Form;

/**
 *
 * @author macuser
 */
public class PessoaFisicaForm extends FormBasico {

    private int idPF;
    private String nome;
    private String dataNascimento;
    private String sexo;
    private String estadoCivil;
    private String dsEndereco;
    private String provincia;
    private String cidade;
    private String visto;
    private String escolaridade;
    private String cursoEscolaridade;
    private String dataEntradaJapao;
    private String anosFicarJapao;
    private String profissaoBrasil;
    private String peso;
    private String altura;
    private String tamanhoSapato;
    private String tamanhoUniforme;
    private String tipoSanguineo;
    private String usaOculos;
    private String habilitacao;
    private String trabalharZangyo;
    private String trabalharYakin;
    private String trabalharFeriado;
    private String trabalharNikoutai;
    private String folgasAlternadas;
    private String perfil;
    private String email;
    private String telefone;
    private String descricao;
    private String password;
    private String historicoTrabalho;
    private String nivelJapones;
    private String nivelIngles;
    private String dataCadastro;
    private String dataAtualizacao;
    private int idadeInicio = 18;
    private int idadeFim = 50;
    private int idade;
    private String palavraChave;

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public int getIdadeInicio() {
        return idadeInicio;
    }

    public void setIdadeInicio(int idadeInicio) {
        this.idadeInicio = idadeInicio;
    }

    public int getIdadeFim() {
        return idadeFim;
    }

    public void setIdadeFim(int idadeFim) {
        this.idadeFim = idadeFim;
    }

    public String getPalavraChave() {
        return palavraChave;
    }

    public void setPalavraChave(String palavraChave) {
        this.palavraChave = palavraChave;
    }
    
    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public String getDataAtualizacao() {
        return dataAtualizacao;
    }

    public void setDataAtualizacao(String dataAtualizacao) {
        this.dataAtualizacao = dataAtualizacao;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdPF() {
        return idPF;
    }

    public void setIdPF(int idPF) {
        this.idPF = idPF;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(String dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getDsEndereco() {
        return dsEndereco;
    }

    public void setDsEndereco(String dsEndereco) {
        this.dsEndereco = dsEndereco;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getVisto() {
        return visto;
    }

    public void setVisto(String visto) {
        this.visto = visto;
    }

    public String getEscolaridade() {
        return escolaridade;
    }

    public void setEscolaridade(String escolaridade) {
        this.escolaridade = escolaridade;
    }

    public String getCursoEscolaridade() {
        return cursoEscolaridade;
    }

    public void setCursoEscolaridade(String cursoEscolaridade) {
        this.cursoEscolaridade = cursoEscolaridade;
    }

    public String getDataEntradaJapao() {
        return dataEntradaJapao;
    }

    public void setDataEntradaJapao(String dataEntradaJapao) {
        this.dataEntradaJapao = dataEntradaJapao;
    }

    public String getAnosFicarJapao() {
        return anosFicarJapao;
    }

    public void setAnosFicarJapao(String anosFicarJapao) {
        this.anosFicarJapao = anosFicarJapao;
    }

    public String getProfissaoBrasil() {
        return profissaoBrasil;
    }

    public void setProfissaoBrasil(String profissaoBrasil) {
        this.profissaoBrasil = profissaoBrasil;
    }

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getTamanhoSapato() {
        return tamanhoSapato;
    }

    public void setTamanhoSapato(String tamanhoSapato) {
        this.tamanhoSapato = tamanhoSapato;
    }

    public String getTamanhoUniforme() {
        return tamanhoUniforme;
    }

    public void setTamanhoUniforme(String tamanhoUniforme) {
        this.tamanhoUniforme = tamanhoUniforme;
    }

    public String getTipoSanguineo() {
        return tipoSanguineo;
    }

    public void setTipoSanguineo(String tipoSanguineo) {
        this.tipoSanguineo = tipoSanguineo;
    }

    public String getUsaOculos() {
        return usaOculos;
    }

    public void setUsaOculos(String usaOculos) {
        this.usaOculos = usaOculos;
    }

    public String getHabilitacao() {
        return habilitacao;
    }

    public void setHabilitacao(String habilitacao) {
        this.habilitacao = habilitacao;
    }

    public String getNivelJapones() {
        return nivelJapones;
    }

    public void setNivelJapones(String nivelJapones) {
        this.nivelJapones = nivelJapones;
    }

    public String getNivelIngles() {
        return nivelIngles;
    }

    public void setNivelIngles(String nivelIngles) {
        this.nivelIngles = nivelIngles;
    }

    public String getTrabalharZangyo() {
        return trabalharZangyo;
    }

    public void setTrabalharZangyo(String trabalharZangyo) {
        this.trabalharZangyo = trabalharZangyo;
    }

    public String getTrabalharYakin() {
        return trabalharYakin;
    }

    public void setTrabalharYakin(String trabalharYakin) {
        this.trabalharYakin = trabalharYakin;
    }

    public String getTrabalharFeriado() {
        return trabalharFeriado;
    }

    public void setTrabalharFeriado(String trabalharFeriado) {
        this.trabalharFeriado = trabalharFeriado;
    }

    public String getTrabalharNikoutai() {
        return trabalharNikoutai;
    }

    public void setTrabalharNikoutai(String trabalharNikoutai) {
        this.trabalharNikoutai = trabalharNikoutai;
    }

    public String getFolgasAlternadas() {
        return folgasAlternadas;
    }

    public void setFolgasAlternadas(String folgasAlternadas) {
        this.folgasAlternadas = folgasAlternadas;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getHistoricoTrabalho() {
        return historicoTrabalho;
    }

    public void setHistoricoTrabalho(String historicoTrabalho) {
        this.historicoTrabalho = historicoTrabalho;
    }

   

}
