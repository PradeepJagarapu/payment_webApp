package com.pradeep.model;

public class BankAccount{
    private int bankAccountId;
    private int userId;
    private String accountNumber;
    private String ifscCode;
    private String bankName;
    private String branchLocation;
    private double balance;
    private String isActive;
    
    public BankAccount() {
		super();
	}

	public BankAccount(int bankAccountId, int userId, String accountNumber, String ifscCode, String bankName,
			String branchLocation, String isActive) {
		super();
		this.bankAccountId = bankAccountId;
		this.userId = userId;
		this.accountNumber = accountNumber;
		this.ifscCode = ifscCode;
		this.bankName = bankName;
		this.branchLocation = branchLocation;
		this.isActive = isActive;
	}

	// Getters and Setters
    public int getBankAccountId() {
        return bankAccountId;
    }

    public void setBankAccountId(int bankAccountId) {
        this.bankAccountId = bankAccountId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getIfscCode() {
        return ifscCode;
    }

    public void setIfscCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBranchLocation() {
        return branchLocation;
    }

    public void setBranchLocation(String branchLocation) {
        this.branchLocation = branchLocation;
    }

    public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }
}

