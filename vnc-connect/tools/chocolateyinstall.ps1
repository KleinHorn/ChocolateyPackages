﻿# download page without login - https://www.realvnc.com/en/connect/download/vnc/
$ErrorActionPreference = 'Stop'
$packageName    = 'vnc-connect'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$bits           = Get-ProcessorBits
$extractDir     = "$toolsDir\extracted"
$url            = "https://www.realvnc.com/download/file/vnc.files/VNC-Server-$env:ChocolateyPackageVersion-Windows-msi.zip"
$checksum       = '387354BBFF6D7D9DE3EAB21B695B490846C9CC75EE66542A260EA0CC79E28A78'


$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $extractDir
  fileType      = 'ZIP' 
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

if ($bits -eq 64)
   {
    $Installer = "$extractDir\VNC-Server-$env:packageVersion-Windows-en-64bit.msi"
   } else {
    $Installer = "$extractDir\VNC-Server-$env:packageVersion-Windows-en-32bit.msi"
   }

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  file           = $Installer
  silentArgs     = '/quiet /qn /norestart'
  validExitCodes = @(0, 3010, 1641)
  softwareName   = 'VNC *'
}
 
Install-ChocolateyInstallPackage @packageArgs

Remove-Item $extractDir -Recurse -Force | Out-Null
