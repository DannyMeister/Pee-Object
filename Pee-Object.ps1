function Pee-Object {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [PSObject]
        $InputObject
    )
    
    begin {
    }
    
    process {
        Write-Host $InputObject;
        Write-Output $InputObject;
    }
    
    end {
    }

<#
.SYNOPSIS

Prints command output console and also sends it down the pipeline.

.DESCRIPTION

The Pee-Object cmdlet redirects output, that is, it sends the output of a command one way and then loops back around to output it (like the letter P). It prints the output to the console and also sends it down the pipeline. It is like Tee-Object, but for Printing.

.PARAMETER InputObject
Specifies the object to be displayed and output. Enter a variable that contains the objects or type a command or expression that gets the objects. You can also pipe an object to Pee-Object.


.INPUTS

You may pipe objects to Pee-Object.

.OUTPUTS

System.Management.Automation.PSObject.
Tee-Object returns the object that it redirects.

.EXAMPLE

PS> Get-PSDrive -PSProvider FileSystem | Pee-Object | %{Get-ChildItem "$_`:`\" -Filter "*.txt" -Recurse -File -ErrorAction SilentlyContinue} | Measure-Object | select Count
C
D
E
F
G

Count
-----
24007


.LINK

https://github.com/DannyMeister/Pee-Object

.LINK

https://www.dannymeister.com/2019/03/26/pee-object.html

.LINK

Tee-Object
#>
}

Set-Alias -Name pee -Value Pee-Object;