#! /bin/sh

# There is no need to call this if you set the MULE_HOME in your environment
if [ -z "$MULE_HOME" ] ; then
  # find the name of the real MULE_HOME which is two levels up
  MULE_HOME=`pwd`
  MULE_HOME=`dirname "$MULE_HOME"`
  MULE_HOME=`dirname "$MULE_HOME"`
  export MULE_HOME
fi

# If MULE_BASE is not set, make it MULE_HOME
if [ -z "$MULE_BASE" ] ; then
  MULE_BASE="$MULE_HOME"
  export MULE_BASE
fi
echo $MULE_BASE

# Any changes to the files in ./conf will take precedence over those deployed to $MULE_HOME/lib/user
MULE_LIB=.
export MULE_LIB

exec "$MULE_BASE/bin/mule" -config mule-cics-rest-config.xml

