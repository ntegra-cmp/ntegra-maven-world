export
# Publish on github
cd $POM_ARTIFACTID/target
echo "Publishing on Github..."
token=$NTGERAGITPUBLISHER
# Get the last tag name
tag=$(git describe --tags)
# Get the full message associated with this tag
message="$(git for-each-ref refs/tags/$tag --format='%(contents)')"
artifactfile=$POM_ARTIFACTID"_"$POM_VERSION"_"$BUILD_NUMBER.$POM_PACKAGING
echo "Artifcat Filename : $POM_ARTIFACTID"
filelcation=`pwd`
echo "Artifcat File Location: $filelcation"  
# Get the title and the description as separated variables
name=$(echo "$message" | head -n1)
description=$(echo "$message" | tail -n +3)
description=$(echo "$description" | sed -z 's/\n/\\n/g') # Escape line breaks to prevent json parsing problems
# Create a release
release=$(curl -XPOST -H "Authorization:token $token" --data "{\"tag_name\": \"$tag\", \"target_commitish\": \"main\", \"name\": \"$name\", \"body\": \"$description\", \"draft\": false, \"prerelease\": true}" https://api.github.com/repos/ntegra-cmp/ntegra-maven-world/releases)
# Extract the id of the release from the creation response
id=$(echo "$release" | sed -n -e 's/"id":\ \([0-9]\+\),/\1/p' | head -n 1 | sed 's/[[:blank:]]//g')
# Upload the artifact
curl -XPOST -H "Authorization:token $token" -H "Content-Type:application/octet-stream" --data-binary @$artifactfile https://uploads.github.com/repos/ntegra-cmp/ntegra-maven-world/releases/$id/assets?name=$artifactfile