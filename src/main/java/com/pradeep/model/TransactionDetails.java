package com.pradeep.model;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

public class TransactionDetails {

    private int transactionId;
    private Date transactionDateTime;
    private int sourceId;
    private int targetId;
    private String sourceType;
    private String destinationType;
    private BigDecimal transactionAmount;
    
    
    
    public TransactionDetails(int transactionId, Date transactionDateTime, int sourceId, int targetId,
			String sourceType, String destinationType, BigDecimal transactionAmount) {
		super();
		this.transactionId = transactionId;
		this.transactionDateTime = transactionDateTime;
		this.sourceId = sourceId;
		this.targetId = targetId;
		this.sourceType = sourceType;
		this.destinationType = destinationType;
		this.transactionAmount = transactionAmount;
	}

	// Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Date getTransactionDateTime() {
        return transactionDateTime;
    }

    public void setTransactionDateTime(Date transactionDateTime) {
        this.transactionDateTime = transactionDateTime;
    }

    public int getSourceId() {
        return sourceId;
    }

    public void setSourceId(int sourceId) {
        this.sourceId = sourceId;
    }

    public int getTargetId() {
        return targetId;
    }

    public void setTargetId(int targetId) {
        this.targetId = targetId;
    }

    public String getSourceType() {
        return sourceType;
    }

    public void setSourceType(String sourceType) {
        this.sourceType = sourceType;
    }

    public String getDestinationType() {
        return destinationType;
    }

    public void setDestinationType(String destinationType) {
        this.destinationType = destinationType;
    }

    public BigDecimal getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(BigDecimal transactionAmount) {
        this.transactionAmount = transactionAmount;
    }
}
