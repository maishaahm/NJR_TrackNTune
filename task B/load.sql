INSERT INTO member(NetID, Fname, Lname, Pronouns, Class_Year, Preferred_Genre) VALUES
('esalomo2', 'Eva', 'Salomone', 'She/Her', 2026, 'Rock'),
('lshaw33', 'Liv', 'Shaw', 'They/Them', 2026, 'Metal'),
('alexwilky', 'Alex', 'Wilky', 'She/Her', 2028, 'Hip Hop'),
('isbri11', 'Isabella', 'Briggs', 'She/They', 2025, 'Indie'),
('anjram3', 'Anjali', 'Ramdin', 'She/Her', 2026, 'Latin'),
('carljo55', 'Carl', 'Jone', 'He/Him', 2026, 'Pop'),
('silvrose9', 'Silvia', 'Rosenbloom', 'She/Her', 2027, 'Rock'),
('carljo10', 'Carlie', 'Jones', 'She/Her', 2026, 'Latin'),
('jercar', 'Jerry', 'Carter', 'He/Him', 2024, 'Hip Hop'),
('akendrick', 'Anna', 'Kendrick', 'She/Her', 2028, 'Pop'),
('lorensal', 'Lorenzo', 'Salomone', 'He/Him', 2023, 'Rock'),
('ssmith100', 'Sam', 'Smith', 'They/Them', 2024, 'Folk'),
('djames89', 'Dylan', 'James', 'He/Him', 2026, 'Metal'),
('flindor', 'Francisco', 'Lindor', 'He/Him', 2027, 'Latin'),
('mgreen4', 'Mason', 'Green', 'He/They', 2026, 'Indie');

INSERT INTO instrument(NetID, Instrument_Name, Is_Primary) VALUES
('esalomo2', 'Guitar', TRUE),
('esalomo2', 'Bass', FALSE),
('lshaw33', 'Electric Guitar', TRUE),
('alexwilky', 'Piano', TRUE),
('isbri11', 'Vocals', TRUE),
('isbri11', 'Piano', FALSE),
('carljo55', 'Drums', FALSE),
('jercar', 'Recorder', TRUE),
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










