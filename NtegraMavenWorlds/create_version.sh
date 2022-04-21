logSuffix="create_version.sh:"
echo $logSuffix

ARTIFACTPATH=$WORKSPACE/$POM_ARTIFACTID/target
NTG_DEPLOYTYPE=fetch
NTG_VERSION=$(cat $ARTIFACTPATH/ntg_build.properties|grep NTG_RELEASE_NAME|cut -d '=' -f 2)
NTG_FETCHRUL=$(cat $ARTIFACTPATH/ntg_build.properties|grep RELEASE_DOWNLOAD_URL|cut -d '=' -f 2)
echo "$logSuffix NTG_VERSION: $NTG_VERSION"
echo "$logSuffix NTG_FETCHRUL: $NTG_FETCHRUL" 
#NTG_ACCESSTOKEN=1500 # read from jenkins build parameters
#NTG_DEPLOYMENTID=18  # read from jenkins build parameters
jsonResult=$(curl -XPOST "$NTG_APISERVERURL/api/deployments/$NTG_DEPLOYMENTID/versions" -H "Authorization: Bearer $NTG_ACCESSTOKEN" -H "Content-Type: application/json" -d "{\"version\": {\"version\": \"$NTG_VERSION\",\"deployType\":\"$NTG_DEPLOYTYPE\",\"fetchUrl\": \"$NTG_FETCHRUL\"}}")
echo "$logSuffix $jsonResult"