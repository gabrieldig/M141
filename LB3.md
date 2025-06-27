> Return ->[README.md](README.md)

# LB3 SMART
Bis zum Abgabetermin soll eine relationale Datenbankstruktur der Access-Datenbank „Backpacker“ erfolgreich in eine produktive Cloud-Datenbankumgebung (MariaDB) migriert werden. Die Migration umfasst Designvalidierung, Datenimport, Rechteverwaltung sowie automatisierte Skripte für Migration und Test.

## Grants
```sql

CREATE ROLE 'Management';

GRANT SELECT ON backpacker_lb3.tbl_positionen TO 'Management';
GRANT SELECT ON backpacker_lb3.tbl_buchung TO 'Management';

GRANT SELECT, INSERT, UPDATE, DELETE ON backpacker_lb3.tbl_personen TO 'Management';
GRANT SELECT, INSERT, UPDATE, DELETE ON backpacker_lb3.tbl_land TO 'Management';
GRANT SELECT, INSERT, UPDATE, DELETE ON backpacker_lb3.tbl_leistung TO 'Management';
GRANT SELECT, INSERT, UPDATE, DELETE ON backpacker_lb3.tbl_benutzer TO 'Management';

```