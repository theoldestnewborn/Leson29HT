package com.example.leson29ht.DB;

import com.example.leson29ht.Entities.TVset;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TvDao {

    public TvDao() {
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
                    "on tvsets.id=tvsetsinfo.id join tvpictures t on tvsets.id = t.id");
            while (rs.next()) {
                TVset tvSet = new TVset();
                tvSet.setId(rs.getInt("id"));
                tvSet.setBrand(rs.getString("brand"));
                tvSet.setModel(rs.getString("model"));
                tvSet.setPrice(rs.getInt("price"));
                tvSet.setInfo(rs.getString("info"));
                String path = rs.getString("link");
                tvSet.setPathImage(path);
                tvSetList.add(tvSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return tvSetList;
    }

    public int getAllPages (int tvsPerPage) {
    return getAll().size()/tvsPerPage;
    }


    public List<TVset> getPage (int page, int tvsPerPage) {
        List<TVset> tvSetList = new ArrayList<>();
        int offset;
        if (page==1) {
            offset=1;
        } else {
            offset = (page - 1) * tvsPerPage;
        }
        try (Connection conn = DriverManager.getConnection
                (DBConfig.URL, DBConfig.USER, DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from tvsets join tvsetsinfo " +
                    "on tvsets.id=tvsetsinfo.id join tvpictures t on tvsets.id = t.id limit "
                    + tvsPerPage + " offset " + offset + ";");
            while (rs.next()) {
                TVset tvSet = new TVset();
                tvSet.setId(rs.getInt("id"));
                tvSet.setBrand(rs.getString("brand"));
                tvSet.setModel(rs.getString("model"));
                tvSet.setPrice(rs.getInt("price"));
                tvSet.setInfo(rs.getString("info"));
                String path = rs.getString("link");
                tvSet.setPathImage(path);
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

    public int getLastId () {
        int lastId;
        try(Connection conn = DriverManager.getConnection(DBConfig.URL,DBConfig.USER,DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                    "SELECT MAX(id) FROM TVsets");
            lastId = rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lastId;
    }

    public void addImage (String path) {
        try (Connection conn = DriverManager.getConnection(DBConfig.URL,DBConfig.USER,DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            stmt.execute("insert into tvpictures (link) " +
                    "values ('" + path + "')");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void addOne (String brand, String model, String info, int price) {
        try (Connection conn = DriverManager.getConnection(DBConfig.URL,DBConfig.USER,DBConfig.PASSWORD)) {
            Statement stmt = conn.createStatement();
            stmt.execute("insert into tvsets (brand, model, price) " +
                    "values ('" + brand + "', '" + model + "','" + price + "')");
            stmt.execute("insert into tvsetsinfo (info) " +
                    "values ('" + info + "')");
//            stmt.execute("insert into tvpictures (link) " +
//                    "values ('" + path + "')");
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
}
