<#PSScriptInfo

.VERSION 1.0.1

.GUID <%= $PLASTER_Guid01 %>

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

Configuration DnsRecord<%= $PLASTER_PARAM_ResourceRecordType %>_Mandatory_config
{
    Import-DscResource -ModuleName 'xDnsServer'

    Node localhost
    {
        DnsRecord<%= $PLASTER_PARAM_ResourceRecordType %> 'TestRecord'
        {
<%

$propertyData = Import-CSV -Path "$PLASTER_PARAM_PropDir/$($PLASTER_PARAM_ResourceRecordType)Props.csv" | Where-Object { $_.Required }

$padsize = [Math]::Max('ZoneName'.length, ($propertyData.Name | ForEach-Object { $_.length } | Sort-Object -Descending | Select-Object -first 1))

"            $('ZoneName'.PadRight($padSize)) = 'contoso.com'"

foreach ($paramDef in $propertyData) {
    "            $($paramDef.Name.PadRight($padSize)) = $($paramDef.ExampleDesiredValue)"
}

"            $('Ensure'.PadRight($padSize)) = 'Present'"
%>
        }
    }
}
