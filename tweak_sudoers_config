#!/bin/bash

set -o errexit

# To set up the Chrome OS build environment, you should turn off the tty_tickets option for sudo,
# because it is not compatible with cros_sdk.
cd /tmp

cat > ./sudo_editor <<EOF
#!/bin/sh
echo Defaults \!tty_tickets > \$1           # Entering your password in one shell affects all shells
echo Defaults timestamp_timeout=180 >> \$1  # Time between re-requesting your password, in minutes
EOF

chmod +x ./sudo_editor
sudo EDITOR=./sudo_editor visudo -f /etc/sudoers.d/relax_requirements

exit $?
