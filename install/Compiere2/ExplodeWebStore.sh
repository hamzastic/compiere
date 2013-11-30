# Util to replace a jar with a dir.
function explode_jar() {
  mv $1 $1.orig
  mkdir $1
  cd $1
  jar xf ../$1.orig
  cd ..
  rm $1.orig
}

# Make dirs.
mkdir originalEars
rm -fR originalEars/compiereWebStore.ear
mkdir originalEars/compiereWebStore.ear	

# Move original Jars.
mv jboss/server/compiere/deploy/compiereWebStore.ear originalEars/compiereWebStore.ear.original
mv jboss/server/compiere/deploy/compiereApps.ear originalEars
mv jboss/server/compiere/deploy/compiereRoot.ear originalEars

# Explode WebStore.
cd originalEars/compiereWebStore.ear
jar xf ../compiereWebStore.ear.original
explode_jar Compiere.jar
explode_jar CompiereSLib.jar  
explode_jar compiereApps.jar
explode_jar compiereWebStore.war

# Deploy
cd ..
mv compiereWebStore.ear ../jboss/server/compiere/deploy

