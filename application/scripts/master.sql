DROP DATABASE cheapskate;
CREATE DATABASE cheapskate;
USE cheapskate;

CREATE TABLE venue (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(100) NOT NULL,
    venueTypeId int(11) NOT NULL,
    locationNum int(5) NOT NULL,
    city varchar(100) NOT NULL default 'Saint John',
    province varchar(2) NOT NULL default 'NB',
    address1 varchar(100) NOT NULL,
    address2 varchar(100) NULL,
    googleMapLocationId varchar(30) NULL,
    latitude varchar(20) NULL,
    longitude varchar(20) NULL,
    phone varchar(12) NULL,
    email varchar(100) NULL,
    website varchar(200) NULL,
    facebook varchar(200) NULL,
    twitter varchar(100) NULL,
    instagram varchar(100) NULL,
    hipFactor int(1) default 0,
    scaryFactor int(1) default 0,
    classFactor int(1) default 0,
    trashFactor int(1) default 0,
    hasLiveMusic tinyint(1) default 0,
    musicType int(10) NULL,
    promoterId int(11) NULL,
    status varchar(100) NULL
) ENGINE=INNODB;

CREATE TABLE event (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dealId int(11) NULL,
    eventTypeId int(11) NOT NULL,
    venueId int(11) NOT NULL,
    `name` varchar(255) NOT NULL,
    info text NULL,
    submittedById int(11) NOT NULL,
    coverCost varchar(10) NULL,
    coverTypeId int(11) NOT NULL,
    INDEX venue_ind (venueId),
    FOREIGN KEY (venueId) 
        REFERENCES venue(id)
        ON DELETE CASCADE
    
) ENGINE=INNODB;

CREATE TABLE deal (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    eventId int(11) NOT NULL,
    dealTypeId int(11) NOT NULL,
    `name` varchar(255) NOT NULL,
    info text NULL,
    timeStart varchar(100),
    timeEnd varchar(100),
    INDEX event_ind (eventId),
    FOREIGN KEY (eventId) 
        REFERENCES event(id)
        ON DELETE CASCADE
    
) ENGINE=INNODB;

CREATE TABLE venueType (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(100) NOT NULL,
    info text NULL
) ENGINE=INNODB;

CREATE TABLE dealType (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(100) NOT NULL,
    info text NULL,
    frequencyId int(11) default 0
) ENGINE=INNODB;

CREATE TABLE frequencyType (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    info text NULL
);

CREATE TABLE coverType (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(100) NOT NULL,
    info text NULL
) ENGINE=INNODB;

CREATE TABLE `user` (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userName varchar(100) NOT NULL,
    nameFirst varchar(100) NOT NULL,
    nameLast varchar(100) NOT NULL,
    dob date NULL,
    city varchar(100) NOT NULL default 'Saint John',
    province varchar(2) NOT NULL default 'NB',
    phone varchar(12) NULL,
    email varchar(100) NOT NULL,
    twitter varchar(100) NULL,
    getNotifications tinyint(1) default 0,
    lastLocationLat varchar(20) NULL,
    lastLocationLong varchar(20) NULL,
    travelType varchar(7) NULL default 'walking',
    unitType varchar(2) NOT NULL default 'KM',
    defaultDistanceRange int(5) NOT NULL default 10,
    password varchar(255) NULL,
    authToken varchar(255) NULL,
    lastSeen timestamp NULL,
    userRoleId int(11) NULL
) ENGINE=INNODB;

CREATE TABLE `role` (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `role` varchar(50) NOT NULL
) ENGINE=INNODB;

CREATE TABLE userRole (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userId int(11) NOT NULL,
    roleId int(11) NOT NULL,
    INDEX user_ind (userId),
        FOREIGN KEY (userId) 
            REFERENCES user(id)
            ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE venueHours (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    venueId int(11) NOT NULL,
    day int(1) NOT NULL default 0,
    startTime varchar(20) NULL,
    endTime varchar(20) NULL,
    startTimeSplit varchar(20) NULL,
    endTimeSplit varchar(20) NULL,
    closed tinyint(1) default 0,
    INDEX venue_ind (venueId),
    FOREIGN KEY (venueId) 
        REFERENCES venue(id)
        ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE eventType (
    id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    info text NULL
) ENGINE=INNODB;

CREATE TABLE userSession (
    sessionId varchar(40) default '0' NOT NULL,
    ipAddress varchar(45) default '0' NOT NULL,
    userAgent varchar(120) NOT NULL,
    lastActivity int(10) unsigned default 0 NOT NULL,
    userData text NOT NULL,
    PRIMARY KEY (sessionId),
    KEY `last_activity_ind` (`lastActivity`)
) ENGINE=INNODB;
