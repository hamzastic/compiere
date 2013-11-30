unset CLASSPATH
for n in ../lib/*.jar; do
  export CLASSPATH=$n:$CLASSPATH
done
java org.compiere.Compiere

