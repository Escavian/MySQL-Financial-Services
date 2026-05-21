# Local Financial Services Management Database (MySQL)

A MySQL relational database designed for a **small, community‑focused financial services business** that supports local residents, immigrants, and small businesses.  
This database models clients, services, appointments, staff, transactions, case records, and uploaded documents — all tailored for a mom‑and‑pop style operation that provides affordable, personalized financial assistance.

---

# 📌 Purpose

This database was created to support the daily operations of a **local financial services office**, including:

- Bookkeeping for small businesses  
- Tax preparation for individuals and families  
- Immigration‑related document assistance  
- Amicable divorces and child support paperwork  
- Wills and testament preparation  
- Notary services  

The goal is to help the business stay organized, reduce paperwork, and securely manage client information.

---

# 🗂️ Database Schema Overview

## **Tables Included**

### **Client**
Stores client contact information, demographics, and language needs.

### **Staff**
Tracks staff members who assist clients with various services.

### **Services**
List of services offered (bookkeeping, tax prep, immigration assistance, notary, etc.).

### **Appointment**
Scheduled meetings between clients and staff for specific services.

### **Transaction**
Records payments, service fees, and financial history.

### **CaseRecord**
Tracks ongoing cases such as immigration filings, divorce paperwork, or tax cases.

### **Document**
Uploaded or linked documents such as IDs, tax forms, legal agreements, or receipts.

---

# 🔗 Relationships (ERD Summary)

- **Client** ↔ **Appointment** (1‑to‑many)  
- **Client** ↔ **Transaction** (1‑to‑many)  
- **Client** ↔ **CaseRecord** (1‑to‑many)  
- **Client** ↔ **Document** (1‑to‑many)  
- **Staff** ↔ **Appointment** (1‑to‑many)  
- **Service** ↔ **Appointment** (1‑to‑many)  
- **Service** ↔ **Transaction** (1‑to‑many)  
- **CaseRecord** ↔ **Document** (1‑to‑many)

> Include your ERD image as **ERD.png** for visual clarity.

---

# 📦 Files Included in This Repository


---

# 🚀 How to Use This Database

## **1. Create the database**
```sql
CREATE DATABASE financial_services_local;
USE financial_services_local;

Table creation
--------------
SOURCE create_tables.sql;

Insert sample data
------------------
SOURCE insert_data.sql;

Get all upcoming client appointments
-----------------------------------
SELECT a.date, a.time, c.FirstName, c.LastName, s.ServiceName
FROM appointment a
JOIN client c ON a.ClientID = c.ClientID
JOIN service s ON a.ServiceID = s.ServiceID
ORDER BY a.date, a.time;

Get all transcations for a specific client
------------------------------------------
SELECT t.Amount, t.PaymentDate, s.ServiceName
FROM transactions t
JOIN service s ON t.ServiceID = s.ServiceID
WHERE t.ClientID = 1;

List all open records
---------------------
SELECT c.CaseID, cl.FirstName, cl.LastName, c.Status, c.OpenDate
FROM caserecord c
JOIN client cl ON c.ClientID = cl.ClientID
WHERE c.Status = 'Open';

🔮 Future Improvements
Add stored procedures for generating invoices

Add triggers for automatic timestamps

Add audit logging for compliance

Add user roles for staff access levels

Add reporting views for revenue and service usage
