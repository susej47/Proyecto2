package com.example;

public class DBurl {
    private String url;

    public DBurl() {
        url = "jdbc:sqlite:/home/mosorior/Documentos/GitHub/Project/DB";
    }

    public String getUrl() {
        return url;
    }

    public static void main(String[] args) {
        DBurl dburl = new DBurl();
        System.out.println(dburl.getUrl());
    }
}

