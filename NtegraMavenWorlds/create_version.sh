export
NTG_DEPLOYTYPE=fetch
NTG_VERSION=$NTG_RELEASENAME
NTG_FETCHRUL=$RELEASE_DOWNLOAD_URL
#NTG_ACCESSTOKEN=1500 # read from jenkins build parameters
#NTG_DEPLOYMENTID=18  # read from jenkins build parameters
curl -XPOST "https://ntegralab.sts-cloud.com/api/deployments/$NTG_DEPLOYMENTID/versions" -H "Authorization: Bearer $NTG_ACCESSTOKEN" -H "Content-Type: application/json" -d "{\"version\": {\"version\": \"$NTG_VERSION\",\"deployType\":\"$NTG_DEPLOYTYPE\",\"fetchUrl\": \"$NTG_FETCHRUL\"}}"