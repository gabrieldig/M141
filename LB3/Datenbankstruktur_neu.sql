DROP DATABASE IF EXISTS backpacker_lb3;
CREATE DATABASE backpacker_lb3 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE backpacker_lb3;

 
 -- Tabelle: tbl_personen
 
CREATE TABLE tbl_personen (
  Personen_ID INT NOT NULL PRIMARY KEY,
  Titel VARCHAR(100),
  Vorname VARCHAR(50),
  Name VARCHAR(100),
  Strasse VARCHAR(100),
  PLZ VARCHAR(20),                           jetzt grosszügiger
  Ort VARCHAR(100),
  Anrede VARCHAR(150),
  Telefon VARCHAR(50),
  erfasst VARCHAR(25),                       statt DATETIME, da einige Werte ungültig sind
  Sprache VARCHAR(20)                        erhöht wegen Zeile 7 (z. B. "deutsch", "französisch")
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

 
 -- Tabelle: tbl_land
 
CREATE TABLE tbl_land (
  Land_ID INT NOT NULL PRIMARY KEY,
  Land VARCHAR(100) NOT NULL
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
 
 -- Tabelle: tbl_leistung
 
CREATE TABLE tbl_leistung (
  LeistungID INT NOT NULL PRIMARY KEY,
  Beschreibung VARCHAR(100) NOT NULL
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

 
 -- Tabelle: tbl_benutzer
 
CREATE TABLE tbl_benutzer (
  Benutzer_ID INT AUTO_INCREMENT PRIMARY KEY,
  Benutzername VARCHAR(50) UNIQUE NOT NULL,
  PasswortHash VARCHAR(255) NOT NULL,
  Vorname VARCHAR(50),
  Name VARCHAR(50),
  Benutzergruppe TINYINT DEFAULT 1,
  erfasst TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  deaktiviert DATE DEFAULT NULL,
  aktiv TINYINT DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 
 -- Tabelle: tbl_buchung
 
CREATE TABLE tbl_buchung (
  Buchungs_ID INT NOT NULL PRIMARY KEY,
  Personen_FS INT NOT NULL,
  Ankunft VARCHAR(25),
  Abreise VARCHAR(25),
  Land_FS INT
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

 Indexe für tbl_buchung
CREATE INDEX idx_buchung_personen ON tbl_buchung(Personen_FS);
CREATE INDEX idx_buchung_land ON tbl_buchung(Land_FS);

 
 -- Tabelle: tbl_positionen
 
CREATE TABLE tbl_positionen (
  Positions_ID INT AUTO_INCREMENT PRIMARY KEY,
  Buchungs_FS INT NOT NULL,
  Leistung_FS INT NULL,   < angepasst
  Benutzer_FS INT,
  Konto INT NOT NULL DEFAULT 0,
  Anzahl INT NOT NULL DEFAULT 1,
  Preis DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  Rabatt DECIMAL(4,2) NOT NULL DEFAULT 0.00,
  erfasst DATETIME DEFAULT CURRENT_TIMESTAMP,
  Leistung_Text VARCHAR(100),
  FOREIGN KEY (Buchungs_FS) REFERENCES tbl_buchung(Buchungs_ID)
    ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Leistung_FS) REFERENCES tbl_leistung(LeistungID)
    ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (Benutzer_FS) REFERENCES tbl_benutzer(Benutzer_ID)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

 Index für tbl_positionen
CREATE INDEX idx_positionen_buchung ON tbl_positionen(Buchungs_FS);
CREATE INDEX idx_positionen_leistung ON tbl_positionen(Leistung_FS);
CREATE INDEX idx_positionen_benutzer ON tbl_positionen(Benutzer_FS);
