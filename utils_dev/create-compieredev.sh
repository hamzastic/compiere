# ***********************************************************************
# Modifications and additions made by Mayking to this file are subject
# to the Mayking Public License Version 1.0 ("Mayking License"); You may not
# use this modification and additions except in compliance with the Mayking
# License. You may obtain a copy of the Mayking License at
# http://www.mayking.com/opensuite/license.html
# 
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
# the specific language governing rights and limitations under the License.
#
# The Original Code is OPENSUITE 
# The Initial Developer of the Original Code is Mayking
# Portions created by Mayking are Copyright � Mayking. All Rights 
# Reserved.
#
# Contributor: ML, Mayking .
# ****************************************************************************

# This script is not supported.
# create-compieredev.sh
# Run it from the compiere-all/utils_dev directory.

# *** MODIFY BELOW THIS LINE SHOULD NOT BE REQUIRED.   ***
__RED="\e[1;31m"
__NONE="\e[0m"
__NAME=$__RED"create-compieredev>"$__NONE
__ECHO="echo -e"

# Ask to the user.
$__ECHO "$__NAME This script will drop and recreate CompiereDev. Is it ok?"
$__ECHO -n "$__NAME Type \"recreate compieredev\" to say yes. "
read __ANS
if [ "$__ANS" != "recreate compieredev" ]; then
  $__ECHO "$__NAME Wrong answer. This script will exists."
  exit 1
fi

# Drop and recreate CompiereDev.
$__ECHO "$__NAME About to execute: "
$__ECHO "$__NAME ----------------> sqlplus system @../db/database/Startup/oracle/CreateUser.sql compieredev com"
$__ECHO "$__NAME Insert system password when asked."
sqlplus system @../db/database/Startup/oracle/CreateUser.sql compieredev com

# Export Compiere.
$__ECHO "$__NAME About to execute: "
$__ECHO "$__NAME ----------------> exp system file=compiere-export.dmp owner=compiere"
$__ECHO "$__NAME Insert system password when asked."
exp system file=compiere-export.dmp owner=compiere

# Import CompiereDev.
$__ECHO "$__NAME About to execute: "
$__ECHO "$__NAME ----------------> imp system file=compiere-export.dmp fromuser=compiere touser=compieredev"
$__ECHO "$__NAME Insert system password when asked."
imp system file=compiere-export.dmp fromuser=compiere touser=compieredev

# Rename Client.
$__ECHO "$__NAME About to execute: "
$__ECHO "$__NAME ----------------> update AD_Client set Name = Name||'Dev';"
sqlplus compieredev/com <<EOF
update AD_client
set Name = Name||'Dev'
;
commit
;
EOF

# End.

