$ErrorActionPreference = 'Stop'
$packageName = 'forticlientvpn'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url64 = 'https://links.fortinet.com/forticlient/win/vpnagent'
$checksum64 = 'D9879EC8B0EB1FC3D47C2476198CEE8C9B56CA733E89634F6FE13B405508A6F5'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url64
  softwareName  = 'FortiClient VPN' 
  checksum64    = $checksum64
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
