USE librarymanagement;

ALTER TABLE borrow_detail
ADD CONSTRAINT book_data_ISBN_ISBN
FOREIGN KEY (ISBN) REFERENCES book_data(ISBN);

ALTER TABLE borrow_detail
ADD CONSTRAINT customer_info_ID
FOREIGN KEY (customer_ID) REFERENCES customer_info(ID);

ALTER TABLE borrow_detail
ADD CONSTRAINT borrow_status_info_ID
FOREIGN KEY (borrow_status_ID) REFERENCES borrow_status_info(ID);

ALTER TABLE borrow_detail
ADD CONSTRAINT staff_info_ID
FOREIGN KEY (staff_ID) REFERENCES staff_info(ID);

ALTER TABLE book_data
ADD CONSTRAINT genre_info_ID
FOREIGN KEY (Genre_ID) REFERENCES genre_info(ID);


ALTER TABLE book_data
ADD CONSTRAINT shelf_info_ID
FOREIGN KEY (Shelf_ID) REFERENCES shelf_info(ID);

ALTER TABLE book_data
ADD CONSTRAINT recommendation_ID
FOREIGN KEY (Recommendation_label_ID) REFERENCES recommendation_labels(ID);

ALTER TABLE `librarymanagement`.`staff_info` 
ADD INDEX `position_ID_idx` (`position_ID` ASC) VISIBLE;
;
ALTER TABLE `librarymanagement`.`staff_info` 
ADD CONSTRAINT `position_ID`
  FOREIGN KEY (`position_ID`)
  REFERENCES `librarymanagement`.`position` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;