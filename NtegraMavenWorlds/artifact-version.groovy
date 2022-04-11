/**
 * Reads the version of the artifact from the MANIFEST.
 * Depends on actually setting version in MANIFEST; Gradle snippet below:
  <pre>
    jar {
      manifest {
        attributes(
          'Implementation-Title': project.name,
          'Implementation-Version': project.version
        )
      }
    }
  </pre>
 */
import hudson.model.*
import java.util.jar.*
def build = Thread.currentThread().executable

// the path to your manifest file will vary - the example below is for a gradle build that produces a jar
// for maven, it would be something like target/classes/META-INF/MANIFEST.MF
Manifest manifest = new Manifest(
        new FileInputStream(
                new File("${build.workspace}/target/classes/META-INF/MANIFEST.MF")));

def implVersion = manifest.getMainAttributes().getValue(Attributes.Name.IMPLEMENTATION_VERSION)
def specVersion = manifest.getMainAttributes().getValue(Attributes.Name.SPECIFICAION_VERSION)
println "Artifact version is $version"
build.addAction(
        new ParametersAction([
                new StringParameterValue("ARTIFACT_VERSION", version),
        ])
)