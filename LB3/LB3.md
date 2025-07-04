# Dokumentation zur Migration der Datenbank "Backpacker\_LB3"

**Name:** Gabriel Di Giuseppe
**Modul:** M141 – DB-Systeme in Betrieb nehmen

---

## 0. Anforderungsdefinition & Infrastruktur (SMART-Ziele)

* **Ziel:** Die Access-Datenbank "Backpacker" soll vollständig auf eine MySQL-Datenbank migriert werden.
* **Messbar:** Datenbankstruktur (DDL), Daten (DML), Berechtigungen (DCL) und Testdaten werden erfolgreich migriert und getestet.
* **Akzeptiert:** Die neue Datenbank erfüllt die gleiche Funktionalität wie das alte System.
* **Realistisch:** Lokale Entwicklung in XAMPP/MariaDB, danach Migration auf einen Cloud-Dienst (AWS)
* **Terminiert:** Abgabe innerhalb des Projektzeitraums inkl. Demo.

## 1. Lokale DBMS (XAMPP / MariaDB)

### 1.1 ERD in 2. Normalform

* Das ursprüngliche ERD wurde übernommen und bei Bedarf normalisiert.
* Fremdschlüssel-Beziehungen wurden überprüft und ggf. angepasst.

### 1.2 Zugriffsmatrix

Die Rechte wurden gemäss Vorgabe umgesetzt (siehe Tabelle in Projektauftrag).

### 1.3 Zugriffsberechtigungen (Benutzer & Rollen)

* Benutzer wurden erstellt: `Gabriel (Benutzer)`, `Gabriel (Management)`
* Rollen: `Benutzer`, `Management`
* Berechtigungen wurden mit GRANT umgesetzt

### 1.4 Datenimport und Bereinigung

* **Quellen:** CSV-Dateien aus Access-Export
* **Validierung:**

  * Zeichensatz auf UTF-8 geprüft und ggf. konvertiert
  * `Land_FS` in `tbl_buchung` auf gültige IDs geprüft, ungültige auf NULL gesetzt
  * Duplikate in `tbl_land` entfernt
  * Datumsformate vereinheitlicht (ISO 8601)
* **Import:** Mittels `LOAD DATA LOCAL INFILE` mit benutzerdefiniertem Mapping
* **Passwörter:** Nach dem Import mittels SHA2 gehasht

### 1.5 Testen (Lokal)

* Alle Tabellen erfolgreich befüllt
* Fremdschlüssel validiert

```sql
SELECT p.Vorname, p.Name, COUNT(b.Buchungs_ID) AS Buchungen
FROM tbl_personen p
LEFT JOIN tbl_buchung b ON p.Personen_ID = b.Personen_FS
GROUP BY p.Personen_ID;
```

---

## 2. Cloud-DBMS

### 2.1 Setup

* Cloud-Dienst: AWS
* Datenbank erstellt mit gleichem DDL wie lokal

---

## 3. Automatisierte Migration

### 3.1 Berechtigungen übertragen

* Alle DCL-Befehle (GRANT etc.) in Scriptform gespeichert und auf Cloud ausgeführt

### 3.2 Daten übertragen

* DDL- und DML-Skripte in `.sql` Dateien gespeichert
* Migration über Workbench durchgeführt

### 3.3 Testen in Cloud

* Beispielabfragen durchgeführt
* Datenkonsistenz validiert

---

## 4. Protokollierung

| Tag | Aufgabe                  | Tools / Dateien      | Resultat       |
| --- | ------------------------ | -------------------- | -------------- |
| 1   | Import lokal vorbereiten | VSCode, Excel, XAMPP | CSVs bereinigt |
| 2   | Struktur lokal umgesetzt | SQL                  | DB erstellt    |
| 3   | Datenimport lokal        | SQL-Skripte          | erfolgreich    |
| 4   | Rechte lokal getestet    | SQL                  | Screenshots    |
| 5   | Cloud-Instanz aufgesetzt | AWS                  | erreichbar     |
| 6   | Migration Cloud          | Workbench            | erfolgreich    |
| 7   | Test & Abschluss         | SQL + Testscript     | ready          |

---

## Anhang (Links / Scripte / Dateien)

* SQL-Dump [Datanbankstruktur_neu](Datenbankstruktur_neu.sql)
* CSV-Dateien (bereinigt): [csvs](csvs)
* IP zu Cloud-Datenbank: 44.193.145.98

---

**Erstellt von:** Gabriel Di Giuseppe
**Datum:** 01.07.2025