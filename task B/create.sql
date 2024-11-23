CREATE TABLE member (
    NetID VARCHAR(255) NOT NULL,
    Fname VARCHAR(255) NOT NULL,
    Lname VARCHAR(255) NOT NULL,
    Pronouns VARCHAR(255),
    Class_Year INT NOT NULL,
    Preferred_Genre VARCHAR(255),
    Arrangements BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (NetID)
);

CREATE TABLE instrument (
    NetID VARCHAR(255) NOT NULL,
    Instrument_Name VARCHAR(255) NOT NULL,
    Is_Primary BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (NetID, Instrument_Name),
    FOREIGN KEY (NetID) REFERENCES member (NetID) ON DELETE CASCADE
);

CREATE TABLE ensemble (
    NetID VARCHAR(255) NOT NULL,
    Ensemble_Type VARCHAR(255) NOT NULL,
    Semester VARCHAR(255) NOT NULL,
    Instrument_Played VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (NetID, Ensemble_Type, Semester),
    FOREIGN KEY (NetID) REFERENCES member (NetID) ON DELETE CASCADE
);

CREATE TABLE house_show (
    NetID VARCHAR(255) NOT NULL,
    Semester VARCHAR(255) NOT NULL,
    Instrument_Played VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (NetID, Semester),
    FOREIGN KEY (NetID) REFERENCES member (NetID) ON DELETE CASCADE
);

CREATE TABLE big_show (
    NetID VARCHAR(255) NOT NULL,
    Semester VARCHAR(255) NOT NULL,
    Instrument_Played VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (NetID, Semester),
    FOREIGN KEY (NetID) REFERENCES member (NetID) ON DELETE CASCADE
);

CREATE TABLE member_preferred_genre (
    NetID VARCHAR(255) NOT NULL,
    Preferred_Genre VARCHAR(255) NOT NULL,
    PRIMARY KEY (NetID, Preferred_Genre),
    FOREIGN KEY (NetID) REFERENCES member (NetID) ON DELETE CASCADE
);
