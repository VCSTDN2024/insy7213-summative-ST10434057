--Create VOLUNTEERS table
CREATE TABLE volunteers (
  VOLD_ID      VARCHAR2(10) PRIMARY KEY,
  VOL_FNAME   VARCHAR2(50) NOT NULL,
  VOL_SNAME   VARCHAR2(50) NOT NULL,
  CONTACT     VARCHAR2(20),
  ADDRESS     VARCHAR2(200),
  EMAIL       VARCHAR2(100)
);

--Create DONORS table
CREATE TABLE donors (
  DONOR_ID    VARCHAR2(10) PRIMARY KEY,
  DONOR_FNAME VARCHAR2(50) NOT NULL,
  DONOR_LNAME VARCHAR2(50) NOT NULL,
  CONTACT_NO  VARCHAR2(20),
  EMAIL       VARCHAR2(100)
);

--Create BIKES table
CREATE TABLE bikes (
  BIKE_ID     VARCHAR2(10) PRIMARY KEY,
  DESCRIPTION VARCHAR2(200),
  BIKE_TYPE   VARCHAR2(50),
  MANUFACTURER VARCHAR2(100)
);

--Create DONATIONS table
CREATE TABLE donations (
  DONATION_ID   NUMBER PRIMARY KEY,
  DONOR_ID      VARCHAR2(10) NOT NULL,
  BIKE_ID       VARCHAR2(10) NOT NULL,
  Value         NUMBER(10,2) CONSTRAINT chk_value_positive CHECK (value > 0),
  VOLUNTEER_ID  VARCHAR2(10) NOT NULL,
  donation_date DATE,
  CONSTRAINT fk_donor FOREIGN KEY (donor_id) REFERENCES donors(donor_id),
  CONSTRAINT fk_bike  FOREIGN KEY (bike_id)  REFERENCES bikes(bike_id),
  CONSTRAINT fk_vol   FOREIGN KEY (volunteer_id) REFERENCES volunteers(vol_id)
);

--Insert data into VOLUNTEERS
INSERT INTO volunteers (vol_id, vol_fname, vol_sname, contact, address, email) VALUES ('vol101','Kenny','Temba','0677277521','10 Sands Road','kennyt@bikerus.com');
INSERT INTO volunteers (vol_id, vol_fname, vol_sname, contact, address, email) VALUES ('vol102','Mamelodi','Marks','0737377522','20 Langes Street','mamelodim@bikerus.com');
INSERT INTO volunteers (vol_id, vol_fname, vol_sname, contact, address, email) VALUES ('vol103','Ada','Andrews','0817117523','31 Williams Street','adanyaa@bikerus.com');
INSERT INTO volunteers (vol_id, vol_fname, vol_sname, contact, address, email) VALUES ('vol104','Evans','Tambala','0697215244','1 Free Road','evanst@bikerus.com');
INSERT INTO volunteers (vol_id, vol_fname, vol_sname, contact, address, email) VALUES ('vol105','Xolani','Samson','0727122255','12 main road','xolanis@bikerus.com');

--Insert data into DONORS
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID11','Jeff','Wanya','0827172250','wanyajeff@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID12','Sthembeni','Pisho','0837865670','sthepisho@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID13','James','Temba','0878978650','jimmy@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID14','Luramo','Misi','0826575650','luramom@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID15','Abraham','Xolani','0797656430','axolani@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID16','Rumi','Jones','0668899221','rjones@true.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID17','Xolani','Redo','0614553389','xredo@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID18','Tenny','Stars','0824228870','tenstars@true.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID19','Tiny','Rambo','0715554333','trambo@ymail.com');
INSERT INTO donors (donor_id, donor_fname, donor_lname, contact_no, email) VALUES ('DID20','Yannick','Leons','0615554323','yleons@true.com');

--Insert data into BIKES
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B001','BMX AX1','Road Bike','BMX');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B002','Giant Domain 1','Road Bike','Giant');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B003','Ascent 26In','Mountain Bike','Raleigh');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B004','Canyon 6X','Kids Bike','Canyon');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B005','Marvel','Gravel Road Bike','BMX');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B006','Mountain 21 Speed','Mountain Bike','BMX');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B007','Canyon Roadster','Road Bike','Canyon');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B008','Legion 101','Hybrid Bike','BMX');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B009','Madonna 9','Road Bike','Trek');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B010','Comp 2022','Mountain Bike','Trek');
INSERT INTO bikes (bike_id, description, bike_type, manufacturer) VALUES ('B011','BMX AX15','Road Bike','BMX');

--Insert data into DONATIONS
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (1,'DID11','B001',1500,'vol101', TO_DATE('01-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (2,'DID12','B002',2500,'vol101', TO_DATE('03-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (3,'DID13','B003',1000,'vol103', TO_DATE('03-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (4,'DID14','B004',1750,'vol105', TO_DATE('05-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (5,'DID15','B006',2000,'vol101', TO_DATE('07-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (6,'DID16','B007',1800,'vol105', TO_DATE('09-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (7,'DID17','B008',1500,'vol101', TO_DATE('15-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (8,'DID18','B009',1500,'vol103', TO_DATE('19-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (9,'DID12','B010',2500,'vol103', TO_DATE('25-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (10,'DID20','B005',3500,'vol105', TO_DATE('05-MAY-2023','DD-MON-YYYY'));
INSERT INTO donations (donation_id, donor_id, bike_id, value, volunteer_id, donation_date) VALUES (11,'DID19','B011',2500,'vol103', TO_DATE('30-MAY-2023','DD-MON-YYYY'));

-- 10. Finalize
COMMIT;
