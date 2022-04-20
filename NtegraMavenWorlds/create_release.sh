logSuffix="create_release.sh:"
echo $logSuffix
export
# Publish on github
echo "$logSuffix Switching to packaging folder $POM_ARTIFACTID/target"
cd $POM_ARTIFACTID/target
echo "$logSuffix Publishing on Github..."
token=$NTGERAGITPUBLISHER_TOKEN
# Get the last tag name
tag=$(git describe --tags)
# Get the full message associated with this tag
message="$(git for-each-ref refs/tags/$tag --format='%(contents)')"
artifactfile=$POM_ARTIFACTID"_"$POM_VERSION"_"$BUILD_NUMBER.$POM_PACKAGING
export NTG_ARTIFACTFILENAME=$artifactfile
echo "$logSuffix Artifcat Filename : $artifactfile"
filelcation=`pwd`
echo "$logSuffix Listing File Location: $filelcation"  
ls -l 
# Get the title and the description as separated variables
name=$(echo "$message" | head -n1)
description=$(echo "$message" | tail -n +3)
description=$(echo "$description" | sed -z 's/\n/\\n/g') # Escape line breaks to prevent json parsing problems
# Create a release
echo "$logSuffix Create a release"
release=$(curl -XPOST -H "Authorization:token $token" --data "{\"tag_name\": \"$tag\", \"target_commitish\": \"main\", \"name\": \"$name\", \"body\": \"$description\", \"draft\": false, \"prerelease\": true}" https://api.github.com/repos/ntegra-cmp/ntegra-maven-world/releases)
echo "$logSuffix Release creation result : $release"
# Extract the id of the release from the creation response
id=$(echo "$release" | sed -n -e 's/"id":\ \([0-9]\+\),/\1/p' | head -n 1 | sed 's/[[:blank:]]//g')
echo "$logSuffix Extract Release ID: $id" 
# Upload the artifact
release_json=$(curl -XPOST -H "Authorization:token $token" -H "Content-Type:application/octet-stream" --data-binary @$artifactfile https://uploads.github.com/repos/ntegra-cmp/ntegra-maven-world/releases/$id/assets?name=$artifactfile)
echo "$logSuffix $release_json"
RELEASE_DOWNLOAD_URL=$(echo $release_json | jq '.browser_download_url')
echo "$logSuffix Download URL: $RELEASE_DOWNLOAD_URL"

# Saving Properties for next scripts
echo "$logSuffix NTG_RELEASE_NAME=$name" > ntg_build.properties
echo "$logSuffix RELEASE_DOWNLOAD_URL=$RELEASE_DOWNLOAD_URL" >> ntg_build.properties
