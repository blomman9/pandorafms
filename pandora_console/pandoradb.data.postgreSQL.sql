-- Pandora FMS - the Flexible Monitoring System
-- ============================================
-- Copyright (c) 2011 Artica Soluciones Tecnologicas, http://www.artica.es
-- Please see http://www.pandorafms.org for full contribution list

-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation for version 2.
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

-- Database Data for Pandora FMS 3.2

-- PLEASE NO NOT USE MULTILINE COMMENTS 
-- Because Pandora Installer don't understand them
-- and fails creating database !!!


-- Dumping data for table "talert_commands"
--

INSERT INTO "talert_commands" VALUES (1,'eMail','Internal type', 'This alert send an email using internal Pandora FMS Server SMTP capabilities (defined in each server, using:\r\n_field1_ as destination email address, and\r\n_field2_ as subject for message. \r\n_field3_ as text of message.', 1);
INSERT INTO "talert_commands" VALUES (2,'Internal Audit','Internal type','This alert save alert in Pandora interal audit system. Fields are static and only _field1_ is used.', 1);
INSERT INTO "talert_commands" VALUES (3,'Pandora FMS Event','Internal type','This alert create an special event into Pandora FMS event manager.', 1);
INSERT INTO "talert_commands" VALUES (4,'Pandora FMS Alertlog','echo _timestamp_ pandora _agent_ _data_ _field1_ _field2_ >> /var/log/pandora/pandora_alert.log','This is a default alert to write alerts in a standard ASCII  plaintext log file in /var/log/pandora/pandora_alert.log\r\n', 0);
INSERT INTO "talert_commands" VALUES (5,'SNMP Trap','/usr/bin/snmptrap -v 1 -c trap_public 192.168.0.4 1.1.1.1.1.1.1.1 _agent_ _field1_','Send a SNMPTRAP to 192.168.0.4. Please review config and adapt to your needs, this is only a sample, not functional itself.', 0);
INSERT INTO "talert_commands" VALUES (6,'Syslog','logger -p daemon.alert Pandora Alert _agent_ _data_ _field1_ _field2_','Uses field1 and field2 to generate Syslog alert in facility daemon with "alert" level.', 0);
INSERT INTO "talert_commands" VALUES (7,'Sound Alert','/usr/bin/play /usr/share/sounds/alarm.wav','', 0);
INSERT INTO "talert_commands" VALUES (8,'Jabber Alert','echo _field3_ | sendxmpp -r _field1_ --chatroom _field2_','Send jabber alert to chat room in a predefined server (configure first .sendxmpprc file). Uses field3 as text message, field1 as useralias for source message, and field2 for chatroom name', 0);
INSERT INTO "talert_commands" VALUES (9,'SMS','sendsms _field1_ _field2_','Send SMS using the Pandora FMS standard SMS device, using smstools.  Uses field2 as text message, field1 as destination phone (include international prefix!)', 0);
SELECT setval('talert_commands_id_seq', (SELECT (SELECT MAX(id) FROM talert_commands)));

--
-- Dumping data for table "tconfig"
--
BEGIN WORK;
LOCK TABLE "tconfig";
INSERT INTO "tconfig" ("token", "value") VALUES 
('language','en_GB'),
('block_size','20'),
('days_purge','60'),
('days_delete_unknown','0'),
('days_compact','15'),
('graph_res','5'),
('step_compact','1'),
('db_scheme_version','4.0-dev'),
('db_scheme_build','PD110122'),
('show_unknown','0'),
('show_lastalerts','1'),
('style','pandora'),
('remote_config', '/var/spool/pandora/data_in'),
('graph_color1', '#38B800'),
('graph_color2', '#42D100'),
('graph_color3', '#89FF09'),
('sla_period', '604800'),
('trap2agent', '0'),
('date_format', 'F j, Y, g:i a'),
('event_view_hr', 8),
('loginhash_pwd', ''),
('trap2agent', 0),
('prominent_time', 0),
('timesource', 'system'),
('realtimestats', '1'),
('stats_interval', '60'),
('activate_gis', '0'),
('timezone', 'Europe/Berlin'),
('string_purge', 7),
('audit_purge', 15),
('trap_purge', 7),
('event_purge', 15),
('gis_purge', 15),
('sound_alert', 'include/sounds/air_shock_alarm.wav'),
('sound_critical', 'include/sounds/Star_Trek_emergency_simulation.wav'),
('sound_warning', 'include/sounds/negativebeep.wav'),
('integria_enabled', '0'),
('integria_api_password', ''),
('integria_inventory', '0'),
('integria_url', '');
COMMIT WORK;


--
-- Dumping data for table "tconfig_os"
--
BEGIN WORK;
LOCK TABLE "tconfig_os";
INSERT INTO "tconfig_os" VALUES 
(1,'Linux','Linux: All versions','so_linux.png'),
(2,'Solaris','Sun Solaris','so_solaris.png'),
(3,'AIX','IBM AIX','so_aix.png'),
(4,'BSD','OpenBSD, FreeBSD and Others','so_bsd.png'),
(5,'HP-UX','HP-UX Unix OS','so_hpux.png'),
(7,'Cisco','CISCO IOS','so_cisco.png'),
(8,'MacOS','MAC OS','so_mac.png'),
(9,'Windows','Microsoft Windows OS','so_win.png'),
(10,'Other','Other SO','so_other.png'),
(11,'Network','Pandora FMS Network Agent','network.png'),
(12,'Web Server','Web Server/Application','network.png'),
(13,'Octopods','Octopods Pandora FMS Hardware Agent','network.png'),
(14,'Embedded','Embedded device running a Pandora FMS agent','embedded.png'),
(15,'Android','Android agent','android.png');
COMMIT WORK;
SELECT setval('tconfig_os_id_os_seq', (SELECT (SELECT MAX(id_os) FROM tconfig_os)));

--
-- Dumping data for table "tgrupo"
--
BEGIN WORK;
LOCK TABLE "tgrupo";
INSERT INTO "tgrupo" ("id_grupo", "nombre", "icon", "parent", "propagate", "disabled", "custom_id", "id_skin")
VALUES 
(2,'Servers','server_database',0,0,0,'',1),
(4,'Firewalls','firewall',0,0,0,'',1),
(8,'Databases','database_gear',0,0,0,'',1),
(9,'Network','transmit',0,0,0,'',1),
(10,'Unknown','world',0,0,0,'',1),
(11,'Workstations','computer',0,0,0,'',1),
(12,'Applications','applications',0,0,0,'',1),
(13,'Web','world',0,0,0,'',1);
COMMIT WORK;
SELECT setval('tgrupo_id_grupo_seq', (SELECT (SELECT MAX(id_grupo) FROM tgrupo)));

--
-- Dumping data for table "tlanguage"
--
BEGIN WORK;
LOCK TABLE "tlanguage";
INSERT INTO "tlanguage" VALUES ('en_GB','English');
INSERT INTO "tlanguage" VALUES ('es','Español');
INSERT INTO "tlanguage" VALUES ('ar','العربية');
INSERT INTO "tlanguage" VALUES ('ast','Asturianu');
INSERT INTO "tlanguage" VALUES ('bn', 'বাংলা');
INSERT INTO "tlanguage" VALUES ('ca','Catalá');
INSERT INTO "tlanguage" VALUES ('cs','Česky');
INSERT INTO "tlanguage" VALUES ('da','Dansk');
INSERT INTO "tlanguage" VALUES ('de','Deutch');
INSERT INTO "tlanguage" VALUES ('eu','Euskara');
INSERT INTO "tlanguage" VALUES ('el','Ελληνικά');
INSERT INTO "tlanguage" VALUES ('fi','Suomi');
INSERT INTO "tlanguage" VALUES ('fr','Français');
INSERT INTO "tlanguage" VALUES ('gl','Galego');
INSERT INTO "tlanguage" VALUES ('he','עברית');
INSERT INTO "tlanguage" VALUES ('hi','हिन्दी');
INSERT INTO "tlanguage" VALUES ('hu','Magyar');
INSERT INTO "tlanguage" VALUES ('it','Italiano');
INSERT INTO "tlanguage" VALUES ('ja','日本語');
INSERT INTO "tlanguage" VALUES ('ko','한국어');
INSERT INTO "tlanguage" VALUES ('nl','Nederlands');
INSERT INTO "tlanguage" VALUES ('pl','Polski');
INSERT INTO "tlanguage" VALUES ('pt_BR','Português-Brasil');
INSERT INTO "tlanguage" VALUES ('pt','Português');
INSERT INTO "tlanguage" VALUES ('ro','Română');
INSERT INTO "tlanguage" VALUES ('ru','Русский');
INSERT INTO "tlanguage" VALUES ('sk','Slovenčina');
INSERT INTO "tlanguage" VALUES ('sl','Slovenščina');
INSERT INTO "tlanguage" VALUES ('sv','Svenska');
INSERT INTO "tlanguage" VALUES ('te','తెలుగు');
INSERT INTO "tlanguage" VALUES ('tr','Türkçe');
INSERT INTO "tlanguage" VALUES ('uk','Українська');
INSERT INTO "tlanguage" VALUES ('zh_CN','简化字');
INSERT INTO "tlanguage" VALUES ('zh_TW','簡化字');
COMMIT WORK;

--
-- Dumping data for table "tlink"
--
BEGIN WORK;
LOCK TABLE "tlink";
INSERT INTO "tlink" VALUES 
(1,'Pandora FMS Manual','https://openideas.info/wiki/index.php?title=Pandora'),
(2,'Pandora FMS','http://pandorafms.org'),
(3,'Report a bug','https://sourceforge.net/tracker/?func=add&amp;group_id=155200&amp;atid=794852'),
(4,'Suggest new feature','http://sourceforge.net/tracker/?group_id=155200&amp;atid=794855'),
(5,'Module library','http://pandorafms.org/?sec=community&amp;sec2=repository&amp;lng=es'),
(6,'Commercial support','http://pandorafms.com');
COMMIT WORK;
SELECT setval('tlink_id_link_seq', (SELECT (SELECT MAX(id_link) FROM tlink)));

--
-- Dumping data for table "tmodule_group"
--
BEGIN WORK;
LOCK TABLE "tmodule_group";
INSERT INTO "tmodule_group" VALUES 
(1,'General'),
(2,'Networking'),
(3,'Application'),
(4,'System'),
(5,'Miscellaneous'),
(6,'Performance'),
(7,'Database'),
(8,'Enviromental'),
(9,'Users');
COMMIT WORK;
SELECT setval('tmodule_group_id_mg_seq', (SELECT (SELECT MAX(id_mg) FROM tmodule_group)));

--
-- Dumping data for table "torigen"
--
INSERT INTO "torigen" VALUES 
('Operating System event'),
('Firewall records'),
('Database event'),
('Application data'),
('Logfiles'),
('Other data source'),
('Pandora FMS Event'),
('User report'),
('Unknown source');

--
-- Dumping data for table "ttipo_modulo"
--
-- Identifiers 30 and 31 are reserved for Enterprise data types
INSERT INTO "ttipo_modulo" VALUES 
(1,'generic_data',0,'Generic numeric','mod_data.png'),
(2,'generic_proc',1,'Generic boolean','mod_proc.png'),
(3,'generic_data_string',2,'Generic string','mod_string.png'),
(4,'generic_data_inc',0,'Generic numeric incremental','mod_data_inc.png'),

(6,'remote_icmp_proc',4,'Remote ICMP network agent, boolean data','mod_icmp_proc.png'),
(7,'remote_icmp',3,'Remote ICMP network agent (latency)','mod_icmp_data.png'),
(8,'remote_tcp',3,'Remote TCP network agent, numeric data','mod_tcp_data.png'),
(9,'remote_tcp_proc',4,'Remote TCP network agent, boolean data','mod_tcp_proc.png'),
(10,'remote_tcp_string',5,'Remote TCP network agent, alphanumeric data','mod_tcp_string.png'),
(11,'remote_tcp_inc',3,'Remote TCP network agent, incremental data','mod_tcp_inc.png'),
(15,'remote_snmp',3,'Remote SNMP network agent, numeric data','mod_snmp_data.png'),
(16,'remote_snmp_inc',3,'Remote SNMP network agent, incremental data','mod_snmp_inc.png'),
(17,'remote_snmp_string',5,'Remote SNMP network agent, alphanumeric data','mod_snmp_string.png'),
(18,'remote_snmp_proc',4,'Remote SNMP network agent, boolean data','mod_snmp_proc.png'), 
(21,'async_proc', 7, 'Asyncronous proc data', 'mod_async_proc.png'), 
(22,'async_data', 6, 'Asyncronous numeric data', 'mod_async_data.png'), 
(23,'async_string', 8, 'Asyncronous string data', 'mod_async_string.png'),
(24,'log4x',0,'Log4x','mod_log4x.png'),
(100,'keep_alive',-1,'KeepAlive','mod_keepalive.png');
SELECT setval('ttipo_modulo_id_tipo_seq', (SELECT (SELECT MAX(id_tipo) FROM ttipo_modulo)));

-- Categoria field is used to segregate several types
-- (plugin, agents, network) on their data
-- types, could be used or could be avoided and use directly primary key (id_tipo) 

--
-- Dumping data for table "tusuario"
--
INSERT INTO "tusuario" ("id_user", "fullname", "firstname", "lastname", "middlename", "password", "comments", "last_connect", "registered", "email", "phone", "is_admin", "flash_chart", "language") VALUES
('admin', 'Pandora', 'Pandora', 'Admin', '', '1da7ee7d45b96d0e1f45ee4ee23da560', 'Admin Pandora', 1232642121, 0, 'admin@example.com', '555-555-5555', 1, -1, 'default');

--
-- Dumping data for table "tusuario_perfil"
--
INSERT INTO "tusuario_perfil" VALUES (1,'admin',5,0,'admin',0);
SELECT setval('tusuario_perfil_id_up_seq', (SELECT (SELECT MAX(id_up) FROM tusuario_perfil)));

--
-- Dumping data for table "tperfil"
--
INSERT INTO "tperfil" VALUES (1,'Operator&#x20;&#40;Read&#41;',0,1,0,1,0,0,0,0,0,0),(2,'Operator&#x20;&#40;Write&#41;',1,1,0,1,0,0,0,0,0,0),(3,'Chief&#x20;Operator',1,1,1,1,0,0,0,0,1,0),(4,'Group&#x20;coordinator',1,1,1,1,1,1,1,0,0,0),(5,'Pandora&#x20;Administrator',1,1,1,1,1,1,1,1,1,1);
SELECT setval('tperfil_id_perfil_seq', (SELECT (SELECT MAX(id_perfil) FROM tperfil)));

INSERT INTO "tnews" ("id_news", "author", "subject", "text", "timestamp") VALUES (1,'admin','Welcome to Pandora FMS 3.2!','This is the new Pandora FMS Console. A lot of new features have been added since last version. Please read the documentation about it, and feel free to test any option.\r\n\r\nThe Pandora FMS Team.',NOW()),
(2,'admin','New GIS Feature','Try our new GIS representation, activate GIS in Setup to see new available options.',NOW());
SELECT setval('tnews_id_news_seq', (SELECT (SELECT MAX(id_news) FROM tnews)));

INSERT INTO tmodule VALUES (1,'Agent&#x20;module');
INSERT INTO tmodule VALUES (2,'Network&#x20;module');
INSERT INTO tmodule VALUES (4,'Plugin&#x20;module');
INSERT INTO tmodule VALUES (5,'Prediction&#x20;module');
INSERT INTO tmodule VALUES (6,'WMI&#x20;module');
SELECT setval('tmodule_id_module_seq', (SELECT (SELECT MAX(id_module) FROM tmodule)));

INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (1,'OS Total process','Total process in Operating System (UNIX MIB)',13,15,0,0,180,0,'','','public','HOST-RESOURCES-MIB::hrSystemProcesses.0 ',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (2,'OS CPU Load (1 min)','CPU Load in Operating System (UNIX MIB)',13,15,0,0,180,0,'','','public','UCD-SNMP-MIB::laLoad.1',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (3,'Sysname','Get name of system using SNMP standard MIB',1,17,0,0,900,0,'','','public','.1.3.6.1.2.1.1.1.0',1,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (4,'OS Users','Active users in Operating System (UNIX MIB)',13,15,0,0,180,0,'','','public','HOST-RESOURCES-MIB::hrSystemNumUsers.0',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (11,'Catalyst CPU Usage (5min)','Cisco Catalyst Switches CPU Usage. Taken from ftp://ftp.cisco.com/pub/mibs/oid/OLD-CISCO-CPU-MIB.oid',2,15,0,0,180,0,'','','public','1.3.6.1.4.1.9.2.1.58',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (22,'HSRP Status','Get status of HSRP',2,18,0,0,180,0,'','','public','1.3.6.1.4.1.9.9.106.1.2.1.1.15.12.106',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (24,'NIC #1 status','Status of NIC#1',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.1',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (25,'NIC #2 status','Status of NIC #2',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.2',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (26,'NIC #3 status','Status of NIC #3',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.3',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (27,'NIC #1 outOctects','Output throughtput on Interface #1',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.16.1',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (28,'NIC #2 outOctects','Output troughtput on interface #2',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.16.2',1,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (29,'NIC #3 outOctects','Output troughtput on Interface #3',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.16.3',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (30,'NIC #1 inOctects','Input troughtput on Interface #1',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.10.1',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (31,'NIC #2 inOctects','Input throughtput for interface #2',10,16,0,0,180,0,'','NULL','public','.1.3.6.1.2.1.2.2.1.10.2',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (32,'NIC #3 inOctects','Input throught on interface #3',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.10.3',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (34,'Host Alive','Check if host is alive using ICMP ping check.',10,6,0,0,120,0,'','','','',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (36,'Host Latency','Get host network latency in miliseconds, using ICMP.',10,7,0,0,180,0,'','','','',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (37,'Check HTTP Server','Test APACHE2 HTTP service remotely (Protocol response, not only openport)',10,9,0,0,300,80,'GET / HTTP/1.0^M^M','HTTP/1.1 200 OK','','',3,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (38,'Check FTP Server','Check FTP protocol, not only check port.',10,9,0,0,300,21,'QUIT','220','','',3,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (39,'Check SSH Server','Checks port 22 is opened',10,9,0,0,300,22,'','','','',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (40,'Check Telnet server','Check telnet port',10,9,0,0,300,23,'','','','',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (41,'Check SMTP server','Check if SMTP port it&#039;s open',10,9,0,0,300,25,'','','','',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (42,'Check POP3 server','Check POP3 port.',10,9,0,0,300,110,'','','','',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (43,'NIC #7 outOctects','Get outcoming octects from NIC #7',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.16.7',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (44,'NIC #7 inOctects','Get incoming octects from NIC #7',10,16,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.10.7',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (45,'NIC #4 Status','Get status of NIC #4',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.4',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (46,'NIC #5 Status','Get status of NIC #5',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.5',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (47,'NIC #6 Status','Get status of NIC #6',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.6',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (48,'NIC #7 Status','Get status of NIC #7',10,18,0,0,180,0,'','','public','.1.3.6.1.2.1.2.2.1.8.7',2,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (49,'OS CPU Load (5 min)','CPU load on a 5 min average interval. UCD-SNMP Mib (Usually for all Linux and some UNIX)',13,15,0,0,180,0,'','','public','UCD-SNMP-MIB::laLoad.2',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (50,'System Description','Get system description (all mibs).',1,17,0,0,9000,0,'','','public','SNMPv2-MIB::sysDescr.0',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (51,'OS Raw Interrupts','Get system raw interrupts from SO',13,16,0,0,180,0,'','','public','UCD-SNMP-MIB::ssRawInterrupts.0',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (52,'OS IO Signals sent','IO Signals sent by Kernel',13,16,0,0,180,0,'','','public','UCD-SNMP-MIB::ssIOSent.0',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (53,'System Uptime','Sistem uptime in timeticks',1,15,0,0,180,0,'','','public','HOST-RESOURCES-MIB::hrSystemUptime.0',4,2);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo") VALUES (176,'Catalyst Free Mem','Taken from ftp://ftp.cisco.com/pub/mibs/oid/OLD-CISCO-MEMORY-MIB.oid',2,15,0,0,180,0,'','','public','1.3.6.1.4.1.9.2.1.8',4,2);

-- WMI components
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo", "plugin_user", "max_timeout") VALUES (200, 'CPU load', 'CPU0 load average', 14, 1, 100, 0, 300, 1, '', '', '', 'SELECT LoadPercentage from Win32_Processor WHERE DeviceID = &quot;CPU0&quot;', 1, 6, 'Administrator', 10);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo", "plugin_user", "max_timeout") VALUES (201, 'Free RAM', 'Available RAM memory in bytes', 14, 1, 0, 0, 300, 0, '', '', '', 'SELECT AvailableBytes from Win32_PerfRawData_PerfOS_Memory', 1, 6, 'Administrator', 10);
INSERT INTO "tnetwork_component" ("id_nc", "name", "description", "id_group", "type", "max", "min", "module_interval", "tcp_port", "tcp_send", "tcp_rcv", "snmp_community", "snmp_oid", "id_module_group", "id_modulo", "plugin_user", "max_timeout") VALUES (202, 'Windows version', 'Operating system version', 14, 3, 0, 0, 300, 1, '', '', '', 'SELECT Caption FROM Win32_OperatingSystem', 1, 6, 'Administrator', 10);
SELECT setval('tnetwork_component_id_nc_seq', (SELECT (SELECT MAX(id_nc) FROM tnetwork_component)));

--
-- Dumping data for table "tnetwork_component_group"
--
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (1,'General group',0);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (2,'Cisco MIBs',10);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (5,'UNIX MIBs',12);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (10,'Network Management',0);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (11,'Microsoft Windows MIB',12);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (12,'Operating Systems',0);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (13,'UCD Mibs (Linux, UCD-SNMP)',12);
INSERT INTO "tnetwork_component_group" ("id_sg", "name", "parent") VALUES (14,'WMI',12);
SELECT setval('tnetwork_component_group_id_sg_seq', (SELECT (SELECT MAX(id_sg) FROM tnetwork_component_group)));

-- Network profile
INSERT INTO "tnetwork_profile" ("id_np", "name", "description") VALUES (1,'Basic Network Monitoring','This includes basic SNMP, ICMP, and TCP checks.');
INSERT INTO "tnetwork_profile" ("id_np", "name", "description") VALUES (2,'Basic Monitoring','Only ICMP check');
INSERT INTO "tnetwork_profile" ("id_np", "name", "description") VALUES (3,'Basic DMZ Server monitoring','This group of network checks, checks for default services located on DMZ servers...');
INSERT INTO "tnetwork_profile" ("id_np", "name", "description") VALUES (4,'Full SNMP Monitoring','');
INSERT INTO "tnetwork_profile" ("id_np", "name", "description") VALUES (5,'Linux Server','Full Monitoring of a Linux server services.');
INSERT INTO "tnetwork_profile" ("id_np", "name", "description") VALUES (6,'Basic WMI monitoring','Basic monitoring of a Windows host.');
SELECT setval('tnetwork_profile_id_np_seq', (SELECT (SELECT MAX(id_np) FROM tnetwork_profile)));

INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (24,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (25,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (27,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (28,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (30,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (31,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (34,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (39,1);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (34,2);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (34,3);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (37,3);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (39,3);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (38,3);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (24,3);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (3,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (24,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (25,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (26,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (27,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (28,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (29,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (30,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (31,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (32,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (45,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (46,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (47,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (48,4);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (3,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (50,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (53,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (24,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (30,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (27,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (34,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (1,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (2,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (49,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (4,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (51,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (52,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (39,5);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (200,6);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (201,6);
INSERT INTO "tnetwork_profile_component" ("id_nc", "id_np") VALUES (202,6);

-- GIS Data
INSERT INTO "tgis_map" VALUES (1,'Sample',-3.708187,40.42056,0,16,'',-3.708187,40.42056,0,0,1);
SELECT setval('tgis_map_id_tgis_map_seq', (SELECT (SELECT MAX(id_tgis_map) FROM tgis_map)));
INSERT INTO "tgis_map_connection" VALUES (1,'OpenStreetMap','OSM','{\"type\":\"OSM\",\"url\":\"http://tile.openstreetmap.org/${z}/${x}/${y}.png\"}',19,16,-3.708187,40.42056,0,-3.708187,40.42056,0,0);
SELECT setval('tgis_map_connection_id_tmap_connection_seq', (SELECT (SELECT MAX(id_tmap_connection) FROM tgis_map_connection)));
INSERT INTO "tgis_map_has_tgis_map_connection" VALUES (1,1,'2010-03-01 09:46:48',1);
INSERT INTO "tgis_map_layer" VALUES (1,'Group All',1,0,1,0);
SELECT setval('tgis_map_layer_id_tmap_layer_seq', (SELECT (SELECT MAX(id_tmap_layer) FROM tgis_map_layer)));

-- example alert template
INSERT INTO "talert_commands" VALUES (10,'Remote&#x20;agent&#x20;control','/usr/share/pandora_server/udp_client.pl _address_ 41122 &quot;_field1_&quot;','This command is used to send commands to the Pandora FMS agents with the UDP server enabled. The UDP server is used to order agents (Windows and UNIX) to &quot;refresh&quot; the agent execution: that means, to force the agent to execute and send data to s',0);
SELECT setval('talert_commands_id_seq', (SELECT (SELECT MAX(id) FROM talert_commands)));

INSERT INTO "talert_actions" VALUES (1,'Mail&#x20;to&#x20;XXX',1,'yourmail@domain.es','[PANDORA] Alert from agent _agent_ on module _module_','',0,0);
INSERT INTO "talert_actions" VALUES (2,'Restart&#x20;agent',10,'REFRESH AGENT','','',0,0);
SELECT setval('talert_actions_id_seq', (SELECT (SELECT MAX(id) FROM talert_actions)));

INSERT INTO "talert_templates" VALUES (1,'Critical&#x20;condition','This is a generic alert template to fire on condition CRITICAL',1,'','','Hello, this is an automated email coming from Pandora FMS\r\n\r\nThis alert has been fired because a CRITICAL condition in one of your monitored items:\r\n\r\nAgent : _agent_\r\nModule: _module_\r\nModule description: _moduledescription_\r\nTimestamp _timestamp_\r\nCurrent value: _data_\r\n\r\nThanks for your time.\r\n\r\nBest regards\r\nPandora FMS\r\n','critical','',1,0.00,0.00,86400,1,0,'12:00:00','12:00:00',1,1,1,1,1,1,1,1,'[PANDORA] Alert RECOVERED for CRITICAL status on _agent_ / _module_','Hello, this is an automated email coming from Pandora FMS\r\n\r\nThis alert has been RECOVERED from a CRITICAL condition in one of your monitored items:\r\n\r\nAgent : _agent_\r\nModule: _module_\r\nModule description: _moduledescription_\r\nTimestamp _timestamp_\r\nCurrent value: _data_\r\n\r\nThanks for your time.\r\n\r\nBest regards\r\nPandora FMS\r\n',4,0);
INSERT INTO "talert_templates" VALUES (2,'Manual&#x20;alert','This is a template used to fire manual alerts, condition defined here never will be executed. Use this template to assign to your actions/commands used to do remote management (Agent restart, execute commands on server, etc).',NULL,'','','','max_min','',1,0.00,1.00,86400,1,0,'12:00:00','12:00:00',1,1,1,1,1,1,1,0,'','',1,0);
INSERT INTO "talert_templates" VALUES (3,'Warning&#x20;condition','This&#x20;is&#x20;a&#x20;generic&#x20;alert&#x20;template&#x20;to&#x20;fire&#x20;on&#x20;WARNING&#x20;condition.',1,'','','Hello,&#x20;this&#x20;is&#x20;an&#x20;automated&#x20;email&#x20;coming&#x20;from&#x20;Pandora&#x20;FMS&#x0d;&#x0a;&#x0d;&#x0a;This&#x20;alert&#x20;has&#x20;been&#x20;fired&#x20;because&#x20;a&#x20;WARNING&#x20;condition&#x20;in&#x20;one&#x20;of&#x20;your&#x20;monitored&#x20;items:&#x0d;&#x0a;&#x0d;&#x0a;Agent&#x20;:&#x20;_agent_&#x0d;&#x0a;Module:&#x20;_module_&#x0d;&#x0a;Module&#x20;description:&#x20;_moduledescription_&#x0d;&#x0a;Timestamp&#x20;_timestamp_&#x0d;&#x0a;Current&#x20;value:&#x20;_data_&#x0d;&#x0a;&#x0d;&#x0a;Thanks&#x20;for&#x20;your&#x20;time.&#x0d;&#x0a;&#x0d;&#x0a;Best&#x20;regards&#x0d;&#x0a;Pandora&#x20;FMS&#x0d;&#x0a;','warning','',1,0.00,0.00,86400,1,0,'12:00:00','12:00:00',1,1,1,1,1,1,1,1,'[PANDORA]&#x20;Alert&#x20;RECOVERED&#x20;for&#x20;WARNING&#x20;status&#x20;on&#x20;_agent_&#x20;/&#x20;_module_','Hello,&#x20;this&#x20;is&#x20;an&#x20;automated&#x20;email&#x20;coming&#x20;from&#x20;Pandora&#x20;FMS&#x0d;&#x0a;&#x0d;&#x0a;This&#x20;alert&#x20;has&#x20;been&#x20;RECOVERED&#x20;from&#x20;a&#x20;WARNING&#x20;condition&#x20;in&#x20;one&#x20;of&#x20;your&#x20;monitored&#x20;items:&#x0d;&#x0a;&#x0d;&#x0a;Agent&#x20;:&#x20;_agent_&#x0d;&#x0a;Module:&#x20;_module_&#x0d;&#x0a;Module&#x20;description:&#x20;_moduledescription_&#x0d;&#x0a;Timestamp&#x20;_timestamp_&#x0d;&#x0a;Current&#x20;value:&#x20;_data_&#x0d;&#x0a;&#x0d;&#x0a;Thanks&#x20;for&#x20;your&#x20;time.&#x0d;&#x0a;&#x0d;&#x0a;Best&#x20;regards&#x0d;&#x0a;Pandora&#x20;FMS&#x0d;&#x0a;',3,0);
SELECT setval('talert_templates_id_seq', (SELECT (SELECT MAX(id) FROM talert_templates)));

-- treport_custom_sql Data
INSERT INTO "treport_custom_sql" ("id", "name", "sql") VALUES (1, 'Monitoring&#x20;Report&#x20;Agent', 'select&#x20;direccion,&#x20;nombre,&#x20;comentarios,&#x20;&#40;select&#x20;nombre&#x20;from&#x20;tgrupo&#x20;where&#x20;tgrupo.id_grupo&#x20;=&#x20;tagente.id_grupo&#41;&#x20;as&#x20;"group"&#x20;from&#x20;tagente;');
INSERT INTO "treport_custom_sql" ("id", "name", "sql") VALUES (2, 'Monitoring&#x20;Report&#x20;Modules', 'select&#x20;&#40;select&#x20;tagente.nombre&#x20;from&#x20;tagente&#x20;where&#x20;tagente.id_agente&#x20;=&#x20;tagente_modulo.id_agente&#41;&#x20;as&#x20;agent_name,&#x20;nombre&#x20;,&#x20;&#40;select&#x20;tmodule_group.name&#x20;from&#x20;tmodule_group&#x20;where&#x20;tmodule_group.id_mg&#x20;=&#x20;tagente_modulo.id_module_group&#41;&#x20;as&#x20;module_group,&#x20;module_interval&#x20;from&#x20;tagente_modulo&#x20;where&#x20;delete_pending&#x20;=&#x20;0&#x20;order&#x20;by&#x20;agent_name;');
INSERT INTO "treport_custom_sql" ("id", "name", "sql") VALUES (3, 'Monitoring&#x20;Report&#x20;Alerts', 'select&#x20;t1.nombre&#x20;as&#x20;agent_name,&#x20;t2.nombre&#x20;as&#x20;module_name,&#x20;&#40;select&#x20;talert_templates.name&#x20;from&#x20;talert_templates&#x20;where&#x20;talert_templates.id&#x20;=&#x20;t3.id_alert_template&#41;&#x20;as&#x20;template,&#x20;&#40;select&#x20;group_concat&#40;t02.name&#41;&#x20;from&#x20;talert_template_module_actions&#x20;as&#x20;t01&#x20;inner&#x20;join&#x20;talert_actions&#x20;as&#x20;t02&#x20;on&#x20;t01.id_alert_action&#x20;=&#x20;t02.id&#x20;where&#x20;t01.id_alert_template_module&#x20;=&#x20;t3.id&#x20;group&#x20;by&#x20;t01.id_alert_template_module&#41;&#x20;as&#x20;actions&#x20;from&#x20;tagente&#x20;as&#x20;t1&#x20;inner&#x20;join&#x20;tagente_modulo&#x20;as&#x20;t2&#x20;on&#x20;t1.id_agente&#x20;=&#x20;t2.id_agente&#x20;inner&#x20;join&#x20;talert_template_modules&#x20;as&#x20;t3&#x20;on&#x20;t2.id_agente_modulo&#x20;=&#x20;t3.id_agent_module&#x20;order&#x20;by&#x20;agent_name,&#x20;module_name;');
INSERT INTO "treport_custom_sql" ("id", "name", "sql") VALUES (4, 'Group&#x20;view', 'select&#x20;t1.nombre,&#x20;&#40;select&#x20;count&#40;t3.id_agente&#41;&#x20;from&#x20;tagente&#x20;as&#x20;t3&#x20;where&#x20;t1.id_grupo&#x20;=&#x20;t3.id_grupo&#41;&#x20;as&#x20;agents,&#x20;&#40;SELECT&#x20;COUNT&#40;t4.id_agente&#41;&#x20;FROM&#x20;tagente&#x20;as&#x20;t4&#x20;WHERE&#x20;t4.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;t4.disabled&#x20;=&#x20;0&#x20;AND&#x20;t4.ultimo_contacto&#x20;&lt;&#x20;NOW&#40;&#41;&#x20;-&#x20;&#40;intervalo&#x20;/&#x20;&#40;1/2&#41;&#41;&#41;&#x20;as&#x20;agent_unknown,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente.id_agente&#x20;=&#x20;tagente_estado.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;utimestamp&#x20;&gt;&#x20;0&#x20;AND&#x20;tagente_modulo.id_tipo_modulo&#x20;NOT&#x20;IN&#40;21,22,23,24,100&#41;&#x20;AND&#x20;&#40;UNIX_TIMESTAMP&#40;NOW&#40;&#41;&#41;&#x20;-&#x20;tagente_estado.utimestamp&#41;&#x20;&gt;=&#x20;&#40;tagente_estado.current_interval&#x20;/&#x20;&#40;1/2&#41;&#41;&#41;&#x20;as&#x20;monitor_unknow,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente.id_agente&#x20;=&#x20;tagente_estado.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente_modulo.id_tipo_modulo&#x20;NOT&#x20;IN&#x20;&#40;21,22,23,24&#41;&#x20;AND&#x20;utimestamp&#x20;=&#x20;0&#41;&#x20;as&#x20;monitor_no_init,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente_estado.id_agente&#x20;=&#x20;tagente.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;estado&#x20;=&#x20;0&#x20;AND&#x20;&#40;&#40;UNIX_TIMESTAMP&#40;NOW&#40;&#41;&#41;&#x20;-&#x20;tagente_estado.utimestamp&#41;&#x20;&lt;&#x20;&#40;tagente_estado.current_interval&#x20;/&#x20;&#40;1/2&#41;&#41;&#x20;OR&#x20;&#40;tagente_modulo.id_tipo_modulo&#x20;IN&#40;21,22,23,24,100&#41;&#41;&#41;&#x20;AND&#x20;&#40;utimestamp&#x20;&gt;&#x20;0&#x20;OR&#x20;&#40;tagente_modulo.id_tipo_modulo&#x20;IN&#40;21,22,23,24&#41;&#41;&#41;&#41;&#x20;as&#x20;monitor_ok,&#x20;&#40;SELECT&#x20;COUNT&#40;tagente_estado.id_agente_estado&#41;&#x20;FROM&#x20;tagente_estado,&#x20;tagente,&#x20;tagente_modulo&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente_estado.id_agente&#x20;=&#x20;tagente.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;estado&#x20;=&#x20;1&#x20;AND&#x20;&#40;&#40;UNIX_TIMESTAMP&#40;NOW&#40;&#41;&#41;&#x20;-&#x20;tagente_estado.utimestamp&#41;&#x20;&lt;&#x20;&#40;tagente_estado.current_interval&#x20;/&#x20;&#40;1/2&#41;&#41;&#x20;OR&#x20;&#40;tagente_modulo.id_tipo_modulo&#x20;IN&#40;21,22,23,24,100&#41;&#41;&#41;&#x20;AND&#x20;utimestamp&#x20;&gt;&#x20;0&#41;&#x20;as&#x20;monitor_critical,&#x20;&#40;SELECT&#x20;COUNT&#40;talert_template_modules.id&#41;&#x20;FROM&#x20;talert_template_modules,&#x20;tagente_modulo,&#x20;tagente_estado,&#x20;tagente&#x20;WHERE&#x20;tagente.id_grupo&#x20;=&#x20;t1.id_grupo&#x20;AND&#x20;tagente_modulo.id_agente&#x20;=&#x20;tagente.id_agente&#x20;AND&#x20;tagente_estado.id_agente_modulo&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;tagente_modulo.disabled&#x20;=&#x20;0&#x20;AND&#x20;tagente.disabled&#x20;=&#x20;0&#x20;AND&#x20;talert_template_modules.id_agent_module&#x20;=&#x20;tagente_modulo.id_agente_modulo&#x20;AND&#x20;times_fired&#x20;&gt;&#x20;0&#41;&#x20;as&#x20;monitor_alert_fired&#x20;from&#x20;tgrupo&#x20;as&#x20;t1&#x20;where&#x20;0&#x20;&lt;&#x20;&#40;select&#x20;count&#40;t2.id_agente&#41;&#x20;from&#x20;tagente&#x20;as&#x20;t2&#x20;where&#x20;t1.id_grupo&#x20;=&#x20;t2.id_grupo&#41;');
SELECT setval('treport_custom_sql_id_seq', (SELECT (SELECT MAX(id) FROM treport_custom_sql)));

--
-- Dumping data for table `tskin`
--
INSERT INTO "tskin" VALUES (1,'skin&#x20;default', 'skin_default', 'Default&#x20;skin&#x20;for&#x20;Pandora&#x20;FMS&#x20;web&#x20;console', 1);
SELECT setval('tskin_id_seq', (SELECT (SELECT MAX(id) FROM tskin)));
