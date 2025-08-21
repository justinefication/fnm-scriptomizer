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
# Use PNPM package manager by default.
#
# PNPM lets you get the benefits of far less disk space usage,
# while also keeping your node_modules clean.
# ----------------------------------------------------
$DEFAULT_PACKAGE_MANAGER = "pnpm"
$configuredPackageManager = (Resolve-Path $fnm.FNM_MULTISHELL_PATH).Path + "\" + $DEFAULT_PACKAGE_MANAGER + ".cmd"

# ----------------------------------------------------
# Read the project's package.json to determine the appropriate
# package manager.
# ----------------------------------------------------
if (Test-Path -Path "./package.json") {
    $packageJson = Get-Content "./package.json" | Out-String | ConvertFrom-Json

    if ([bool] ($packageJson.PSObject.Properties.name -match "packageManager")) {
        $packageManager = $packageJson.packageManager
        $packageManager = $packageManager.Substring(0, $packageManager.IndexOf('@'))

        $configuredPackageManager = (Resolve-Path $fnm.FNM_MULTISHELL_PATH).Path + "\" + $packageManager + ".cmd"
    }
}

# ----------------------------------------------------
# Call the configuredPackageManager and pass along any arguments
# given to fnm-packagemanger.bat
# ----------------------------------------------------
& $configuredPackageManager @args
