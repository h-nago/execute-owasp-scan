#!bin/bash
echo 'start'
START=`date +%s`
zap-cli start --start-options '-config api.disablekey=true'
if [ "$EXCLUDE" != "" ]; then
    zap-cli exclude $EXCLUDE
    echo "exclude $EXCLUDE"
fi
# zap-cli open-url $TARGET
zap-cli spider $TARGET
zap-cli active-scan --scanners $SCANNERS --recursive $TARGET
zap-cli report -o $OUTPUTFILE -f html
zap-cli alerts -l High -f table
END=`date +%s`
DURATION=`expr ${END} - ${START}`
echo "It took ${DURATION} sec."
