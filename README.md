# PlasterDnsServerResourceRecords
Plaster templates for creating Resource Record DSC Resources for the xDnsServer project.

Based on Gael Colas' [Sampler ClassResource Template](https://github.com/gaelcolas/Sampler/tree/master/Sampler/Templates/ClassResource)

## Handling resource properties
Rather than specify each aspect of each property interactively or at the command line (which proved to be very difficult to manage), The template reads CSV files from a directory specified in the plaster template. Each CSV file is named `RecordType`Props.csv. For example: AProps.csv, MxProps.Csv, etc.)

>Note: Uses a modified version of Plaster ([PlasterUnchained](https://github.com/Sudman1/PlasterUnchained)) for greater flexibility in reading from CSV/Advanced logic in templates.

## Component Status

| Complete | Component |
|:--------:|-----------|
|     x    | Record Class Template |
|     x    | Scoped Record Class Template |
|     X    | Localization Strings |
|     X    | Record Examples |
|     X    | Scoped Record Examples |
|     X    | Unit Tests |
|     X    | Scoped Unit Tests |
|     X    | Integration Configs |
|     X    | Integration Tests |
|     X    | Scoped Integration Configs |
|     X    | Scoped Integration Tests |
