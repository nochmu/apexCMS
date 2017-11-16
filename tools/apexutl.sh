#!/bin/bash

basedir=$(readlink -f $(dirname $_)/../)
APEX_UTILITIES=$basedir/lib/apex/utilities
JDBC=${basedir}/lib/utPLSQL-cli/lib/ojdbc8-12.2.0.1.jar
CLASSPATH=$APEX_UTILITIES:$JDBC:$CLASSPATH
java="java -classpath $CLASSPATH "

DB_HOST=oradev
DB_PORT=1521
DB_DEV_SERVICE=dev.loc
DB_DEV_USER=DEMO
DB_DEV_PW=demo
DB_DEV="${DB_HOST}:${DB_PORT}/${DB_DEV_SERVICE}"
DB_TEST_SERVICE=test.loc
DB_TEST_USER=DEMO
DB_TEST_PW=demo
DB_TEST="${DB_HOST}:${DB_PORT}/${DB_TEST_SERVICE}"

WS_ID=2288666055166000
APP_ID=500
APP_FILE="f${APP_ID}.sql"
WS_FILE="w${WS_ID}.sql"

#echo "Export Workspace"
#$java oracle.apex.APEXExport \
#		-db $DB_DEV			\
#		-expWorkspace 		\
#		-workspaceid ${WS_ID}  \
#		-user ${DB_DEV_USER} \
#		-password ${DB_DEV_PW} 


echo "Export Application "
$java oracle.apex.APEXExport \
		-db $DB_DEV			\
		-applicationid ${APP_ID}  \
		-skipExportDate \
		-user ${DB_DEV_USER} \
		-password ${DB_DEV_PW} 
		
		
$java oracle.apex.APEXExportSplitter ${APP_FILE} -update
 

sqlplus=/usr/lib/oracle/12.2/client64/bin/sqlplus 

echo "Import Workspace into DB_TEST"
echo "sqlplus -S -L $DB_TEST_USER/$DB_TEST_PW@$DB_TEST @${WS_FILE}"


echo "Import APP into DB_TEST"
echo "sqlplus -S -L  $DB_TEST_USER/$DB_TEST_PW@$DB_TEST @${APP_FILE}"

		
		
		

		
		
