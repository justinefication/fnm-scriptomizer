:: ------------------------------------------------------
:: Copyright (C) 2025 Justine Ang
::
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: This program is distributed in the hope that it will be useful,
:: but WITHOUT ANY WARRANTY; without even the implied warranty of
:: MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
:: GNU General Public License for more details.
::
:: You should have received a copy of the GNU General Public License
:: along with this program.  If not, see <https://www.gnu.org/licenses/>.
:: ------------------------------------------------------
@ECHO OFF

:: ------------------------------------------------------
::  Check if PowerShell Core exist and use it, otherwise
::  fallback to legacy PowerShell.
:: ------------------------------------------------------
SET PWSH_DIR="C:\Program Files\PowerShell\7"
IF EXIST %PWSH_DIR% (
    pwsh -NoProfile -ExecutionPolicy Bypass -File "%~dp0fnm-packagemanager.ps1" %*
) ELSE (
    powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0fnm-packagemanager.ps1" %*
)