#!/bin/bash

USER_NAME="rpc"
PASSWORD="rpc"
ORACLESID="orcl"
SQL_DIR="../sql"
SQL_NAME="emp.sql"
SCRIPT=${SQL_DIR}/${SQL_NAME}
FILE="load_data"
LOG_LOCATION="../log"
DATE=`date '+%Y%m%d%H%M%S'`
LOG_FILE=${LOG_LOCATION}/${FILE}_${DATE}".log"
EXTRACT_SQL_NAME="extract_emp.sql"
EXTRACT_EMP=${SQL_DIR}/${EXTRACT_SQL_NAME}
CSV_FILE_DIR="../out"
CSV_FILE_NAME="emp_${DATE}.csv"
CSV_FILE=${CSV_FILE_DIR}/${CSV_FILE_NAME}
DATABASE=${USER_NAME}/${PASSWORD}@${ORACLESID}

sqlplus ${DATABASE} << FIN | tee -a ${LOG_FILE}
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI:SS';
truncate table rpc.emp;
quit
FIN

sqlldr rpc/rpc control=/home/oracle/TP_ORACLE/cfg/emp.ctl
