logSuffix="deploy_version.sh:"
echo $logSuffix 
ARTIFACTPATH=$WORKSPACE/$POM_ARTIFACTID/target
NTG_VERSION=$(cat $ARTIFACTPATH/ntg_build.properties|grep NTG_RELEASE_NAME|cut -d '=' -f 2)
# NTG_ACCESSTOKEN=**** # read from jenkins build parameters #
# NTG_DEPLOYMENTID=18  # read from jenkins build parameters #
# NTG_INSTANCEID=1500  # read from jenkins build parameters  #
#NTG_APISERVERURL=https://ntegralab.sts-cloud.com # read from jenkins build parameters
jsonResult=$(curl -XPOST "$NTG_APISERVERURL/api/instances/$NTG_INSTANCEID/deploys" -H "Authorization: Bearer $NTG_ACCESSTOKEN" -H "Content-Type: application/json" -d "{\"appDeploy\": {\"deploymentId\": \"$NTG_DEPLOYMENTID\",\"version\": \"$NTG_VERSION\"}}")
echo "$logSuffix $jsonResult"
