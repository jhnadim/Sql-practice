Some tables and data for the exercises

        The PERSON table content:

             id last    first   phone  city        address
             ----------------------------------------------
             1  Doe     John    1      New York    12th Street
             2  Jordan  Mike    2      Washington  South Park Bd 3
             3  Durak   Stephen 3      Florida     Sea Drive 112

        The PHONE table content:

            id  number         comment
            ---------------------------
            1   +1 111 222 333  work
            2   +1 222 333 333  work
            3   +1 333 444 555  home

        The LECTURER table content:

            id  name         course
            -----------------------
            1   John Doe      1
            2   Jane Doe      2
            3   Richard Roe   3

        The COURSE table content:

            id  credits date_begin  duration description
            -------------------------------------
            1   3       2020-01-10  9        Economy
            2   5       2020-02-15  15       Mathematics
            3   2       2020-02-20  6        Biology

        The TRACK ARTIST ALBUM ALBUM_RRACK contents:

            * TRACK
            id name                    artist
            -----------------------------------------
            1  Hound Dog               1
            2  Unforgettable           2
            3  Rock around the clock   3

            * ARTIST
            id name
            ---------------
            1 Elvis Presley
            2 Nat King Cole
            3 Bill Haley

            * ALBUM_TRACKS
            track album
            --------------
            1     1
            1     2
            2     3

            * ALBUM
            id name              year label
            -------------------------------
            1  Elvis Presley     1966 RCA Victor
            2  Best of Elvis     2001 RCA Victor
            3  Nat and his piano 2010 Decca

        The TEAM table content:

            coach_last coach_first team_name   owner
            ------------------------------------------
            Doe        John        Liverpool   owner1
            Doe        Jane        Macheter    owner2
            Richards   Jenny       Scotch      owner3

        The WEATHER table content:

            time_of_reading  high low observer Comment
            -------------------------------------------------------------
            2000-12-11 11:00 +5   +2  MK       snow-rain for a while
            2000-12-12 11:00 +4   +3  ES       Strong wind
            2000-12-15 11:00 +2   +0  RD       Night was cold and misty
            2000-12-14 10:00 +7   +12 MK       Rainy day

        The INVENTORY table content:

            item        worth       comment
            ------------------------------------
            baseball    150         My first baseball
            bike        2000        For mountain riding
            playcards   10          Funny pictures

1.0 Referential integrity constraints (FK)

        Create tables and their primary and foreign key
        constraints, Write statements that verify
        correctness of foreign key constraints, so that
        data is not allowed unless the condition is met.

        For each answer:

        - Write CREATE TABLE
        - Write 3 INSERT statement to each tables in correct order.
        - Write INSERT statement(s) that demonstrate
          the failures: violation of the foreign key constraint(s).

        An example for 1.1

            CREATE TABLE person
            (
                  ...
            );

            CREATE TABLE phone
            (
                  ...
            );

            -- Not like this: FK violation.
            -- Should fail because there is no phone with id 1 defined in the "phone" table
            INSERT INTO person
                (id, first, last, phone)
            VALUES
                (1, 'John', 'Doe', 1)
            ;

            -- FK success.
            -- Insert into PHONE table first, then into PERSON table.
            INSERT INTO phone
                (id, number)
            VALUES
                (1, '+1 222 333')
            ;

            INSERT INTO person
                (id, first, last, phone)
            VALUES
                (1, 'John', 'Doe', 1)
            ;

    1.1 Foreign keys between PERSON and PHONE

            PERSON      PHONE
            id      +-> id
            last    |   number
            first   |   comment
            phone --+
            city
            address

    1.2 Foreign keys between LECTURER and COURSE

            LECTURER     COURSE
            id       +-> id
            name     |   credits
            course --+   begin     (date)
                         duration  (weeks)
                         name

    1.3 Foreign keys between TRACK, ARTIST and ALBUM

             TRACK       ARTIST
         +-> id      +-> id
         |   name    |   name
         |   artist -+
         |
         |   ALBUM_TRACKS
         +-  track           (PK, FK)
         +-  album           (PK, FK)
         |
         |
         |   ALBUM
         +-> id
             name
             year
             label

2.0 Domain constraint exercises

        Create tables and their appropriate domain
        constraints, which are used to verify correctness
        of the inserted values. Domain constraints are
        part of the database integrity checks.

        Remember to define PRIMARY KEY integrity check for
        each table.

        For each answer:

        - Write CREATE TABLE
        - Write INSERT statement(s) that demonstrate
          the failures: violation of the domain check constraint(s).

        An example for 1.1

            CREATE TABLE person
            (
                  <col> <type>
                  , <col> <type>
                  , <col> <type>
                  , CHECK ...
                  , CHECK ...
            );

            -- Fail: phone
            INSERT INTO person
                (age, phone, dob)
            VALUES
                ('+1 12', '1980-01-01')
            ;

            -- Fail: dob
            INSERT INTO person
                (age, phone, dob)
            VALUES
                ('+1 11 12 22', '1920-01-01')
            ;

    2.1 Domain constraints in PERSON table

        Insert information on *person:* name, phone,
        date of birth (dob). Define constraints for:

            PHONE NUMBER is longer than 5 characters
            DOB is later than year 1930

    2.2 Domain constraints in PRODUCT table

        Record information on *product:* name,
        description, weight, selling price, net price
        (purchase price).

        Define constraints for:

            NAME is longer than 4 characters
            DESCRIPTION is longer than 10 charcters
            WEIGHT is a positive number
            SELL PRICE is greater than 0
            NET PRICE is lower than sell price

    2.3 Domain constraints in PROJECT table

        Record information on *project:* project name, name of the
        manager, manager's phone number, manager's job title,
        Define constraints for:

            PROJECT NAME is longer than 5

            MANAGER's name is longer than 5

            JOB TITLE in only one of accepted values of:
                sales manager,
                office manager,
                facilities manager
                business manager

    2.4 Domain constraints in COURSE table

        Record information on *course*: credits, begin date, duration
        in weeks and course name. Define constraints for:

            DURATION must be positive integer and not zero

            CREDIT range is between 1..30, inclusive.

3.0 Index exercises for the PERSON AND PHONE tables

        Note: ensure that columns are NOT NULL before you
        try to create indexes from the columns.

    3.1 Index person 1

        Create an index using *first* name. Name
        the index: `users__first_index'.

    3.2 Index person 2

        Create an index using *last* name. Name the index:

            users__last_index

    3.3 Index phone

        In PHONE table, Create a unique index from phone *number*.
        Name the index: `phone__number_index'.

    3.4 Index remove

        Write SQL command file to remove all created
        indexes from the PERSON and PHONE tables.

4.0 Index exercises for the TEAM table

    4.1 Index team 1

        Create an index to table using the *team_name* column. Name
        the index with `team__name_index'.

    4.2 Index team 2

        Create an index to table using the *owner* column.
        Name the index with `team__owner_index'.

    4.3 Index team remove

        Write SQL command file to remove all created
        indexes from the TEAM table.

5.0 Index exercises for the WEATHER table

    5.1 Index weather 1

        Create an index to table using the *time_of_reading* column.
        Name the index with `weather__time_of_reading_index'.

    5.2 Index weather 2

        Create an index to table using the *high* value.
        Name the index with `weather__high_index'.

    5.3 Index weather 3

        Create an index to table using the *low* value.
        Name the index with `weather__low_index'.

    5.4 Index weather remove

        Write SQL command file to remove all created
        indexes from the WEATHER table.

6.0 Update exercises for the PERSON table

    6.1 Update 1

        Change John Doe's address to "21th Street".

    6.2 Update 2

         Change Mike Jordan't phone number to "+1 222 333 444".

    6.3 Update 3

        Change Stephen city to Denver.

    6.4 Update 4

        John Doe has moved to Miami.

7.0 Alter exercises for the INVENTORY table

    7.1 Alter 1

        Increase columnns *item* and *comment* sizes by 100
        characters.

    7.2 Alter 2

        Add attribute NOT NULL definition for the *item*
        column. This makes it possible to use the column
        as an index.

    7.3 Alter 3

        Remove attribute NOT NULL definition from the
        *item* column.

    7.4 Alter 4

        Modify *comment* column to use default value "No
        comment" in case of NULL value is inserted.

    7.5 Alter 5

        Rename table "inventory" to "inv".

End
