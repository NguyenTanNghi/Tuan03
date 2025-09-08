package iuh.fit.se.tuan03.bai02;

import java.sql.*;
import java.util.*;

public class AccountDAO {
    public void insert(Account account) throws SQLException {
        String sql = "INSERT INTO account (firstName, lastName, email, password, dayOfBirth, gender) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, account.getFirstName());
            stmt.setString(2, account.getLastName());
            stmt.setString(3, account.getEmail());
            stmt.setString(4, account.getPassword());
            stmt.setDate(5, new java.sql.Date(account.getDob().getTime()));
            stmt.setString(6, account.getGender());
            stmt.executeUpdate();
        }
    }

    public List<Account> findAll() throws SQLException {
        List<Account> accounts = new ArrayList<>();
        String sql = "SELECT * FROM account";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                accounts.add(new Account(
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getDate("dayOfBirth"),
                        rs.getString("gender")
                ));
            }
        }
        return accounts;
    }
}
