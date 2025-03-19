package com.pradeep.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class UserAccountDetails {
    private int userAccountId;
    private LocalDate accountOpenDate;
    private int userId;
    private BigDecimal currentWalletBalance;
    private String walletPin;
    private int linkedBankAccountsCount;

    // Getters and Setters
    public int getUserAccountId() {
        return userAccountId;
    }

    public void setUserAccountId(int userAccountId) {
        this.userAccountId = userAccountId;
    }

    public LocalDate getAccountOpenDate() {
        return accountOpenDate;
    }

    public void setAccountOpenDate(LocalDate accountOpenDate) {
        this.accountOpenDate = accountOpenDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public BigDecimal getCurrentWalletBalance() {
        return currentWalletBalance;
    }

    public void setCurrentWalletBalance(BigDecimal currentWalletBalance) {
        this.currentWalletBalance = currentWalletBalance;
    }

    public String getWalletPin() {
        return walletPin;
    }

    public void setWalletPin(String walletPin) {
        this.walletPin = walletPin;
    }

    public int getLinkedBankAccountsCount() {
        return linkedBankAccountsCount;
    }

    public void setLinkedBankAccountsCount(int linkedBankAccountsCount) {
        this.linkedBankAccountsCount = linkedBankAccountsCount;
    }
}
