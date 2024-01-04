-- Author: Jobayel Hossain <jobayel.hossain@tuni.fi>
-- Date: 2023-10-21
-- File: 013-foreign-key-between-track-artist-and-album.sql

-- Create ARTIST table
CREATE TABLE ARTIST (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,      
    name VARCHAR(255) NOT NULL                    
);

-- Create ALBUM table
CREATE TABLE ALBUM (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,       
    name VARCHAR(255) NOT NULL,                   
    year INTEGER,                                 
    label VARCHAR(255)                            
);

-- Create TRACK table
CREATE TABLE TRACK (
    id INTEGER PRIMARY KEY NOT NULL UNIQUE,       
    name VARCHAR(255) NOT NULL,                   
    artist INTEGER NOT NULL,                      -- Foreign key referencing ARTIST.id
    FOREIGN KEY (artist) REFERENCES ARTIST(id)    -- Foreign key constraint
);

-- Create ALBUM_TRACKS table
CREATE TABLE ALBUM_TRACKS (
    track INTEGER NOT NULL,                       -- Foreign key referencing TRACK.id (Part of Composite Primary Key)
    album INTEGER NOT NULL,                       -- Foreign key referencing ALBUM.id (Part of Composite Primary Key)
    PRIMARY KEY (track, album),                    -- Composite Primary Key
    FOREIGN KEY (track) REFERENCES TRACK(id),     -- Foreign key constraint for TRACK
    FOREIGN KEY (album) REFERENCES ALBUM(id)      -- Foreign key constraint for ALBUM
);

-- Successful INSERTs
INSERT INTO ARTIST (id, name)
VALUES (1, 'Elvis Presley');                      -- Inserting data for Elvis Presley as an artist

INSERT INTO ALBUM (id, name, year, label)
VALUES (1, 'Elvis Presley', 1966, 'RCA Victor');  -- Inserting data for Elvis Presley's album

INSERT INTO TRACK (id, name, artist)
VALUES (1, 'Hound Dog', 1);                       -- Inserting data for the track 'Hound Dog' by Elvis Presley

INSERT INTO ALBUM_TRACKS (track, album)
VALUES (1, 1);                                   -- Linking track 'Hound Dog' to album 'Elvis Presley'

-- Failed INSERT
-- The artist value '2' does not exist in the ARTIST table
INSERT INTO TRACK (id, name, artist)
VALUES (2, 'Unforgettable', 2);                  -- Attempting to insert data for a track with a non-existing artist

-- End of file
