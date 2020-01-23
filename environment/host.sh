#!/bin/bash
#
# Copyright (C) 2020, Mike Moss <msm255243@gmail.com>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
## BEGIN CHROMIUM OS BUILD ENVIRONMENT:

export PATH=~/bin:${PATH}:~/depot_tools
export SOURCE_REPO=~/chromiumos
export REPOSYNC="-j8"

## END CHROMIUM OS BUILD ENVIRONMENT.

# misc
#export GIT_DISCOVERY_ACROSS_FILESYSTEMS=true
