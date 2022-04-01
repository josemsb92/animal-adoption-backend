
CREATE TABLE pets(
    id uuid DEFAULT uuid_generate_v4 (),
    name varchar(255) NOT NULL,
    size SMALLINT, /1=SMALL // 2=MEDIUM // 3=BIG/
    gender SMALLINT /1=MALE // 2=FEMALE/,
    weightKg INT,
    rescuedAt DATE,
    birthday DATE,
    species SMALLINT/1=DOG // 2=CAT/,
    images VARCHAR(255), /url1.com, url2.com/
    description varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE adopters (
    id uuid DEFAULT uuid_generate_v4 (),
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    personalId VARCHAR(10) NOT NULL UNIQUE, /DNI/
    PRIMARY KEY (id)
);

CREATE TABLE state_adoption (
    id uuid DEFAULT uuid_generate_v4 (),
    idPet uuid,
    idAdopter uuid,
    adoptionStatus SMALLINT, /1=FREE, 2=RESERVED, 3=ADOPTED/
    PRIMARY KEY (id),
    FOREIGN KEY (idPet) REFERENCES pets(Id),
    FOREIGN KEY (idAdopter) REFERENCES adopters(Id)
);

CREATE TABLE bailouts (
    idRescue uuid DEFAULT uuid_generate_v4 (),
    idPet uuid,
    idShelter uuid,
    phone VARCHAR(30),
    email VARCHAR(100),
    appreciations VARCHAR(255),
    approbe SMALLINT,
    PRIMARY KEY (idRescue),
    FOREIGN KEY (idPet) REFERENCES pets(id),
    FOREIGN KEY (idShelter) REFERENCES shelters(idShelter)
);

CREATE TABLE shelters (
    idShelter uuid DEFAULT uuid_generate_v4 (),
    nameShelter VARCHAR(50),
    pass VARCHAR(50),
    phone VARCHAR(30) UNIQUE,
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (idShelter)
);
