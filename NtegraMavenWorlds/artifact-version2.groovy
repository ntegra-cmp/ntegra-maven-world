import hudson.model.*;
import hudson.util.*;

def build = Thread.currentThread().executable
def mavenVer = currentBuild.getParent().getModules().toArray()[0].getVersion();
def newParamAction = new hudson.model.ParametersAction(new hudson.model.StringParameterValue("ARTIFACT_VERSION", mavenVer));
currentBuild.addAction(newParamAction);