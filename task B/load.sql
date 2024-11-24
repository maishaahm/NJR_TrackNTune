INSERT INTO member(NetID, Fname, Lname, Pronouns, Class_Year, Preferred_Genre, Arrangements) VALUES
('esalomo2', 'Eva', 'Salomone', 'She/Her', 2026, 'Rock',1),
('lshaw33', 'Liv', 'Shaw', 'They/Them', 2026, 'Metal',0),
('alexwilky', 'Alex', 'Wilky', 'She/Her', 2028, 'Hip Hop',0),
('isbri11', 'Isabella', 'Briggs', 'She/They', 2025, 'Indie',1),
('anjram3', 'Anjali', 'Ramdin', 'She/Her', 2026, 'Latin',1),
('carljo55', 'Carl', 'Jone', 'He/Him', 2026, 'Pop',1),
('silvrose9', 'Silvia', 'Rosenbloom', 'She/Her', 2027, 'Rock',0),
('carljo10', 'Carlie', 'Jones', 'She/Her', 2026, 'Latin',1),
('jercar', 'Jerry', 'Carter', 'He/Him', 2024, 'Hip Hop',1),
('akendrick', 'Anna', 'Kendrick', 'She/Her', 2028, 'Pop',1),
('lorensal', 'Lorenzo', 'Salomone', 'He/Him', 2023, 'Rock',0),
('ssmith100', 'Sam', 'Smith', 'They/Them', 2024, 'Folk',0),
('djames89', 'Dylan', 'James', 'He/Him', 2026, 'Metal',1),
('flindor', 'Francisco', 'Lindor', 'He/Him', 2027, 'Latin',0),
('mgreen4', 'Mason', 'Green', 'He/They', 2026, 'Indie',1);

INSERT INTO instrument(NetID, Instrument_Name, Is_Primary) VALUES
('esalomo2', 'Guitar', TRUE),
('esalomo2', 'Flute', FALSE),
('lshaw33', 'Electric Guitar', TRUE),
('alexwilky', 'Piano', TRUE),
('isbri11', 'Vocals', TRUE),
('isbri11', 'Piano', FALSE),
('carljo55', 'Drums', FALSE),
('jercar', 'Flute', TRUE),
('lorensal', 'Drums', TRUE),
('mgreen4', 'Vocals', TRUE),
('ssmith100', 'Guitar', TRUE);

INSERT INTO ensemble(NetID, Ensemble_Type, Semester, Instrument_Played) VALUES
('esalomo2', 'Rock', 'Fall 2023', 'Guitar'),
('lshaw33', 'Rock', 'Spring 2023', 'Drums'),
('isbri11', 'Indie', 'Fall 2024', 'Vocals'),
('jercar', 'Hip Hop', 'Spring 2020', 'Electric Guitar'),
('jercar', 'Pop', 'Spring 2020', 'Bass'),
('akendrick', 'Pop', 'Spring 2020', 'Vocals'),
('djames89', 'Folk', 'Fall 2024', 'Guitar');

INSERT INTO house_show(NetID, Semester, Instrument_Played) VALUES
('esalomo2', 'Fall 2024', 'Guitar'),
('esalomo2', 'Fall 2023', 'Guitar'),
('alexwilky', 'Fall 2024', 'Piano'),
('jercar', 'Spring 2022', 'Vocals'),
('djames89', 'Spring 2024', 'Drums'),
('mgreen4', 'Fall 2023', 'Electric Guitar'),
('mgreen4', 'Spring 2023', 'Electric Guitar');

INSERT INTO big_show(NetID, Semester, Instrument_Played) VALUES
('esalomo2', 'Fall 2024', 'Guitar'),
('lshaw33', 'Fall 2023', 'Bass'),
('silvrose9', 'Fall 2024', 'Trombone'),
('jercar', 'Fall 2021', 'Tuba'),
('lorensal', 'Spring 2019', 'Drums'),
('mgreen4', 'Fall 2023', 'Bass'),
('mgreen4', 'Spring 2023', 'Bass');

INSERT INTO member_preferred_genre(NetID, Preferred_Genre) VALUES
('esalomo2', 'Rock'),
('lshaw33', 'Metal'),
('alexwilky', 'Hip Hop'),
('isbri11', 'Indie'),
('anjram3', 'Latin'),
('carljo55', 'Pop'),
('silvrose9', 'Rock'),
('carljo10', 'Latin'),
('jercar', 'Hip Hop'),
('akendrick', 'Pop'),
('lorensal', 'Rock'),
('ssmith100', 'Folk'),
('djames89', 'Metal'),
('flindor', 'Latin'),
('mgreen4', 'Indie');

INSERT INTO users (email, password, name) VALUES
('admin@u.rochester.edu', MD5('admin123'), 'Admin User'); -- Password: admin123










