package com.example.webshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtil {
    private static final String user = "root";
    private static final String password = "123456";
    private static final String database = "web2021";

    private static boolean connectorInitialized = false;
    private static final Object synchronisation = new Object();

    public static Connection getConnection() throws SQLException {
        synchronized (synchronisation) {
            if (!connectorInitialized) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                connectorInitialized = true;
            }
        }

        String url = "jdbc:mysql://localhost:3306/" + database + "?serverTimezone=GMT" + "&user=" + user + "&password=" + password;
        return DriverManager.getConnection(url);
    }
}
