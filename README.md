# Modul 141

# Tag 1 
Heute haben Ich die Lokale Umgebung bereitgestellt.

Dafür mussten wir folgende Sachen machen
- [x] **Xampp Installieren**
- [x] **Systemvariable hinzufügen**
    Dafür musste ich nur in die Systemvariablen gehen, dort auf Path drücken, und eine neue Pfad-Variable hinzufügen.
    ![Systemvariable](image.png)

- [x] **Mysql Benutzer Anlegen**
    Für den Benutzer musste ich mich als root ins mysql anmelden und einen neuen Benutzer anlegen, und rechte vergeben, und schlussendlich habe ich die Systemvariable, und den neuen Benutzer gleichzeitig probiert und es hat funktioniert.
    ![Benutzer & Variable testen](image-1.png)
## Task 1
| **Produkt**        | **Merkmale**                      | **Vorteile**              | **Nachteile**                    | **Anwendungsfälle**              |
| ------------------ | --------------------------------- | ------------------------- | -------------------------------- | -------------------------------- |
| **MariaDB**        | MySQL-kompatibel, Open Source     | Schnell, lizenzfrei       | Weniger kommerzielle Tools       | Webanwendungen, Open Source      |
| **MySQL (Oracle)** | Weit verbreitet, einfache Nutzung | Viele Tools, bekannt      | Kommerzielle Nutzung kostet      | LAMP-Stacks, CMS                 |
| **MS-SQL**         | Microsoft, proprietär             | Gute Windows-Integration  | Lizenzkosten, kaum Linux-Support | ERP, CRM, Business-Anwendungen   |
| **PostgreSQL**     | Sehr zuverlässig, erweiterbar     | Stark bei komplexen Daten | Höhere Lernkurve                 | Wissenschaft, Geodaten (PostGIS) |
## Task2
| **Datenbankmodell** | **Produkt(e)**       | **Vor-/Nachteile**                                                                                               | **typ. Anwendungen**                              | **Bild, Bsp, Link, etc**                             |
| ------------------- | -------------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- | ---------------------------------------------------- |
| **Document**        | MongoDB              | ✅ Flexibles Schema, gut skalierbar<br>❌ Schwächer bei komplexen Joins                                            | CMS, E-Commerce, JSON-APIs                        | [mongodb.com](https://www.mongodb.com)               |
| **Key-Value**       | Redis                | ✅ Extrem schnell, ideal für Cache<br>❌ Datenstruktur begrenzt                                                    | Caching, Sessions, Echtzeit-Statistiken           | [redis.io](https://redis.io)                         |
| **Wide Column**     | Apache Cassandra     | ✅ Hohe Schreiblast, skalierbar<br>❌ Komplex bei Queries, eingeschränkte Joins                                    | IoT, Zeitreihen, Logging                          | [cassandra.apache.org](https://cassandra.apache.org) |
| **Search**          | Elasticsearch        | ✅ Leistungsstarke Volltextsuche<br>❌ Ressourcenintensiv, komplexes Setup                                         | Logs, Website-Suche, Monitoring                   | [elastic.co](https://www.elastic.co)                 |
| **Graph**           | Neo4j                | ✅ Ideal für Beziehungen & Netzwerkstrukturen<br>❌ Eingeschränkte Skalierbarkeit bei großen Graphen               | Social Media, Empfehlungssysteme, Fraud Detection | [neo4j.com](https://neo4j.com)                       |
| **Time Series**     | InfluxDB             | ✅ Hohe Ingest-Leistung, speziell für Zeitdaten<br>❌ Weniger relational, hoher Speicherbedarf bei hoher Auflösung | Monitoring, Sensoren, IoT                         | [influxdata.com](https://www.influxdata.com)         |
| **Spatial**         | PostGIS (PostgreSQL) | ✅ Mächtig bei Geodaten, SQL-basiert<br>❌ Komplexer Einstieg, GIS-Wissen erforderlich                             | GIS, Karten, Standortdatenanalyse                 | [postgis.net](https://postgis.net)                   |

# Tag 2
![alt text](image-2.png)