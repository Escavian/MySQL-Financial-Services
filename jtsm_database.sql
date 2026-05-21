-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: jtsm
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Appointment ID PK` int NOT NULL,
  `Client ID FK` int DEFAULT NULL,
  `Staff ID FK` int DEFAULT NULL,
  `Service ID FK` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Appointment ID PK`),
  UNIQUE KEY `Appointment ID PK_UNIQUE` (`Appointment ID PK`),
  KEY `Client ID FK_idx` (`Client ID FK`),
  KEY `Staff ID FK_idx` (`Staff ID FK`),
  KEY `Service ID FK_idx` (`Service ID FK`),
  CONSTRAINT `Client ID FK` FOREIGN KEY (`Client ID FK`) REFERENCES `client` (`Client ID PK`),
  CONSTRAINT `fk_appointment_client` FOREIGN KEY (`Client ID FK`) REFERENCES `client` (`Client ID PK`) ON DELETE CASCADE,
  CONSTRAINT `fk_appointment_service` FOREIGN KEY (`Service ID FK`) REFERENCES `services` (`Service ID PK`) ON DELETE RESTRICT,
  CONSTRAINT `fk_appointment_staff` FOREIGN KEY (`Staff ID FK`) REFERENCES `staff` (`Staff ID PK`) ON DELETE SET NULL,
  CONSTRAINT `Service ID FK` FOREIGN KEY (`Service ID FK`) REFERENCES `services` (`Service ID PK`),
  CONSTRAINT `Staff ID FK` FOREIGN KEY (`Staff ID FK`) REFERENCES `staff` (`Staff ID PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,1,1,1,'2026-04-01','2026-04-01 09:00:00','Completed'),(2,2,2,2,'2026-04-02','2026-04-02 10:30:00','Completed'),(3,3,3,3,'2026-04-03','2026-04-03 14:00:00','Cancelled'),(4,4,2,1,'2026-04-10','2026-04-10 09:30:00','Completed'),(5,5,2,2,'2026-04-11','2026-04-11 10:00:00','Cancelled'),(6,6,3,3,'2026-04-12','2026-04-12 11:00:00','Completed'),(7,7,2,1,'2026-04-13','2026-04-13 13:30:00','Cancelled'),(8,8,3,2,'2026-04-14','2026-04-14 14:00:00','Scheduled'),(9,9,2,3,'2026-04-15','2026-04-15 15:00:00','Completed'),(10,10,3,1,'2026-04-16','2026-04-16 09:00:00','Scheduled');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `appointment_client_view`
--

DROP TABLE IF EXISTS `appointment_client_view`;
/*!50001 DROP VIEW IF EXISTS `appointment_client_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointment_client_view` AS SELECT 
 1 AS `appointment_id`,
 1 AS `client_id`,
 1 AS `client_name`,
 1 AS `Phone`,
 1 AS `Email`,
 1 AS `Date`,
 1 AS `Time`,
 1 AS `Status`,
 1 AS `service_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `appointmentclientview`
--

DROP TABLE IF EXISTS `appointmentclientview`;
/*!50001 DROP VIEW IF EXISTS `appointmentclientview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointmentclientview` AS SELECT 
 1 AS `appointment_id`,
 1 AS `client_first_name`,
 1 AS `client_last_name`,
 1 AS `appointment_date`,
 1 AS `appointment_time`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `caserecord`
--

DROP TABLE IF EXISTS `caserecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caserecord` (
  `case_id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `assigned_staff_id` int DEFAULT NULL,
  `description` text,
  `status` varchar(45) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  PRIMARY KEY (`case_id`),
  KEY `caserecord_client_fk_idx` (`client_id`),
  KEY `Manager ID FK_idx` (`assigned_staff_id`),
  CONSTRAINT `caserecord_client_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`Client ID PK`),
  CONSTRAINT `fk_caserecord_assignedstaff` FOREIGN KEY (`assigned_staff_id`) REFERENCES `staff` (`Staff ID PK`) ON DELETE SET NULL,
  CONSTRAINT `fk_caserecord_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`Client ID PK`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caserecord`
--

LOCK TABLES `caserecord` WRITE;
/*!40000 ALTER TABLE `caserecord` DISABLE KEYS */;
INSERT INTO `caserecord` VALUES (1,1,2,'Initial intake: behavioral concerns; referral to counseling and resources provided','Closed','2026-01-10','2026-02-05'),(2,2,3,'Medication review and follow-up; care plan updated and medication adjusted','Closed','2026-02-15','2026-03-01'),(3,3,4,'Family counseling referral; assessment in progress; awaiting intake forms','In Progress','2026-03-20',NULL),(4,4,5,'Housing assistance assessment; documents requested from client','Open','2026-04-01',NULL),(5,5,6,'Billing dispute opened; finance team engaged; payment plan proposed','Closed','2026-01-25','2026-02-10'),(6,6,NULL,'Intake scheduled; awaiting client paperwork and ID verification','Open','2026-04-05',NULL),(7,7,7,'Child services referral; safety plan created; follow-up scheduled','In Progress','2026-03-30',NULL),(8,8,8,'Successful discharge after treatment completion; aftercare resources provided','Closed','2025-12-10','2026-01-15'),(9,9,9,'Vocational support ongoing; job placement activities and resume assistance','In Progress','2026-02-20',NULL),(10,10,NULL,'Administrative hold; pending client response to outreach and documentation request','On Hold','2026-04-12',NULL);
/*!40000 ALTER TABLE `caserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `Client ID PK` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `PreferredLanguage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Client ID PK`),
  UNIQUE KEY `Client ID PK_UNIQUE` (`Client ID PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'John','Smith','407-555-1111','john.smith@email.com','123 Main St, Orlando, FL','English'),(2,'Maria','Lopez','407-555-2222','maria.lopez@email.com','456 Oak Ave, Sanford, FL','Spanish'),(3,'Alex','Brown','407-555-3333','alexbrown@email.com','506 Ocean Ave, Deltona, FL','Spanish'),(4,'Isabella','Martinez','407-555-4141','isabella.martinez@example.com','789 Pine St, Orlando, FL','Spanish'),(5,'Daniel','Wilson','407-555-4242','daniel.wilson@example.com','101 Maple Rd, Winter Park, FL','English'),(6,'Grace','Hernandez','407-555-4343','grace.hernandez@example.com','202 Birch Ln, Altamonte Springs, FL','English'),(7,'Carlos','Santos','407-555-4444','carlos.santos@example.com','303 Cedar Ave, Sanford, FL','Portuguese'),(8,'Emily','Ng','407-555-4545','emily.ng@example.com','404 Spruce St, Oviedo, FL','English'),(9,'Miguel','Diaz','407-555-4646','miguel.diaz@example.com','505 Palm Blvd, Kissimmee, FL','Spanish'),(10,'Hannah','Walker','407-555-4747','hannah.walker@example.com','606 Lakeview Dr, Casselberry, FL','English');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `document_id` int NOT NULL AUTO_INCREMENT,
  `case_id` int DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `file_type` varchar(45) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  `notes` text,
  `TabId` bigint DEFAULT NULL,
  `IsCurrent` tinyint(1) NOT NULL DEFAULT '0',
  `PageTitle` varchar(1024) DEFAULT NULL,
  `PageUrl` varchar(2048) DEFAULT NULL,
  `LastAccessed` datetime DEFAULT NULL,
  PRIMARY KEY (`document_id`),
  UNIQUE KEY `ux_documents_tabid` (`TabId`),
  KEY `Case ID FK_idx` (`case_id`),
  KEY `idx_documents_iscurrent` (`IsCurrent`),
  KEY `idx_documents_tabid` (`TabId`),
  CONSTRAINT `fk_documents_case` FOREIGN KEY (`case_id`) REFERENCES `caserecord` (`case_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,1,'intake_form_john_smith.pdf','pdf','2026-01-10','Initial intake form and signed consent',NULL,0,NULL,NULL,NULL),(2,2,'med_review_maria_lopez.docx','docx','2026-02-16','Medication review notes and prescription summary',NULL,0,NULL,NULL,NULL),(3,3,'family_assessment_alex_brown.pdf','pdf','2026-03-21','Family assessment; signatures pending',NULL,0,NULL,NULL,NULL),(4,4,'housing_docs_isabella.zip','zip','2026-04-02','Supporting documents for housing assistance application',NULL,0,NULL,NULL,NULL),(5,5,'billing_dispute_daniel.pdf','pdf','2026-01-26','Invoices and correspondence for billing dispute',NULL,0,NULL,NULL,NULL),(6,6,'id_grace_hernandez.jpg','jpg','2026-04-06','Scanned ID and proof of address awaiting verification',NULL,0,NULL,NULL,NULL),(7,7,'safety_plan_carlos_santos.pdf','pdf','2026-03-31','Child safety plan and emergency contacts',NULL,0,NULL,NULL,NULL),(8,8,'discharge_summary_emily_ng.pdf','pdf','2026-01-16','Discharge summary and aftercare instructions',NULL,0,NULL,NULL,NULL),(9,9,'vocational_plan_miguel.xlsx','xlsx','2026-02-21','Vocational support plan and job leads list',NULL,0,NULL,NULL,NULL),(10,10,'admin_hold_hannah.txt','txt','2026-04-13','Outreach log and checklist for pending documents',NULL,0,NULL,NULL,NULL),(1001,NULL,'youtube_shorts_PSBD1bCbYTE','url','2026-04-20','Imported tab row',1216924397,1,'Dashboard','https://online.seminolestate.edu','2026-04-20 17:44:27');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_backup`
--

DROP TABLE IF EXISTS `documents_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_backup` (
  `document_id` int NOT NULL DEFAULT '0',
  `case_id` int DEFAULT NULL,
  `file_name` varchar(45) DEFAULT NULL,
  `file_type` varchar(45) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  `notes` text,
  `TabId` bigint DEFAULT NULL,
  `IsCurrent` tinyint(1) NOT NULL DEFAULT '0',
  `PageTitle` varchar(1024) DEFAULT NULL,
  `PageUrl` varchar(2048) DEFAULT NULL,
  `LastAccessed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_backup`
--

LOCK TABLES `documents_backup` WRITE;
/*!40000 ALTER TABLE `documents_backup` DISABLE KEYS */;
INSERT INTO `documents_backup` VALUES (1,1,'intake_form_john_smith.pdf','pdf','2026-01-10','Initial intake form and signed consent',NULL,0,NULL,NULL,NULL),(2,2,'med_review_maria_lopez.docx','docx','2026-02-16','Medication review notes and prescription summary',NULL,0,NULL,NULL,NULL),(3,3,'family_assessment_alex_brown.pdf','pdf','2026-03-21','Family assessment; signatures pending',NULL,0,NULL,NULL,NULL),(4,4,'housing_docs_isabella.zip','zip','2026-04-02','Supporting documents for housing assistance application',NULL,0,NULL,NULL,NULL),(5,5,'billing_dispute_daniel.pdf','pdf','2026-01-26','Invoices and correspondence for billing dispute',NULL,0,NULL,NULL,NULL),(6,6,'id_grace_hernandez.jpg','jpg','2026-04-06','Scanned ID and proof of address awaiting verification',NULL,0,NULL,NULL,NULL),(7,7,'safety_plan_carlos_santos.pdf','pdf','2026-03-31','Child safety plan and emergency contacts',NULL,0,NULL,NULL,NULL),(8,8,'discharge_summary_emily_ng.pdf','pdf','2026-01-16','Discharge summary and aftercare instructions',NULL,0,NULL,NULL,NULL),(9,9,'vocational_plan_miguel.xlsx','xlsx','2026-02-21','Vocational support plan and job leads list',NULL,0,NULL,NULL,NULL),(10,10,'admin_hold_hannah.txt','txt','2026-04-13','Outreach log and checklist for pending documents',NULL,0,NULL,NULL,NULL),(11,NULL,'youtube_shorts_PSBD1bCbYTE','url','2026-04-20','Imported tab row',1216924397,1,'Dashboard','https://online.seminolestate.edu','2026-04-20 17:44:27'),(1001,NULL,'youtube_shorts_PSBD1bCbYTE','url','2026-04-20','Imported tab row',1216924397,1,'Dashboard','https://online.seminolestate.edu','2026-04-20 17:44:27');
/*!40000 ALTER TABLE `documents_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `Service ID PK` int NOT NULL,
  `ServiceName` varchar(45) DEFAULT NULL,
  `ServiceCategory` varchar(45) DEFAULT NULL,
  `ServiceDiscription` text,
  PRIMARY KEY (`Service ID PK`),
  UNIQUE KEY `Service ID PK_UNIQUE` (`Service ID PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Consultation','General','Initial client consultation'),(2,'Follow-Up','General','Follow-up appointment'),(3,'Documentation','Administrative','Case documentation service'),(4,'Administration','Office','General administrative support and client intake'),(5,'Bookkeeping','Finance','Accounts, invoicing, and basic bookkeeping services'),(6,'Data Entry','Office','Data entry and record maintenance services'),(7,'Wills','Legal','Preparation of simple wills and testament documents'),(8,'Child Support','Legal','Assistance with child support paperwork and filings'),(9,'Uncontested Divorce','Legal','Preparation of uncontested divorce paperwork and filings'),(10,'Notary Stamps','Notary','Notary public services and document stamping');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff ID PK` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Manager ID` int DEFAULT NULL,
  PRIMARY KEY (`Staff ID PK`),
  UNIQUE KEY `Staff ID PK_UNIQUE` (`Staff ID PK`),
  KEY `fk_staff_manager` (`Manager ID`),
  CONSTRAINT `fk_staff_manager` FOREIGN KEY (`Manager ID`) REFERENCES `staff` (`Staff ID PK`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Liz','Rodriguez','Manager','407-555-1234','liz@company.com',NULL),(2,'Jonathan','Colon','Technician','407-555-5678','jonathan@company.com',1),(3,'Myah','Cartagena','Assistant','407-555-9012','myah@company.com',1),(4,'Ava','Reed','Receptionist','407-555-0101','ava.reed@example.com',1),(5,'Liam','Garcia','Administration','407-555-0102','liam.garcia@example.com',1),(6,'Maya','Patel','Bookkeeping','407-555-0103','maya.patel@example.com',1),(7,'Noah','Kim','Data Entry','407-555-0104','noah.kim@example.com',1),(8,'Olivia','Nguyen','Wills Specialist','407-555-0105','olivia.nguyen@example.com',1),(9,'Ethan','Brown','Child Support Advisor','407-555-0106','ethan.brown@example.com',1),(10,'Sophia','Lopez','Divorce Specialist','407-555-0107','sophia.lopez@example.com',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_service`
--

DROP TABLE IF EXISTS `staff_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int NOT NULL,
  `service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_id` (`staff_id`,`service_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `staff_service_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`Staff ID PK`) ON DELETE CASCADE,
  CONSTRAINT `staff_service_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`Service ID PK`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_service`
--

LOCK TABLES `staff_service` WRITE;
/*!40000 ALTER TABLE `staff_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `Transaction ID PK` int NOT NULL AUTO_INCREMENT,
  `Client ID FK` int DEFAULT NULL,
  `InvoiceNumber` varchar(45) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PaymentDate` date DEFAULT NULL,
  `PaymentMethod` varchar(45) DEFAULT NULL,
  `appointment_id` int DEFAULT NULL,
  PRIMARY KEY (`Transaction ID PK`),
  UNIQUE KEY `Transaction ID PK_UNIQUE` (`Transaction ID PK`),
  UNIQUE KEY `uq_transactions_invoicenumber` (`InvoiceNumber`),
  KEY `Client ID FK_idx` (`Client ID FK`),
  KEY `fk_transactions_appointment` (`appointment_id`),
  CONSTRAINT `fk_transactions_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`Appointment ID PK`) ON DELETE SET NULL,
  CONSTRAINT `transcations_client_fk` FOREIGN KEY (`Client ID FK`) REFERENCES `client` (`Client ID PK`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,4,'INV-2026-004',120.00,'2026-04-10','Card',4),(2,6,'INV-2026-006',150.00,'2026-04-12','Cash',6),(3,9,'INV-2026-009',95.00,'2026-04-15','Card',9),(4,1,'INV-2026-001',100.00,'2026-04-01','Card',1),(5,2,'INV-2026-002',110.00,'2026-04-02','Card',2),(6,3,'REF-2026-003',-50.00,'2026-04-04','Card Refund',3),(7,5,'REF-2026-005',-120.00,'2026-04-12','Card Refund',5),(8,7,'REF-2026-007',-75.00,'2026-04-14','Card Refund',7),(9,4,'INV-2026-004-A',120.00,'2026-04-10','Card',4),(10,5,'INV-2026-005',130.50,'2026-04-11','Card',5),(11,6,'INV-2026-006-A',150.00,'2026-04-12','Check',6),(12,7,'INV-2026-007',90.00,'2026-04-13','Card',7),(13,8,'INV-2026-008',110.00,'2026-04-14','Card',8),(14,9,'INV-2026-009-A',95.00,'2026-04-15','Card',9),(15,10,'REF-2026-010',-50.00,'2026-04-17','Card Refund',10);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `appointment_client_view`
--

/*!50001 DROP VIEW IF EXISTS `appointment_client_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointment_client_view` AS select `a`.`Appointment ID PK` AS `appointment_id`,`a`.`Client ID FK` AS `client_id`,concat(`c`.`FirstName`,' ',`c`.`LastName`) AS `client_name`,`c`.`Phone` AS `Phone`,`c`.`Email` AS `Email`,`a`.`Date` AS `Date`,`a`.`Time` AS `Time`,`a`.`Status` AS `Status`,`a`.`Service ID FK` AS `service_id` from (`appointment` `a` join `client` `c` on((`a`.`Client ID FK` = `c`.`Client ID PK`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `appointmentclientview`
--

/*!50001 DROP VIEW IF EXISTS `appointmentclientview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointmentclientview` AS select `a`.`Appointment ID PK` AS `appointment_id`,`c`.`FirstName` AS `client_first_name`,`c`.`LastName` AS `client_last_name`,cast(`a`.`Time` as date) AS `appointment_date`,`a`.`Time` AS `appointment_time`,`a`.`Status` AS `status` from (`appointment` `a` left join `client` `c` on((`a`.`Client ID FK` = `c`.`Client ID PK`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-21 16:41:16
