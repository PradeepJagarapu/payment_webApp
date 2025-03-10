package com.pradeep.servlets;

import java.util.Date;

public class Transaction {
    private int transactionId;
    private Date date;
    private String description;
    private double amount;
    private String type; // "Debit" or "Credit"
    private double balance;

    // Constructor
    public Transaction(int transactionId, Date date, String description, double amount, String type, double balance) {
        this.transactionId = transactionId;
        this.date = date;
        this.description = description;
        this.amount = amount;
        this.type = type;
        this.balance = balance;
    }

    // Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    // ToString method for easy readability
    @Override
    public String toString() {
        return "Transaction{" +
                "transactionId=" + transactionId +
                ", date=" + date +
                ", description='" + description + '\'' +
                ", amount=" + amount +
                ", type='" + type + '\'' +
                ", balance=" + balance +
                '}';
    }
}
