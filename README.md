# Pee-Object

*When you don't want to cut off your PowerShell pipeline midstream just to print to console.*

This git repo has an accompanying blog post here: https://www.dannymeister.com/2019/03/26/pee-object.html

## Description

`Pee-Object` prints command output to console and also sends it down the pipeline.

It's like [Tee-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/tee-object), but for **P**rinting objects.  Just as Tee-Object is aliased `tee`, `Pee-Object` is aliased `pee`.

## Uses

This is often useful on one-liner scripts to debug the results of one step in the pipeline before sending it to the next, without having to break your commands onto multiple lines.

It can also be a poor-developer's progress indicator for long running operations in your pipeline.

## Example

Get count of all .txt files on hard drives, and print out each drive letter as you begin to process it.

```powershell
Get-PSDrive -PSProvider FileSystem | pee | %{Get-ChildItem "$_`:`\" -Filter "*.txt" -Recurse -File -ErrorAction SilentlyContinue} | Measure-Object | select Count
```
```
C
D
E
F
G

Count
-----
24007
```

## Installation

This didn't seem to deserve a fancy module for importing into your scripts.  I would recommend simply dot sourcing the file in your profile so it's handy when the need arises.

In %UserProfile%\My Documents\WindowsPowerShell\profile.ps1 add:

```powershell
. C:\path\to\Pee-Object.ps1
```

## Disadvantages

`Write-Host` (on which this command is built) still isn't the best idea in production PowerShell or reusable modules.  As of PowerShell 5, it CAN be redirected to not display console messages, but you still have the chance for console/output race conditions.