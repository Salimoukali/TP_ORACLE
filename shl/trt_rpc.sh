#/bin/bash

#Variables

CHECK_FILE_LOCATION="/home/oracle/check_file/shl"
CHECK_FILE_NAME="check_file.sh"
LOAD_DATA_LOCATION="/home/oracle/TP_ORACLE/shl"
LOAD_DATA_NAME="load_data.sh"
EXTRACT_DATA_LOCATION="/home/oracle/TP_ORACLE/shl"
EXTRACT_DATA_NAME="extract_data.sh"
FILE="trt_rpc"
LOG_LOCATION="../log"
DATE=`date '+%Y%m%d%H%M%S'`
LOG_FILE=${LOG_LOCATION}/${FILE}_${DATE}".log"

#Recuperation des fichiers csv de la machine distante

cd $CHECK_FILE_LOCATION

$CHECK_FILE_LOCATION/$CHECK_FILE_NAME

code_retour=$?

if [ $code_retour -ne 0 ]
then
        echo "ERROR : La recuperation des fichiers de la machine distante a echoué"
        echo "$(date '+%d-%m-%Y %H:%M:%S') > ERROR : La recuperation des fichiers de la machine distante a echoué " >> $LOG_FILE 2>&1
exit 1
fi

cd $LOAD_DATA_LOCATION

$LOAD_DATA_LOCATION/$LOAD_DATA_NAME

code_retour=$?

if [ $code_retour -ne 0 ]
then
        echo "ERROR : Le chargement des fichiers dans la base Oracle a echoué"
        echo "$(date '+%d-%m-%Y %H:%M:%S') > ERROR : Le chargement des fichiers dans la base Oracle a echoué " >> $LOG_FILE 2>&1
exit 1
fi

cd $EXTRACT_DATA_LOCATION

$EXTRACT_DATA_LOCATION/$EXTRACT_DATA_NAME

code_retour=$?

if [ $code_retour -ne 0 ]
then
        echo "ERROR : L extraction des fichiers de la base Oracle a echoué"
        echo "$(date '+%d-%m-%Y %H:%M:%S') > ERROR : L extraction des fichiers de la base Oracle a echoué " >> $LOG_FILE 2>&1
exit 1
fi

echo "Fin de traitement OK"
echo "$(date '+%d-%m-%Y %H:%M:%S') > INFO : Fin de traitement OK " >> $LOG_FILE 2>&1
