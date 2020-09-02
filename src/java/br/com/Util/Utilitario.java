/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author macuser
 */
public class Utilitario {


    public static String obterDescricaoStatus(int status) {
        String descricaoStatus = "";
        switch (status) {
            case 1:
                descricaoStatus = "Ativo";
                break;
            case 2:
                descricaoStatus = "Inativo";
                break;
        }
        return descricaoStatus;

    }

    public static int obterAnoVigente(Connection conn) throws SQLException {
        String query = "select ano_vigente from ano_vigente";
        PreparedStatement prep = conn.prepareStatement(query);
        ResultSet rs = prep.executeQuery();
        int anoVigente = 0;
        if(rs.next()){
            anoVigente = rs.getInt("ano_vigente");
        }
        rs.close();
        prep.close();
        
        return anoVigente;
    }

}
