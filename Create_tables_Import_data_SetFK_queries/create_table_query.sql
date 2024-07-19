DROP database if exists Librarymanagement;
CREATE DATABASE if not exists LibraryManagement;
USE LibraryManagement;

-- DROP table if exists book_data;
CREATE TABLE `book_data` (
  `ISBN` bigint(20) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Author` varchar(45) DEFAULT NULL,
  `Year` year(4) DEFAULT NULL,
  `No_of_actual_copy` int(11) DEFAULT NULL,
  `No_of_current_copy` int(11) DEFAULT NULL,
  `Genre_ID` int(11) DEFAULT NULL,
  `Shelf_ID` int(11) DEFAULT NULL,
  `Rating` varchar(10) DEFAULT NULL,
  `Recommendation_label_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ISBN`));
  
  -- DROP table if exists borrow_detail;
  CREATE TABLE `borrow_detail` (
  `ID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `ISBN` bigint(20) DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `deadline_return_date` date DEFAULT NULL,
  `borrow_status_ID` int(11) DEFAULT NULL,
  `staff_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists borrow_status_info;
  CREATE TABLE `borrow_status_info` (
  `ID` int(11) NOT NULL,
  `borrow_status` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists customer_info;
  CREATE TABLE `customer_info` (
  `ID` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists genre_info;
  CREATE TABLE `genre_info` (
  `ID` int(11) NOT NULL,
  `Genre` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists position;
  CREATE TABLE `position` (
  `ID` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists recommendation_labels;
  CREATE TABLE `recommendation_labels` (
  `ID` int(11) NOT NULL,
  `recommendation_label` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists shelf_info;
  CREATE TABLE `shelf_info` (
  `ID` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  PRIMARY KEY (`ID`));
  
  -- DROP table if exists staff_info;
  CREATE TABLE `staff_info` (
  `ID` int(11) NOT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `d.o.b` date DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `position_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`));

