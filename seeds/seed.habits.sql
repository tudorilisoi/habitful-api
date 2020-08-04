-- SET timezone="UTC";
BEGIN;


-- todo: had issue with duplicate key error when inserting into 
-- habit_records. Need to sort out how setval thing works and 
-- ensure it prevents this type of error.

TRUNCATE
habit_records,
habits,
users
RESTART IDENTITY CASCADE;

INSERT INTO users (id, name, email, password, date_created)
VALUES 
-- all passwords are 'Password1!'
(1,'John', 'user1@gmail.com', '$2a$10$do9aqSHBEOX2mmidBFxxPOdknoul45m.TDoeQkdumVNrEkF2sn3KK', '2019-12-31T11:00:00Z'),
(2,'Mary', 'user2@gmail.com', '$2a$10$4AGfWWmypn45VHgsdyMOY.xymoQInQIwtzbFWeyvUvWVknpeSWwki', '2020-01-01T00:00:00Z'),
(3,'Bob', 'user3@gmail.com', '$2a$10$XrZZWlImZXIhAIf7b.8xqeDNK6kDU81An9lU.XzsuvgtR7hyG43fm', '2020-01-01T00:00:00Z');

SELECT setval('users_id_seq', (SELECT MAX(id) from "users"));

INSERT INTO habits (id, name, description, num_times, time_interval, date_created, user_id)
VALUES 
(1,
'walk for 1 hour',
null, 
7, 
'week', 
'2020-06-30T11:00:00Z',
1),
(2,
'meditate 15 min',
null, 
7, 
'week', 
'2020-07-01T00:00:00Z',
1),
(3,
'workout',
null, 
3, 
'week', 
'2020-07-01T00:00:00Z',
1),
(4,
'run 2 miles',
null, 
2, 
'week', 
'2020-07-01T00:00:00Z',
2);

-- ensures id generator will start from the max id num in database
-- instead of starting at 1
SELECT setval('habits_id_seq', (SELECT MAX(id) from "habits"));


INSERT INTO habit_records (id, date_completed, habit_id)
VALUES 
   
  (1000, '2020-08-01T07:00:00Z', 1 ),
(1001, '2020-07-31T07:00:00Z', 1 ),
(1002, '2020-07-30T07:00:00Z', 1 ),
(1003, '2020-07-29T07:00:00Z', 1 ),
(1004, '2020-07-28T07:00:00Z', 1 ),
(1005, '2020-07-27T07:00:00Z', 1 ),
(1006, '2020-07-26T07:00:00Z', 1 ),
(1007, '2020-07-25T07:00:00Z', 1 ),
(1008, '2020-07-24T07:00:00Z', 1 ),
(1009, '2020-07-23T07:00:00Z', 1 ),
(1010, '2020-07-22T07:00:00Z', 1 ),
(1011, '2020-07-21T07:00:00Z', 1 ),
(1012, '2020-07-20T07:00:00Z', 1 ),
(1013, '2020-07-19T07:00:00Z', 1 ),
(1014, '2020-07-18T07:00:00Z', 1 ),
(1015, '2020-07-17T07:00:00Z', 1 ),
(1016, '2020-07-16T07:00:00Z', 1 ),
(1017, '2020-07-15T07:00:00Z', 1 ),
(1018, '2020-07-14T07:00:00Z', 1 ),
(1019, '2020-07-13T07:00:00Z', 1 ),
(1020, '2020-07-12T07:00:00Z', 1 ),
(1021, '2020-07-11T07:00:00Z', 1 ),
(1022, '2020-07-10T07:00:00Z', 1 ),
(1023, '2020-07-09T07:00:00Z', 1 ),
-- (1024, '2020-07-08T07:00:00Z', 1 ),
-- (1025, '2020-07-07T07:00:00Z', 1 ),
-- (1026, '2020-07-06T07:00:00Z', 1 ),
-- (1027, '2020-07-05T07:00:00Z', 1 ),
-- (1028, '2020-07-04T07:00:00Z', 1 ),
-- (1029, '2020-07-03T07:00:00Z', 1 ),
-- (1030, '2020-07-02T07:00:00Z', 1 ),
-- (1031, '2020-07-01T07:00:00Z', 1 ),
-- (1032, '2020-06-30T07:00:00Z', 1 ),
-- (1033, '2020-06-29T07:00:00Z', 1 ),
-- (1034, '2020-06-28T07:00:00Z', 1 ),
-- (1035, '2020-06-27T07:00:00Z', 1 ),
-- (1036, '2020-06-26T07:00:00Z', 1 ),
-- (1037, '2020-06-25T07:00:00Z', 1 ),
-- (1038, '2020-06-24T07:00:00Z', 1 ),
-- (1039, '2020-06-23T07:00:00Z', 1 ),
-- (1040, '2020-06-22T07:00:00Z', 1 ),
-- (1041, '2020-06-21T07:00:00Z', 1 ),
-- (1042, '2020-06-20T07:00:00Z', 1 ),
-- (1043, '2020-06-19T07:00:00Z', 1 ),
-- (1044, '2020-06-18T07:00:00Z', 1 ),
-- (1045, '2020-06-17T07:00:00Z', 1 ),
-- (1046, '2020-06-16T07:00:00Z', 1 ),
-- (1047, '2020-06-15T07:00:00Z', 1 ),
-- (1048, '2020-06-14T07:00:00Z', 1 ),
-- (1049, '2020-06-13T07:00:00Z', 1 ),
-- (1050, '2020-06-12T07:00:00Z', 1 ),
-- (1051, '2020-06-11T07:00:00Z', 1 ),
-- (1052, '2020-06-10T07:00:00Z', 1 ),
-- (1053, '2020-06-09T07:00:00Z', 1 ),
-- (1054, '2020-06-08T07:00:00Z', 1 ),
-- (1055, '2020-06-07T07:00:00Z', 1 ),
-- (1056, '2020-06-06T07:00:00Z', 1 ),
-- (1057, '2020-06-05T07:00:00Z', 1 ),
-- (1058, '2020-06-04T07:00:00Z', 1 ),
-- (1059, '2020-06-03T07:00:00Z', 1 ),
-- (1060, '2020-06-02T07:00:00Z', 1 ),
-- (1061, '2020-06-01T07:00:00Z', 1 ),
-- (1062, '2020-05-31T07:00:00Z', 1 ),
-- (1063, '2020-05-30T07:00:00Z', 1 ),
-- (1064, '2020-05-29T07:00:00Z', 1 ),
-- (1065, '2020-05-28T07:00:00Z', 1 ),
-- (1066, '2020-05-27T07:00:00Z', 1 ),
-- (1067, '2020-05-26T07:00:00Z', 1 ),
-- (1068, '2020-05-25T07:00:00Z', 1 ),
-- (1069, '2020-05-24T07:00:00Z', 1 ),
-- (1070, '2020-05-23T07:00:00Z', 1 ),
-- (1071, '2020-05-22T07:00:00Z', 1 ),
-- (1072, '2020-05-21T07:00:00Z', 1 ),
-- (1073, '2020-05-20T07:00:00Z', 1 ),
-- (1074, '2020-05-19T07:00:00Z', 1 ),
-- (1075, '2020-05-18T07:00:00Z', 1 ),
-- (1076, '2020-05-17T07:00:00Z', 1 ),
-- (1077, '2020-05-16T07:00:00Z', 1 ),
-- (1078, '2020-05-15T07:00:00Z', 1 ),
-- (1079, '2020-05-14T07:00:00Z', 1 ),
-- (1080, '2020-05-13T07:00:00Z', 1 ),
-- (1081, '2020-05-12T07:00:00Z', 1 ),
-- (1082, '2020-05-11T07:00:00Z', 1 ),
-- (1083, '2020-05-10T07:00:00Z', 1 ),
-- (1084, '2020-05-09T07:00:00Z', 1 ),
-- (1085, '2020-05-08T07:00:00Z', 1 ),
(1086, '2020-05-07T07:00:00Z', 1 ),
(1087, '2020-05-06T07:00:00Z', 1 ),
(1088, '2020-05-05T07:00:00Z', 1 ),
(1089, '2020-05-04T07:00:00Z', 1 ),
(1090, '2020-05-03T07:00:00Z', 1 ),
(1091, '2020-05-02T07:00:00Z', 1 ),
(1092, '2020-05-01T07:00:00Z', 1 ),
(1093, '2020-04-30T07:00:00Z', 1 ),
(1094, '2020-04-29T07:00:00Z', 1 ),
(1095, '2020-04-28T07:00:00Z', 1 ),
(1096, '2020-04-27T07:00:00Z', 1 ),
(1097, '2020-04-26T07:00:00Z', 1 ),
(1098, '2020-04-25T07:00:00Z', 1 ),
(1099, '2020-04-24T07:00:00Z', 1 ),
(1100, '2020-04-23T07:00:00Z', 1 ),
(1101, '2020-04-22T07:00:00Z', 1 ),
(1102, '2020-04-21T07:00:00Z', 1 ),
(1103, '2020-04-20T07:00:00Z', 1 ),
(1104, '2020-04-19T07:00:00Z', 1 ),
(1105, '2020-04-18T07:00:00Z', 1 ),
(1106, '2020-04-17T07:00:00Z', 1 ),
(1107, '2020-04-16T07:00:00Z', 1 ),
(1108, '2020-04-15T07:00:00Z', 1 ),
(1109, '2020-04-14T07:00:00Z', 1 ),
(1110, '2020-04-13T07:00:00Z', 1 ),
(1111, '2020-04-12T07:00:00Z', 1 ),
(1112, '2020-04-11T07:00:00Z', 1 ),
(1113, '2020-04-10T07:00:00Z', 1 ),
(1114, '2020-04-09T07:00:00Z', 1 ),
(1115, '2020-04-08T07:00:00Z', 1 ),
(1116, '2020-04-07T07:00:00Z', 1 ),
(1117, '2020-04-06T07:00:00Z', 1 ),
(1118, '2020-04-05T07:00:00Z', 1 ),
(1119, '2020-04-04T07:00:00Z', 1 ),
(1120, '2020-04-03T07:00:00Z', 1 ),
(1121, '2020-04-02T07:00:00Z', 1 ),
(1122, '2020-04-01T07:00:00Z', 1 ),
(1123, '2020-03-31T07:00:00Z', 1 ),
(1124, '2020-03-30T07:00:00Z', 1 ),
(1125, '2020-03-29T07:00:00Z', 1 ),
(1126, '2020-03-28T07:00:00Z', 1 ),
(1127, '2020-03-27T07:00:00Z', 1 ),
(1128, '2020-03-26T07:00:00Z', 1 ),
(1129, '2020-03-25T07:00:00Z', 1 ),
(1130, '2020-03-24T07:00:00Z', 1 ),
(1131, '2020-03-23T07:00:00Z', 1 ),
(1132, '2020-03-22T07:00:00Z', 1 ),
(1133, '2020-03-21T07:00:00Z', 1 ),
(1134, '2020-03-20T07:00:00Z', 1 ),
(1135, '2020-03-19T07:00:00Z', 1 ),
(1136, '2020-03-18T07:00:00Z', 1 ),
(1137, '2020-03-17T07:00:00Z', 1 ),
(1138, '2020-03-16T07:00:00Z', 1 ),
(1139, '2020-03-15T07:00:00Z', 1 ),
(1140, '2020-03-14T07:00:00Z', 1 ),
(1141, '2020-03-13T07:00:00Z', 1 ),
(1142, '2020-03-12T07:00:00Z', 1 ),
(1143, '2020-03-11T07:00:00Z', 1 ),
(1144, '2020-03-10T07:00:00Z', 1 ),
(1145, '2020-03-09T07:00:00Z', 1 ),
(1146, '2020-03-08T07:00:00Z', 1 ),
(1147, '2020-03-07T07:00:00Z', 1 ),
(1148, '2020-03-06T07:00:00Z', 1 ),
(1149, '2020-03-05T07:00:00Z', 1 ),
(1150, '2020-03-04T07:00:00Z', 1 ),
(1151, '2020-03-03T07:00:00Z', 1 ),
(1152, '2020-03-02T07:00:00Z', 1 ),
-- (1153, '2020-03-01T07:00:00Z', 1 ),
-- (1154, '2020-02-29T07:00:00Z', 1 ),
-- (1155, '2020-02-28T07:00:00Z', 1 ),
-- (1156, '2020-02-27T07:00:00Z', 1 ),
-- (1157, '2020-02-26T07:00:00Z', 1 ),
-- (1158, '2020-02-25T07:00:00Z', 1 ),
-- (1159, '2020-02-24T07:00:00Z', 1 ),
-- (1160, '2020-02-23T07:00:00Z', 1 ),
-- (1161, '2020-02-22T07:00:00Z', 1 ),
-- (1162, '2020-02-21T07:00:00Z', 1 ),
-- (1163, '2020-02-20T07:00:00Z', 1 ),
-- (1164, '2020-02-19T07:00:00Z', 1 ),
-- (1165, '2020-02-18T07:00:00Z', 1 ),
-- (1166, '2020-02-17T07:00:00Z', 1 ),
-- (1167, '2020-02-16T07:00:00Z', 1 ),
-- (1168, '2020-02-15T07:00:00Z', 1 ),
-- (1169, '2020-02-14T07:00:00Z', 1 ),
-- (1170, '2020-02-13T07:00:00Z', 1 ),
-- (1171, '2020-02-12T07:00:00Z', 1 ),
-- (1172, '2020-02-11T07:00:00Z', 1 ),
-- (1173, '2020-02-10T07:00:00Z', 1 ),
-- (1174, '2020-02-09T07:00:00Z', 1 ),
-- (1175, '2020-02-08T07:00:00Z', 1 ),
-- (1176, '2020-02-07T07:00:00Z', 1 ),
-- (1177, '2020-02-06T07:00:00Z', 1 ),
-- (1178, '2020-02-05T07:00:00Z', 1 ),
-- (1179, '2020-02-04T07:00:00Z', 1 ),
-- (1180, '2020-02-03T07:00:00Z', 1 ),
-- (1181, '2020-02-02T07:00:00Z', 1 ),
-- (1182, '2020-02-01T07:00:00Z', 1 ),
-- (1183, '2020-01-31T07:00:00Z', 1 ),
-- (1184, '2020-01-30T07:00:00Z', 1 ),
-- (1185, '2020-01-29T07:00:00Z', 1 ),
-- (1186, '2020-01-28T07:00:00Z', 1 ),
-- (1187, '2020-01-27T07:00:00Z', 1 ),
-- (1188, '2020-01-26T07:00:00Z', 1 ),
-- (1189, '2020-01-25T07:00:00Z', 1 ),
-- (1190, '2020-01-24T07:00:00Z', 1 ),
-- (1191, '2020-01-23T07:00:00Z', 1 ),
-- (1192, '2020-01-22T07:00:00Z', 1 ),
-- (1193, '2020-01-21T07:00:00Z', 1 ),
-- (1194, '2020-01-20T07:00:00Z', 1 ),
-- (1195, '2020-01-19T07:00:00Z', 1 ),
-- (1196, '2020-01-18T07:00:00Z', 1 ),
-- (1197, '2020-01-17T07:00:00Z', 1 ),
-- (1198, '2020-01-16T07:00:00Z', 1 ),
-- (1199, '2020-01-15T07:00:00Z', 1 ),
-- (1200, '2020-01-14T07:00:00Z', 1 ),
-- (1201, '2020-01-13T07:00:00Z', 1 ),
-- (1202, '2020-01-12T07:00:00Z', 1 ),
-- (1203, '2020-01-11T07:00:00Z', 1 ),
-- (1204, '2020-01-10T07:00:00Z', 1 ),
-- (1205, '2020-01-09T07:00:00Z', 1 ),
-- (1206, '2020-01-08T07:00:00Z', 1 ),
-- (1207, '2020-01-07T07:00:00Z', 1 ),
-- (1208, '2020-01-06T07:00:00Z', 1 ),
-- (1209, '2020-01-05T07:00:00Z', 1 ),
-- (1210, '2020-01-04T07:00:00Z', 1 ),
-- (1211, '2020-01-03T07:00:00Z', 1 ),
-- (1212, '2020-01-02T07:00:00Z', 1 ),
-- (1213, '2020-01-01T07:00:00Z', 1 ),
-- (1214, '2019-12-31T07:00:00Z', 1 ),
-- (1215, '2019-12-30T07:00:00Z', 1 ),
-- (1216, '2019-12-29T07:00:00Z', 1 ),
-- (1217, '2019-12-28T07:00:00Z', 1 ),
-- (1218, '2019-12-27T07:00:00Z', 1 ),
-- (1219, '2019-12-26T07:00:00Z', 1 ),
-- (1220, '2019-12-25T07:00:00Z', 1 ),
-- (1221, '2019-12-24T07:00:00Z', 1 ),
-- (1222, '2019-12-23T07:00:00Z', 1 ),
-- (1223, '2019-12-22T07:00:00Z', 1 ),
-- (1224, '2019-12-21T07:00:00Z', 1 ),
-- (1225, '2019-12-20T07:00:00Z', 1 ),
-- (1226, '2019-12-19T07:00:00Z', 1 ),
-- (1227, '2019-12-18T07:00:00Z', 1 ),
-- (1228, '2019-12-17T07:00:00Z', 1 ),
-- (1229, '2019-12-16T07:00:00Z', 1 ),
-- (1230, '2019-12-15T07:00:00Z', 1 ),
-- (1231, '2019-12-14T07:00:00Z', 1 ),
(1232, '2019-12-13T07:00:00Z', 1 ),
(1233, '2019-12-12T07:00:00Z', 1 ),
(1234, '2019-12-11T07:00:00Z', 1 ),
(1235, '2019-12-10T07:00:00Z', 1 ),
(1236, '2019-12-09T07:00:00Z', 1 ),
(1237, '2019-12-08T07:00:00Z', 1 ),
(1238, '2019-12-07T07:00:00Z', 1 ),
(1239, '2019-12-06T07:00:00Z', 1 ),
(1240, '2019-12-05T07:00:00Z', 1 ),
(1241, '2019-12-04T07:00:00Z', 1 ),
(1242, '2019-12-03T07:00:00Z', 1 ),
(1243, '2019-12-02T07:00:00Z', 1 ),
(1244, '2019-12-01T07:00:00Z', 1 ),
(1245, '2019-11-30T07:00:00Z', 1 ),
(1246, '2019-11-29T07:00:00Z', 1 ),
(1247, '2019-11-28T07:00:00Z', 1 ),
(1248, '2019-11-27T07:00:00Z', 1 ),
(1249, '2019-11-26T07:00:00Z', 1 ),
(1250, '2019-11-25T07:00:00Z', 1 ),
(1251, '2019-11-24T07:00:00Z', 1 ),
(1252, '2019-11-23T07:00:00Z', 1 ),
(1253, '2019-11-22T07:00:00Z', 1 ),
(1254, '2019-11-21T07:00:00Z', 1 ),
(1255, '2019-11-20T07:00:00Z', 1 ),
(1256, '2019-11-19T07:00:00Z', 1 ),
(1257, '2019-11-18T07:00:00Z', 1 ),
(1258, '2019-11-17T07:00:00Z', 1 ),
(1259, '2019-11-16T07:00:00Z', 1 ),
(1260, '2019-11-15T07:00:00Z', 1 ),
(1261, '2019-11-14T07:00:00Z', 1 ),
(1262, '2019-11-13T07:00:00Z', 1 ),
(1263, '2019-11-12T07:00:00Z', 1 ),
(1264, '2019-11-11T07:00:00Z', 1 ),
(1265, '2019-11-10T07:00:00Z', 1 ),
(1266, '2019-11-09T07:00:00Z', 1 ),
(1267, '2019-11-08T07:00:00Z', 1 ),
(1268, '2019-11-07T07:00:00Z', 1 ),
(1269, '2019-11-06T07:00:00Z', 1 ),
(1270, '2019-11-05T07:00:00Z', 1 ),
(1271, '2019-11-04T07:00:00Z', 1 ),
(1272, '2019-11-03T07:00:00Z', 1 ),
(1273, '2019-11-02T07:00:00Z', 1 ),
(1274, '2019-11-01T07:00:00Z', 1 ),
(1275, '2019-10-31T07:00:00Z', 1 ),
(1276, '2019-10-30T07:00:00Z', 1 ),
(1277, '2019-10-29T07:00:00Z', 1 ),
(1278, '2019-10-28T07:00:00Z', 1 ),
(1279, '2019-10-27T07:00:00Z', 1 ),
(1280, '2019-10-26T07:00:00Z', 1 ),
(1281, '2019-10-25T07:00:00Z', 1 ),
(1282, '2019-10-24T07:00:00Z', 1 ),
(1283, '2019-10-23T07:00:00Z', 1 ),
(1284, '2019-10-22T07:00:00Z', 1 ),
(1285, '2019-10-21T07:00:00Z', 1 ),
(1286, '2019-10-20T07:00:00Z', 1 ),
(1287, '2019-10-19T07:00:00Z', 1 ),
(1288, '2019-10-18T07:00:00Z', 1 ),
(1289, '2019-10-17T07:00:00Z', 1 ),
(1290, '2019-10-16T07:00:00Z', 1 ),
(1291, '2019-10-15T07:00:00Z', 1 ),
(1292, '2019-10-14T07:00:00Z', 1 ),
(1293, '2019-10-13T07:00:00Z', 1 ),
(1294, '2019-10-12T07:00:00Z', 1 ),
(1295, '2019-10-11T07:00:00Z', 1 ),
(1296, '2019-10-10T07:00:00Z', 1 ),
(1297, '2019-10-09T07:00:00Z', 1 ),
(1298, '2019-10-08T07:00:00Z', 1 ),
(1299, '2019-10-07T07:00:00Z', 1 ),

--   (2000, '2020-08-01T07:00:00Z', 2 ),
-- (2001, '2020-07-31T07:00:00Z', 2 ),
-- (2002, '2020-07-30T07:00:00Z', 2 ),
-- (2003, '2020-07-29T07:00:00Z', 2 ),
-- (2004, '2020-07-28T07:00:00Z', 2 ),
-- (2005, '2020-07-27T07:00:00Z', 2 ),
-- (2006, '2020-07-26T07:00:00Z', 2 ),
-- (2007, '2020-07-25T07:00:00Z', 2 ),
-- (2008, '2020-07-24T07:00:00Z', 2 ),
-- (2009, '2020-07-23T07:00:00Z', 2 ),
-- (2010, '2020-07-22T07:00:00Z', 2 ),
-- (2011, '2020-07-21T07:00:00Z', 2 ),
-- (2012, '2020-07-20T07:00:00Z', 2 ),
-- (2013, '2020-07-19T07:00:00Z', 2 ),
-- (2014, '2020-07-18T07:00:00Z', 2 ),
-- (2015, '2020-07-17T07:00:00Z', 2 ),
-- (2016, '2020-07-16T07:00:00Z', 2 ),
-- (2017, '2020-07-15T07:00:00Z', 2 ),
-- (2018, '2020-07-14T07:00:00Z', 2 ),
-- (2019, '2020-07-13T07:00:00Z', 2 ),
-- (2020, '2020-07-12T07:00:00Z', 2 ),
-- (2021, '2020-07-11T07:00:00Z', 2 ),
-- (2022, '2020-07-10T07:00:00Z', 2 ),
(2023, '2020-07-09T07:00:00Z', 2 ),
(2024, '2020-07-08T07:00:00Z', 2 ),
(2025, '2020-07-07T07:00:00Z', 2 ),
(2026, '2020-07-06T07:00:00Z', 2 ),
(2027, '2020-07-05T07:00:00Z', 2 ),
(2028, '2020-07-04T07:00:00Z', 2 ),
(2029, '2020-07-03T07:00:00Z', 2 ),
(2030, '2020-07-02T07:00:00Z', 2 ),
(2031, '2020-07-01T07:00:00Z', 2 ),
(2032, '2020-06-30T07:00:00Z', 2 ),
(2033, '2020-06-29T07:00:00Z', 2 ),
(2034, '2020-06-28T07:00:00Z', 2 ),
(2035, '2020-06-27T07:00:00Z', 2 ),
(2036, '2020-06-26T07:00:00Z', 2 ),
(2037, '2020-06-25T07:00:00Z', 2 ),
(2038, '2020-06-24T07:00:00Z', 2 ),
(2039, '2020-06-23T07:00:00Z', 2 ),
(2040, '2020-06-22T07:00:00Z', 2 ),
(2041, '2020-06-21T07:00:00Z', 2 ),
(2042, '2020-06-20T07:00:00Z', 2 ),
(2043, '2020-06-19T07:00:00Z', 2 ),
(2044, '2020-06-18T07:00:00Z', 2 ),
(2045, '2020-06-17T07:00:00Z', 2 ),
(2046, '2020-06-16T07:00:00Z', 2 ),
(2047, '2020-06-15T07:00:00Z', 2 ),
(2048, '2020-06-14T07:00:00Z', 2 ),
(2049, '2020-06-13T07:00:00Z', 2 ),
(2050, '2020-06-12T07:00:00Z', 2 ),
(2051, '2020-06-11T07:00:00Z', 2 ),
(2052, '2020-06-10T07:00:00Z', 2 ),
-- (2053, '2020-06-09T07:00:00Z', 2 ),
-- (2054, '2020-06-08T07:00:00Z', 2 ),
-- (2055, '2020-06-07T07:00:00Z', 2 ),
-- (2056, '2020-06-06T07:00:00Z', 2 ),
-- (2057, '2020-06-05T07:00:00Z', 2 ),
-- (2058, '2020-06-04T07:00:00Z', 2 ),
-- (2059, '2020-06-03T07:00:00Z', 2 ),
-- (2060, '2020-06-02T07:00:00Z', 2 ),
-- (2061, '2020-06-01T07:00:00Z', 2 ),
-- (2062, '2020-05-31T07:00:00Z', 2 ),
-- (2063, '2020-05-30T07:00:00Z', 2 ),
-- (2064, '2020-05-29T07:00:00Z', 2 ),
-- (2065, '2020-05-28T07:00:00Z', 2 ),
-- (2066, '2020-05-27T07:00:00Z', 2 ),
-- (2067, '2020-05-26T07:00:00Z', 2 ),
-- (2068, '2020-05-25T07:00:00Z', 2 ),
-- (2069, '2020-05-24T07:00:00Z', 2 ),
(2070, '2020-05-23T07:00:00Z', 2 ),
(2071, '2020-05-22T07:00:00Z', 2 ),
(2072, '2020-05-21T07:00:00Z', 2 ),
(2073, '2020-05-20T07:00:00Z', 2 ),
(2074, '2020-05-19T07:00:00Z', 2 ),
(2075, '2020-05-18T07:00:00Z', 2 ),
(2076, '2020-05-17T07:00:00Z', 2 ),
(2077, '2020-05-16T07:00:00Z', 2 ),
(2078, '2020-05-15T07:00:00Z', 2 ),
(2079, '2020-05-14T07:00:00Z', 2 ),
(2080, '2020-05-13T07:00:00Z', 2 ),
(2081, '2020-05-12T07:00:00Z', 2 ),
-- (2082, '2020-05-11T07:00:00Z', 2 ),
-- (2083, '2020-05-10T07:00:00Z', 2 ),
-- (2084, '2020-05-09T07:00:00Z', 2 ),
-- (2085, '2020-05-08T07:00:00Z', 2 ),
-- (2086, '2020-05-07T07:00:00Z', 2 ),
-- (2087, '2020-05-06T07:00:00Z', 2 ),
-- (2088, '2020-05-05T07:00:00Z', 2 ),
-- (2089, '2020-05-04T07:00:00Z', 2 ),
-- (2090, '2020-05-03T07:00:00Z', 2 ),
-- (2091, '2020-05-02T07:00:00Z', 2 ),
-- (2092, '2020-05-01T07:00:00Z', 2 ),
-- (2093, '2020-04-30T07:00:00Z', 2 ),
-- (2094, '2020-04-29T07:00:00Z', 2 ),
-- (2095, '2020-04-28T07:00:00Z', 2 ),
-- (2096, '2020-04-27T07:00:00Z', 2 ),
-- (2097, '2020-04-26T07:00:00Z', 2 ),
-- (2098, '2020-04-25T07:00:00Z', 2 ),
-- (2099, '2020-04-24T07:00:00Z', 2 ),
-- (2100, '2020-04-23T07:00:00Z', 2 ),
-- (2101, '2020-04-22T07:00:00Z', 2 ),
-- (2102, '2020-04-21T07:00:00Z', 2 ),
-- (2103, '2020-04-20T07:00:00Z', 2 ),
-- (2104, '2020-04-19T07:00:00Z', 2 ),
-- (2105, '2020-04-18T07:00:00Z', 2 ),
-- (2106, '2020-04-17T07:00:00Z', 2 ),
-- (2107, '2020-04-16T07:00:00Z', 2 ),
-- (2108, '2020-04-15T07:00:00Z', 2 ),
-- (2109, '2020-04-14T07:00:00Z', 2 ),
-- (2110, '2020-04-13T07:00:00Z', 2 ),
-- (2111, '2020-04-12T07:00:00Z', 2 ),
-- (2112, '2020-04-11T07:00:00Z', 2 ),
-- (2113, '2020-04-10T07:00:00Z', 2 ),
-- (2114, '2020-04-09T07:00:00Z', 2 ),
-- (2115, '2020-04-08T07:00:00Z', 2 ),
-- (2116, '2020-04-07T07:00:00Z', 2 ),
(2117, '2020-04-06T07:00:00Z', 2 ),
(2118, '2020-04-05T07:00:00Z', 2 ),
(2119, '2020-04-04T07:00:00Z', 2 ),
(2120, '2020-04-03T07:00:00Z', 2 ),
(2121, '2020-04-02T07:00:00Z', 2 ),
(2122, '2020-04-01T07:00:00Z', 2 ),
(2123, '2020-03-31T07:00:00Z', 2 ),
(2124, '2020-03-30T07:00:00Z', 2 ),
(2125, '2020-03-29T07:00:00Z', 2 ),
(2126, '2020-03-28T07:00:00Z', 2 ),
(2127, '2020-03-27T07:00:00Z', 2 ),
(2128, '2020-03-26T07:00:00Z', 2 ),
(2129, '2020-03-25T07:00:00Z', 2 ),
(2130, '2020-03-24T07:00:00Z', 2 ),
(2131, '2020-03-23T07:00:00Z', 2 ),
(2132, '2020-03-22T07:00:00Z', 2 ),
(2133, '2020-03-21T07:00:00Z', 2 ),
(2134, '2020-03-20T07:00:00Z', 2 ),
(2135, '2020-03-19T07:00:00Z', 2 ),
(2136, '2020-03-18T07:00:00Z', 2 ),
(2137, '2020-03-17T07:00:00Z', 2 ),
(2138, '2020-03-16T07:00:00Z', 2 ),
(2139, '2020-03-15T07:00:00Z', 2 ),
(2140, '2020-03-14T07:00:00Z', 2 ),
(2141, '2020-03-13T07:00:00Z', 2 ),
(2142, '2020-03-12T07:00:00Z', 2 ),
(2143, '2020-03-11T07:00:00Z', 2 ),
(2144, '2020-03-10T07:00:00Z', 2 ),
(2145, '2020-03-09T07:00:00Z', 2 ),
(2146, '2020-03-08T07:00:00Z', 2 ),
(2147, '2020-03-07T07:00:00Z', 2 ),
(2148, '2020-03-06T07:00:00Z', 2 ),
(2149, '2020-03-05T07:00:00Z', 2 ),
(2150, '2020-03-04T07:00:00Z', 2 ),
(2151, '2020-03-03T07:00:00Z', 2 ),
(2152, '2020-03-02T07:00:00Z', 2 ),
(2153, '2020-03-01T07:00:00Z', 2 ),
(2154, '2020-02-29T07:00:00Z', 2 ),
(2155, '2020-02-28T07:00:00Z', 2 ),
(2156, '2020-02-27T07:00:00Z', 2 ),
(2157, '2020-02-26T07:00:00Z', 2 ),
(2158, '2020-02-25T07:00:00Z', 2 ),
(2159, '2020-02-24T07:00:00Z', 2 ),
(2160, '2020-02-23T07:00:00Z', 2 ),
(2161, '2020-02-22T07:00:00Z', 2 ),
(2162, '2020-02-21T07:00:00Z', 2 ),
(2163, '2020-02-20T07:00:00Z', 2 ),
(2164, '2020-02-19T07:00:00Z', 2 ),
(2165, '2020-02-18T07:00:00Z', 2 ),
-- (2166, '2020-02-17T07:00:00Z', 2 ),
-- (2167, '2020-02-16T07:00:00Z', 2 ),
-- (2168, '2020-02-15T07:00:00Z', 2 ),
-- (2169, '2020-02-14T07:00:00Z', 2 ),
-- (2170, '2020-02-13T07:00:00Z', 2 ),
-- (2171, '2020-02-12T07:00:00Z', 2 ),
-- (2172, '2020-02-11T07:00:00Z', 2 ),
-- (2173, '2020-02-10T07:00:00Z', 2 ),
-- (2174, '2020-02-09T07:00:00Z', 2 ),
-- (2175, '2020-02-08T07:00:00Z', 2 ),
-- (2176, '2020-02-07T07:00:00Z', 2 ),
-- (2177, '2020-02-06T07:00:00Z', 2 ),
-- (2178, '2020-02-05T07:00:00Z', 2 ),
-- (2179, '2020-02-04T07:00:00Z', 2 ),
-- (2180, '2020-02-03T07:00:00Z', 2 ),
-- (2181, '2020-02-02T07:00:00Z', 2 ),
-- (2182, '2020-02-01T07:00:00Z', 2 ),
-- (2183, '2020-01-31T07:00:00Z', 2 ),
-- (2184, '2020-01-30T07:00:00Z', 2 ),
-- (2185, '2020-01-29T07:00:00Z', 2 ),
-- (2186, '2020-01-28T07:00:00Z', 2 ),
-- (2187, '2020-01-27T07:00:00Z', 2 ),
-- (2188, '2020-01-26T07:00:00Z', 2 ),
-- (2189, '2020-01-25T07:00:00Z', 2 ),
-- (2190, '2020-01-24T07:00:00Z', 2 ),
-- (2191, '2020-01-23T07:00:00Z', 2 ),
-- (2192, '2020-01-22T07:00:00Z', 2 ),
-- (2193, '2020-01-21T07:00:00Z', 2 ),
-- (2194, '2020-01-20T07:00:00Z', 2 ),
-- (2195, '2020-01-19T07:00:00Z', 2 ),
-- (2196, '2020-01-18T07:00:00Z', 2 ),
-- (2197, '2020-01-17T07:00:00Z', 2 ),
-- (2198, '2020-01-16T07:00:00Z', 2 ),
-- (2199, '2020-01-15T07:00:00Z', 2 ),
-- (2200, '2020-01-14T07:00:00Z', 2 ),
-- (2201, '2020-01-13T07:00:00Z', 2 ),
-- (2202, '2020-01-12T07:00:00Z', 2 ),
-- (2203, '2020-01-11T07:00:00Z', 2 ),
-- (2204, '2020-01-10T07:00:00Z', 2 ),
-- (2205, '2020-01-09T07:00:00Z', 2 ),
-- (2206, '2020-01-08T07:00:00Z', 2 ),
-- (2207, '2020-01-07T07:00:00Z', 2 ),
-- (2208, '2020-01-06T07:00:00Z', 2 ),
-- (2209, '2020-01-05T07:00:00Z', 2 ),
-- (2210, '2020-01-04T07:00:00Z', 2 ),
-- (2211, '2020-01-03T07:00:00Z', 2 ),
-- (2212, '2020-01-02T07:00:00Z', 2 ),
-- (2213, '2020-01-01T07:00:00Z', 2 ),
-- (2214, '2019-12-31T07:00:00Z', 2 ),
-- (2215, '2019-12-30T07:00:00Z', 2 ),
-- (2216, '2019-12-29T07:00:00Z', 2 ),
-- (2217, '2019-12-28T07:00:00Z', 2 ),
-- (2218, '2019-12-27T07:00:00Z', 2 ),
-- (2219, '2019-12-26T07:00:00Z', 2 ),
-- (2220, '2019-12-25T07:00:00Z', 2 ),
-- (2221, '2019-12-24T07:00:00Z', 2 ),
-- (2222, '2019-12-23T07:00:00Z', 2 ),
-- (2223, '2019-12-22T07:00:00Z', 2 ),
-- (2224, '2019-12-21T07:00:00Z', 2 ),
-- (2225, '2019-12-20T07:00:00Z', 2 ),
-- (2226, '2019-12-19T07:00:00Z', 2 ),
-- (2227, '2019-12-18T07:00:00Z', 2 ),
-- (2228, '2019-12-17T07:00:00Z', 2 ),
-- (2229, '2019-12-16T07:00:00Z', 2 ),
-- (2230, '2019-12-15T07:00:00Z', 2 ),
-- (2231, '2019-12-14T07:00:00Z', 2 ),
-- (2232, '2019-12-13T07:00:00Z', 2 ),
-- (2233, '2019-12-12T07:00:00Z', 2 ),
-- (2234, '2019-12-11T07:00:00Z', 2 ),
-- (2235, '2019-12-10T07:00:00Z', 2 ),
-- (2236, '2019-12-09T07:00:00Z', 2 ),
-- (2237, '2019-12-08T07:00:00Z', 2 ),
-- (2238, '2019-12-07T07:00:00Z', 2 ),
-- (2239, '2019-12-06T07:00:00Z', 2 ),
-- (2240, '2019-12-05T07:00:00Z', 2 ),
-- (2241, '2019-12-04T07:00:00Z', 2 ),
-- (2242, '2019-12-03T07:00:00Z', 2 ),
-- (2243, '2019-12-02T07:00:00Z', 2 ),
-- (2244, '2019-12-01T07:00:00Z', 2 ),
-- (2245, '2019-11-30T07:00:00Z', 2 ),
-- (2246, '2019-11-29T07:00:00Z', 2 ),
-- (2247, '2019-11-28T07:00:00Z', 2 ),
-- (2248, '2019-11-27T07:00:00Z', 2 ),
-- (2249, '2019-11-26T07:00:00Z', 2 ),
-- (2250, '2019-11-25T07:00:00Z', 2 ),
-- (2251, '2019-11-24T07:00:00Z', 2 ),
-- (2252, '2019-11-23T07:00:00Z', 2 ),
-- (2253, '2019-11-22T07:00:00Z', 2 ),
-- (2254, '2019-11-21T07:00:00Z', 2 ),
-- (2255, '2019-11-20T07:00:00Z', 2 ),
-- (2256, '2019-11-19T07:00:00Z', 2 ),
-- (2257, '2019-11-18T07:00:00Z', 2 ),
-- (2258, '2019-11-17T07:00:00Z', 2 ),
-- (2259, '2019-11-16T07:00:00Z', 2 ),
-- (2260, '2019-11-15T07:00:00Z', 2 ),
-- (2261, '2019-11-14T07:00:00Z', 2 ),
-- (2262, '2019-11-13T07:00:00Z', 2 ),
-- (2263, '2019-11-12T07:00:00Z', 2 ),
-- (2264, '2019-11-11T07:00:00Z', 2 ),
-- (2265, '2019-11-10T07:00:00Z', 2 ),
-- (2266, '2019-11-09T07:00:00Z', 2 ),
-- (2267, '2019-11-08T07:00:00Z', 2 ),
-- (2268, '2019-11-07T07:00:00Z', 2 ),
-- (2269, '2019-11-06T07:00:00Z', 2 ),
-- (2270, '2019-11-05T07:00:00Z', 2 ),
-- (2271, '2019-11-04T07:00:00Z', 2 ),
-- (2272, '2019-11-03T07:00:00Z', 2 ),
-- (2273, '2019-11-02T07:00:00Z', 2 ),
-- (2274, '2019-11-01T07:00:00Z', 2 ),
-- (2275, '2019-10-31T07:00:00Z', 2 ),
-- (2276, '2019-10-30T07:00:00Z', 2 ),
-- (2277, '2019-10-29T07:00:00Z', 2 ),
-- (2278, '2019-10-28T07:00:00Z', 2 ),
-- (2279, '2019-10-27T07:00:00Z', 2 ),
-- (2280, '2019-10-26T07:00:00Z', 2 ),
-- (2281, '2019-10-25T07:00:00Z', 2 ),
-- (2282, '2019-10-24T07:00:00Z', 2 ),
-- (2283, '2019-10-23T07:00:00Z', 2 ),
-- (2284, '2019-10-22T07:00:00Z', 2 ),
-- (2285, '2019-10-21T07:00:00Z', 2 ),
-- (2286, '2019-10-20T07:00:00Z', 2 ),
-- (2287, '2019-10-19T07:00:00Z', 2 ),
-- (2288, '2019-10-18T07:00:00Z', 2 ),
-- (2289, '2019-10-17T07:00:00Z', 2 ),
-- (2290, '2019-10-16T07:00:00Z', 2 ),
-- (2291, '2019-10-15T07:00:00Z', 2 ),
-- (2292, '2019-10-14T07:00:00Z', 2 ),
-- (2293, '2019-10-13T07:00:00Z', 2 ),
-- (2294, '2019-10-12T07:00:00Z', 2 ),
-- (2295, '2019-10-11T07:00:00Z', 2 ),
-- (2296, '2019-10-10T07:00:00Z', 2 ),
-- (2297, '2019-10-09T07:00:00Z', 2 ),
-- (2298, '2019-10-08T07:00:00Z', 2 ),
-- (2299, '2019-10-07T07:00:00Z', 2 ),

  (3000, '2020-08-01T07:00:00Z', 3 ),
(3001, '2020-07-31T07:00:00Z', 3 ),
(3002, '2020-07-30T07:00:00Z', 3 ),
(3003, '2020-07-29T07:00:00Z', 3 ),
(3004, '2020-07-28T07:00:00Z', 3 ),
(3005, '2020-07-27T07:00:00Z', 3 ),
(3006, '2020-07-26T07:00:00Z', 3 ),
(3007, '2020-07-25T07:00:00Z', 3 ),
(3008, '2020-07-24T07:00:00Z', 3 ),
(3009, '2020-07-23T07:00:00Z', 3 ),
(3010, '2020-07-22T07:00:00Z', 3 ),
(3011, '2020-07-21T07:00:00Z', 3 ),
(3012, '2020-07-20T07:00:00Z', 3 ),
(3013, '2020-07-19T07:00:00Z', 3 ),
(3014, '2020-07-18T07:00:00Z', 3 ),
(3015, '2020-07-17T07:00:00Z', 3 ),
(3016, '2020-07-16T07:00:00Z', 3 ),
(3017, '2020-07-15T07:00:00Z', 3 ),
(3018, '2020-07-14T07:00:00Z', 3 ),
(3019, '2020-07-13T07:00:00Z', 3 ),
(3020, '2020-07-12T07:00:00Z', 3 ),
(3021, '2020-07-11T07:00:00Z', 3 ),
(3022, '2020-07-10T07:00:00Z', 3 ),
(3023, '2020-07-09T07:00:00Z', 3 ),
(3024, '2020-07-08T07:00:00Z', 3 ),
(3025, '2020-07-07T07:00:00Z', 3 ),
(3026, '2020-07-06T07:00:00Z', 3 ),
(3027, '2020-07-05T07:00:00Z', 3 ),
(3028, '2020-07-04T07:00:00Z', 3 ),
(3029, '2020-07-03T07:00:00Z', 3 ),
(3030, '2020-07-02T07:00:00Z', 3 ),
(3031, '2020-07-01T07:00:00Z', 3 ),
(3032, '2020-06-30T07:00:00Z', 3 ),
(3033, '2020-06-29T07:00:00Z', 3 ),
(3034, '2020-06-28T07:00:00Z', 3 ),
(3035, '2020-06-27T07:00:00Z', 3 ),
(3036, '2020-06-26T07:00:00Z', 3 ),
(3037, '2020-06-25T07:00:00Z', 3 ),
(3038, '2020-06-24T07:00:00Z', 3 ),
(3039, '2020-06-23T07:00:00Z', 3 ),
(3040, '2020-06-22T07:00:00Z', 3 ),
(3041, '2020-06-21T07:00:00Z', 3 ),
(3042, '2020-06-20T07:00:00Z', 3 ),
(3043, '2020-06-19T07:00:00Z', 3 ),
(3044, '2020-06-18T07:00:00Z', 3 ),
(3045, '2020-06-17T07:00:00Z', 3 ),
(3046, '2020-06-16T07:00:00Z', 3 ),
(3047, '2020-06-15T07:00:00Z', 3 ),
(3048, '2020-06-14T07:00:00Z', 3 ),
(3049, '2020-06-13T07:00:00Z', 3 ),
(3050, '2020-06-12T07:00:00Z', 3 ),
(3051, '2020-06-11T07:00:00Z', 3 ),
(3052, '2020-06-10T07:00:00Z', 3 ),
(3053, '2020-06-09T07:00:00Z', 3 ),
(3054, '2020-06-08T07:00:00Z', 3 ),
(3055, '2020-06-07T07:00:00Z', 3 ),
(3056, '2020-06-06T07:00:00Z', 3 ),
(3057, '2020-06-05T07:00:00Z', 3 ),
(3058, '2020-06-04T07:00:00Z', 3 ),
(3059, '2020-06-03T07:00:00Z', 3 ),
(3060, '2020-06-02T07:00:00Z', 3 ),
(3061, '2020-06-01T07:00:00Z', 3 ),
(3062, '2020-05-31T07:00:00Z', 3 ),
(3063, '2020-05-30T07:00:00Z', 3 ),
(3064, '2020-05-29T07:00:00Z', 3 ),
(3065, '2020-05-28T07:00:00Z', 3 ),
(3066, '2020-05-27T07:00:00Z', 3 ),
(3067, '2020-05-26T07:00:00Z', 3 ),
(3068, '2020-05-25T07:00:00Z', 3 ),
(3069, '2020-05-24T07:00:00Z', 3 ),
(3070, '2020-05-23T07:00:00Z', 3 ),
(3071, '2020-05-22T07:00:00Z', 3 ),
(3072, '2020-05-21T07:00:00Z', 3 ),
(3073, '2020-05-20T07:00:00Z', 3 ),
(3074, '2020-05-19T07:00:00Z', 3 ),
(3075, '2020-05-18T07:00:00Z', 3 ),
(3076, '2020-05-17T07:00:00Z', 3 ),
(3077, '2020-05-16T07:00:00Z', 3 ),
(3078, '2020-05-15T07:00:00Z', 3 ),
(3079, '2020-05-14T07:00:00Z', 3 ),
(3080, '2020-05-13T07:00:00Z', 3 ),
(3081, '2020-05-12T07:00:00Z', 3 ),
(3082, '2020-05-11T07:00:00Z', 3 ),
(3083, '2020-05-10T07:00:00Z', 3 ),
(3084, '2020-05-09T07:00:00Z', 3 ),
(3085, '2020-05-08T07:00:00Z', 3 ),
(3086, '2020-05-07T07:00:00Z', 3 ),
(3087, '2020-05-06T07:00:00Z', 3 ),
(3088, '2020-05-05T07:00:00Z', 3 ),
(3089, '2020-05-04T07:00:00Z', 3 ),
(3090, '2020-05-03T07:00:00Z', 3 ),
(3091, '2020-05-02T07:00:00Z', 3 ),
(3092, '2020-05-01T07:00:00Z', 3 ),
(3093, '2020-04-30T07:00:00Z', 3 ),
(3094, '2020-04-29T07:00:00Z', 3 ),
(3095, '2020-04-28T07:00:00Z', 3 ),
(3096, '2020-04-27T07:00:00Z', 3 ),
(3097, '2020-04-26T07:00:00Z', 3 ),
(3098, '2020-04-25T07:00:00Z', 3 ),
(3099, '2020-04-24T07:00:00Z', 3 ),
(3100, '2020-04-23T07:00:00Z', 3 ),
(3101, '2020-04-22T07:00:00Z', 3 ),
(3102, '2020-04-21T07:00:00Z', 3 ),
(3103, '2020-04-20T07:00:00Z', 3 ),
(3104, '2020-04-19T07:00:00Z', 3 ),
(3105, '2020-04-18T07:00:00Z', 3 ),
(3106, '2020-04-17T07:00:00Z', 3 ),
(3107, '2020-04-16T07:00:00Z', 3 ),
(3108, '2020-04-15T07:00:00Z', 3 ),
(3109, '2020-04-14T07:00:00Z', 3 ),
(3110, '2020-04-13T07:00:00Z', 3 ),
(3111, '2020-04-12T07:00:00Z', 3 ),
(3112, '2020-04-11T07:00:00Z', 3 ),
(3113, '2020-04-10T07:00:00Z', 3 ),
(3114, '2020-04-09T07:00:00Z', 3 ),
(3115, '2020-04-08T07:00:00Z', 3 ),
-- (3116, '2020-04-07T07:00:00Z', 3 ),
-- (3117, '2020-04-06T07:00:00Z', 3 ),
-- (3118, '2020-04-05T07:00:00Z', 3 ),
-- (3119, '2020-04-04T07:00:00Z', 3 ),
-- (3120, '2020-04-03T07:00:00Z', 3 ),
-- (3121, '2020-04-02T07:00:00Z', 3 ),
-- (3122, '2020-04-01T07:00:00Z', 3 ),
-- (3123, '2020-03-31T07:00:00Z', 3 ),
-- (3124, '2020-03-30T07:00:00Z', 3 ),
-- (3125, '2020-03-29T07:00:00Z', 3 ),
-- (3126, '2020-03-28T07:00:00Z', 3 ),
-- (3127, '2020-03-27T07:00:00Z', 3 ),
-- (3128, '2020-03-26T07:00:00Z', 3 ),
-- (3129, '2020-03-25T07:00:00Z', 3 ),
-- (3130, '2020-03-24T07:00:00Z', 3 ),
-- (3131, '2020-03-23T07:00:00Z', 3 ),
-- (3132, '2020-03-22T07:00:00Z', 3 ),
-- (3133, '2020-03-21T07:00:00Z', 3 ),
-- (3134, '2020-03-20T07:00:00Z', 3 ),
-- (3135, '2020-03-19T07:00:00Z', 3 ),
-- (3136, '2020-03-18T07:00:00Z', 3 ),
-- (3137, '2020-03-17T07:00:00Z', 3 ),
-- (3138, '2020-03-16T07:00:00Z', 3 ),
-- (3139, '2020-03-15T07:00:00Z', 3 ),
-- (3140, '2020-03-14T07:00:00Z', 3 ),
-- (3141, '2020-03-13T07:00:00Z', 3 ),
-- (3142, '2020-03-12T07:00:00Z', 3 ),
-- (3143, '2020-03-11T07:00:00Z', 3 ),
-- (3144, '2020-03-10T07:00:00Z', 3 ),
-- (3145, '2020-03-09T07:00:00Z', 3 ),
-- (3146, '2020-03-08T07:00:00Z', 3 ),
-- (3147, '2020-03-07T07:00:00Z', 3 ),
-- (3148, '2020-03-06T07:00:00Z', 3 ),
-- (3149, '2020-03-05T07:00:00Z', 3 ),
-- (3150, '2020-03-04T07:00:00Z', 3 ),
-- (3151, '2020-03-03T07:00:00Z', 3 ),
-- (3152, '2020-03-02T07:00:00Z', 3 ),
-- (3153, '2020-03-01T07:00:00Z', 3 ),
-- (3154, '2020-02-29T07:00:00Z', 3 ),
-- (3155, '2020-02-28T07:00:00Z', 3 ),
-- (3156, '2020-02-27T07:00:00Z', 3 ),
-- (3157, '2020-02-26T07:00:00Z', 3 ),
-- (3158, '2020-02-25T07:00:00Z', 3 ),
-- (3159, '2020-02-24T07:00:00Z', 3 ),
-- (3160, '2020-02-23T07:00:00Z', 3 ),
-- (3161, '2020-02-22T07:00:00Z', 3 ),
-- (3162, '2020-02-21T07:00:00Z', 3 ),
-- (3163, '2020-02-20T07:00:00Z', 3 ),
-- (3164, '2020-02-19T07:00:00Z', 3 ),
-- (3165, '2020-02-18T07:00:00Z', 3 ),
-- (3166, '2020-02-17T07:00:00Z', 3 ),
-- (3167, '2020-02-16T07:00:00Z', 3 ),
-- (3168, '2020-02-15T07:00:00Z', 3 ),
-- (3169, '2020-02-14T07:00:00Z', 3 ),
-- (3170, '2020-02-13T07:00:00Z', 3 ),
-- (3171, '2020-02-12T07:00:00Z', 3 ),
-- (3172, '2020-02-11T07:00:00Z', 3 ),
-- (3173, '2020-02-10T07:00:00Z', 3 ),
-- (3174, '2020-02-09T07:00:00Z', 3 ),
-- (3175, '2020-02-08T07:00:00Z', 3 ),
-- (3176, '2020-02-07T07:00:00Z', 3 ),
-- (3177, '2020-02-06T07:00:00Z', 3 ),
-- (3178, '2020-02-05T07:00:00Z', 3 ),
-- (3179, '2020-02-04T07:00:00Z', 3 ),
-- (3180, '2020-02-03T07:00:00Z', 3 ),
-- (3181, '2020-02-02T07:00:00Z', 3 ),
-- (3182, '2020-02-01T07:00:00Z', 3 ),
-- (3183, '2020-01-31T07:00:00Z', 3 ),
-- (3184, '2020-01-30T07:00:00Z', 3 ),
-- (3185, '2020-01-29T07:00:00Z', 3 ),
-- (3186, '2020-01-28T07:00:00Z', 3 ),
-- (3187, '2020-01-27T07:00:00Z', 3 ),
-- (3188, '2020-01-26T07:00:00Z', 3 ),
-- (3189, '2020-01-25T07:00:00Z', 3 ),
-- (3190, '2020-01-24T07:00:00Z', 3 ),
-- (3191, '2020-01-23T07:00:00Z', 3 ),
-- (3192, '2020-01-22T07:00:00Z', 3 ),
-- (3193, '2020-01-21T07:00:00Z', 3 ),
-- (3194, '2020-01-20T07:00:00Z', 3 ),
-- (3195, '2020-01-19T07:00:00Z', 3 ),
-- (3196, '2020-01-18T07:00:00Z', 3 ),
-- (3197, '2020-01-17T07:00:00Z', 3 ),
-- (3198, '2020-01-16T07:00:00Z', 3 ),
-- (3199, '2020-01-15T07:00:00Z', 3 ),
-- (3200, '2020-01-14T07:00:00Z', 3 ),
-- (3201, '2020-01-13T07:00:00Z', 3 ),
-- (3202, '2020-01-12T07:00:00Z', 3 ),
-- (3203, '2020-01-11T07:00:00Z', 3 ),
-- (3204, '2020-01-10T07:00:00Z', 3 ),
-- (3205, '2020-01-09T07:00:00Z', 3 ),
-- (3206, '2020-01-08T07:00:00Z', 3 ),
-- (3207, '2020-01-07T07:00:00Z', 3 ),
-- (3208, '2020-01-06T07:00:00Z', 3 ),
-- (3209, '2020-01-05T07:00:00Z', 3 ),
-- (3210, '2020-01-04T07:00:00Z', 3 ),
-- (3211, '2020-01-03T07:00:00Z', 3 ),
-- (3212, '2020-01-02T07:00:00Z', 3 ),
-- (3213, '2020-01-01T07:00:00Z', 3 ),
-- (3214, '2019-12-31T07:00:00Z', 3 ),
-- (3215, '2019-12-30T07:00:00Z', 3 ),
-- (3216, '2019-12-29T07:00:00Z', 3 ),
-- (3217, '2019-12-28T07:00:00Z', 3 ),
-- (3218, '2019-12-27T07:00:00Z', 3 ),
-- (3219, '2019-12-26T07:00:00Z', 3 ),
-- (3220, '2019-12-25T07:00:00Z', 3 ),
-- (3221, '2019-12-24T07:00:00Z', 3 ),
-- (3222, '2019-12-23T07:00:00Z', 3 ),
-- (3223, '2019-12-22T07:00:00Z', 3 ),
-- (3224, '2019-12-21T07:00:00Z', 3 ),
-- (3225, '2019-12-20T07:00:00Z', 3 ),
-- (3226, '2019-12-19T07:00:00Z', 3 ),
(3227, '2019-12-18T07:00:00Z', 3 ),
(3228, '2019-12-17T07:00:00Z', 3 ),
(3229, '2019-12-16T07:00:00Z', 3 ),
(3230, '2019-12-15T07:00:00Z', 3 ),
(3231, '2019-12-14T07:00:00Z', 3 ),
(3232, '2019-12-13T07:00:00Z', 3 ),
(3233, '2019-12-12T07:00:00Z', 3 ),
(3234, '2019-12-11T07:00:00Z', 3 ),
(3235, '2019-12-10T07:00:00Z', 3 ),
(3236, '2019-12-09T07:00:00Z', 3 ),
(3237, '2019-12-08T07:00:00Z', 3 ),
(3238, '2019-12-07T07:00:00Z', 3 ),
(3239, '2019-12-06T07:00:00Z', 3 ),
(3240, '2019-12-05T07:00:00Z', 3 ),
(3241, '2019-12-04T07:00:00Z', 3 ),
(3242, '2019-12-03T07:00:00Z', 3 ),
(3243, '2019-12-02T07:00:00Z', 3 ),
(3244, '2019-12-01T07:00:00Z', 3 ),
(3245, '2019-11-30T07:00:00Z', 3 ),
(3246, '2019-11-29T07:00:00Z', 3 ),
(3247, '2019-11-28T07:00:00Z', 3 ),
(3248, '2019-11-27T07:00:00Z', 3 ),
(3249, '2019-11-26T07:00:00Z', 3 ),
(3250, '2019-11-25T07:00:00Z', 3 ),
(3251, '2019-11-24T07:00:00Z', 3 ),
(3252, '2019-11-23T07:00:00Z', 3 ),
(3253, '2019-11-22T07:00:00Z', 3 ),
(3254, '2019-11-21T07:00:00Z', 3 ),
(3255, '2019-11-20T07:00:00Z', 3 ),
(3256, '2019-11-19T07:00:00Z', 3 ),
(3257, '2019-11-18T07:00:00Z', 3 ),
(3258, '2019-11-17T07:00:00Z', 3 ),
(3259, '2019-11-16T07:00:00Z', 3 ),
(3260, '2019-11-15T07:00:00Z', 3 ),
(3261, '2019-11-14T07:00:00Z', 3 ),
(3262, '2019-11-13T07:00:00Z', 3 ),
(3263, '2019-11-12T07:00:00Z', 3 ),
(3264, '2019-11-11T07:00:00Z', 3 ),
(3265, '2019-11-10T07:00:00Z', 3 ),
(3266, '2019-11-09T07:00:00Z', 3 ),
(3267, '2019-11-08T07:00:00Z', 3 ),
(3268, '2019-11-07T07:00:00Z', 3 ),
(3269, '2019-11-06T07:00:00Z', 3 ),
(3270, '2019-11-05T07:00:00Z', 3 ),
(3271, '2019-11-04T07:00:00Z', 3 ),
(3272, '2019-11-03T07:00:00Z', 3 ),
(3273, '2019-11-02T07:00:00Z', 3 ),
(3274, '2019-11-01T07:00:00Z', 3 ),
(3275, '2019-10-31T07:00:00Z', 3 ),
(3276, '2019-10-30T07:00:00Z', 3 ),
(3277, '2019-10-29T07:00:00Z', 3 ),
(3278, '2019-10-28T07:00:00Z', 3 ),
(3279, '2019-10-27T07:00:00Z', 3 ),
(3280, '2019-10-26T07:00:00Z', 3 ),
(3281, '2019-10-25T07:00:00Z', 3 ),
(3282, '2019-10-24T07:00:00Z', 3 ),
(3283, '2019-10-23T07:00:00Z', 3 ),
(3284, '2019-10-22T07:00:00Z', 3 ),
(3285, '2019-10-21T07:00:00Z', 3 ),
(3286, '2019-10-20T07:00:00Z', 3 ),
(3287, '2019-10-19T07:00:00Z', 3 ),
(3288, '2019-10-18T07:00:00Z', 3 ),
(3289, '2019-10-17T07:00:00Z', 3 ),
(3290, '2019-10-16T07:00:00Z', 3 ),
(3291, '2019-10-15T07:00:00Z', 3 ),
(3292, '2019-10-14T07:00:00Z', 3 ),
(3293, '2019-10-13T07:00:00Z', 3 ),
(3294, '2019-10-12T07:00:00Z', 3 ),
(3295, '2019-10-11T07:00:00Z', 3 ),
(3296, '2019-10-10T07:00:00Z', 3 ),
(3297, '2019-10-09T07:00:00Z', 3 ),
(3298, '2019-10-08T07:00:00Z', 3 ),
(3299, '2019-10-07T07:00:00Z', 3 );

SELECT setval('habit_records_id_seq', (SELECT MAX(id) from "habit_records"));


-- do something with the below
-- SELECT * FROM habits INNER JOIN habit_records ON habit_records.habit_id=habits.id;

COMMIT;