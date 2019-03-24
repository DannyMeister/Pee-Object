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
}

Set-Alias -Name pee -Value Pee-Object;