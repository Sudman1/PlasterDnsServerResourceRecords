rm .\output -recurse -ErrorAction SilentlyContinue
mkdir .\output
invoke-plasterunchained -TemplatePath .\DnsServerResourceRecordResource -DestinationPath .\output