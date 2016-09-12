#!/bin/bash
$([ -d /opt/oracle/middleware ] || [ -d /opt/oracle/snibuild ] && [ ! -d /opt/oracle/middleware/ohs/bin ] && [ ! -d /opt/oracle/ohs/ohs/bin ] || [ ! -d /opt/oracle/HTTPServer/bin ] || [ ! -d /opt/oracle/HTTPServer24 ])
RESULT=$?
if [ $RESULT -eq 0 ]
  then echo "install_ohs=true"
  else echo "install_ohs=false"
fi
