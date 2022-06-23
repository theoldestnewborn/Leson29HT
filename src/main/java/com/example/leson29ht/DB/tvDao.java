package com.example.leson29ht.DB;

import com.example.leson29ht.Entities.TVset;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class tvDao {

    public tvDao() {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public List<TVset> getAll () {
        List<TVset> tvSetList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection
                (DBConfig.URL, DBConfig.USER, DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from tvsets join tvsetsinfo " +
                    "on tvsets.id=tvsetsinfo.id");
            while (rs.next()) {
                TVset tvSet = new TVset();
                tvSet.setId(rs.getInt("id"));
                tvSet.setBrand(rs.getString("brand"));
                tvSet.setModel(rs.getString("model"));
                tvSet.setPrice(rs.getInt("price"));
                tvSet.setInfo("info");
                tvSetList.add(tvSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tvSetList;
    }

    public TVset getOne (String brand, String model) {
        TVset tvSet = new TVset();
        try(Connection conn = DriverManager.getConnection(DBConfig.URL,DBConfig.USER,DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                    "select * from tvsets " +
                    "join tvsetsinfo " +
                    "on tvsets.id = tvsetsinfo.id " +
                    "where brand='" + brand + "' " +
                    "and model='" + model + "'");
            tvSet.setId(rs.getInt("id"));
            tvSet.setBrand(rs.getString("brand"));
            tvSet.setModel(rs.getString("model"));
            tvSet.setInfo(rs.getString("info"));
            tvSet.setId(rs.getInt("price"));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tvSet;
    }

    public void addOne (String brand, String model, String info, int price) {
        try (Connection conn = DriverManager.getConnection(DBConfig.URL,DBConfig.USER,DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            stmt.execute("insert into tvsets (brand, model, price) " +
                    "values ('" + brand + "', '" + model + "','" + price + "')");
            stmt.execute("insert into tvsetsinfo (info) " +
                    "values ('" + info + "')");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void removeOne (String brand, String model) {
        try (Connection conn = DriverManager.getConnection(DBConfig.URL,DBConfig.USER,DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            stmt.execute(
                    "delete from tvsets " +
                    "where brand='" + brand + "' " +
                    "and model='" + model + "'");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

//    public static void main(String[] args) {
//        Repository rp = new Repository();
//        rp.addOne("xiaomi", "zzz", "a nice tv set", 1000);
//        System.out.println(rp.getAll());
//        rp.removeOne("xiaomi", "zzz");
//        System.out.println(rp.getAll());
//    }
}
