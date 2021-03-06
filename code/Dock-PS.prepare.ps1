<#

MIT License
Copyright © 2017 by Gee Law

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#>

If ($PSVersionTable.BuildVersion.Build -lt 14393)
{
    Write-Warning -Message 'Dock-PS will not work until Windows 10 Anniversary Update, Version 1607 (Build 14393).';
    Add-Type -TypeDefinition (Get-Content -Path (Join-Path $PSScriptRoot 'Helper.cs') -Raw) | Out-Null;
}
Else
{
    Add-Type -TypeDefinition (Get-Content -Path (Join-Path $PSScriptRoot 'Helper.14393.cs') -Raw) | Out-Null;
}

Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action { [DockPSHelper.AppBarHelper]::CleanUp(); } | Out-Null;
