# Copyright (C) 2025 Justine Ang
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


# ----------------------------------------------------
# Retrieve fnm environment and convert it to PSObject.
# ----------------------------------------------------
$fnm = fnm env --json | ConvertFrom-Json

# ----------------------------------------------------
# Get the active fnm-managed Node.js version.
# ----------------------------------------------------
$nodePath = (Resolve-Path $fnm.FNM_MULTISHELL_PATH).Path + "\node.exe"

# ----------------------------------------------------
# Call the active fnm-managed Node.js and pass along any arguments
# given to fnm-node.bat
# ----------------------------------------------------
& $nodePath @args