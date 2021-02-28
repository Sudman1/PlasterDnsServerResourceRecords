<#PSScriptInfo

.VERSION 1.0.1

.GUID <%= $PLASTER_Guid02 %>

.AUTHOR DSC Community

.COMPANYNAME DSC Community

.COPYRIGHT DSC Community contributors. All rights reserved.

.TAGS DSCConfiguration

.LICENSEURI https://github.com/dsccommunity/xDnsServer/blob/main/LICENSE

.PROJECTURI https://github.com/dsccommunity/xDnsServer

.ICONURI https://dsccommunity.org/images/DSC_Logo_300p.png

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES
Updated author, copyright notice, and URLs.

.PRIVATEDATA 2016-Datacenter,2016-Datacenter-Server-Core

#>

#Requires -Module xDnsServer


<#
    .DESCRIPTION
        This configuration will ensure a DNS <%= $PLASTER_PARAM_ResourceRecordType %> record exists when only the mandatory properties are specified.
#>

Configuration DnsRecordSrv_config
{
    Import-DscResource -ModuleName 'xDnsServer'

    Node localhost
    {
        DnsRecord<%= $PLASTER_PARAM_ResourceRecordType %>Scoped 'TestRecord'
        {
<%
$props = @()
$padSize = 0
$parameterDefinitions = "$PLASTER_PARAM_KeyParams, $PLASTER_PARAM_MandatoryParams" -split ",\s*"
foreach ($paramDef in $parameterDefinitions) {
    $prop = $paramDef -split "]\s*" | Select-Object -Last 1
    $props += $prop
    $padSize = [math]::Max($padSize, ($prop.Length + 1))
}

"            $('ZoneName'.PadRight($padSize)) = 'contoso.com'"
"            $('ZoneScope'.PadRight($padSize)) = 'external'"

foreach ($prop in $props) {
    $propName, $propVal = $prop -split '\s*=\s*'
"            $($propName.PadRight($padSize)) = $propVal"
}

"            $('Ensure'.PadRight($padSize)) = 'Present'"
%>
        }
    }
}
