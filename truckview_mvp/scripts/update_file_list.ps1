param(
    [switch]$Watch,
    [int]$PollIntervalSec = 1
)

# Root is the workspace folder (parent of scripts)
$Root = (Resolve-Path (Join-Path $PSScriptRoot ".." )).Path
$OutFile = Join-Path $Root "project_file_list.txt"

function Generate-FileList {
    Write-Host "Generating file list..."
    $items = Get-ChildItem -Path $Root -Recurse -Force -File -ErrorAction SilentlyContinue |
        Where-Object { 
            $_.FullName -notmatch '\\.git(\\\\|$)' -and
            $_.FullName -notmatch '\\build(\\\\|$)' -and
            $_.FullName -notmatch '\\.vs(\\\\|$)' -and
            $_.FullName -notlike "$OutFile"
        } |
        Sort-Object FullName

    $rel = $items | ForEach-Object {
        $relative = $_.FullName.Substring($Root.Length + 1)
        $relative = $relative.TrimStart('\','/') -replace '\\','/'
        $relative
    }

    $rel | Set-Content -LiteralPath $OutFile -Encoding UTF8
    Write-Host "Wrote $($rel.Count) entries to $OutFile"
}

function Get-Snapshot {
    Get-ChildItem -Path $Root -Recurse -Force -File -ErrorAction SilentlyContinue |
        Where-Object { 
            $_.FullName -notmatch '\\.git(\\\\|$)' -and
            $_.FullName -notmatch '\\build(\\\\|$)' -and
            $_.FullName -notmatch '\\.vs(\\\\|$)'
        } |
        ForEach-Object { "{0}|{1}" -f $_.FullName, $_.LastWriteTimeUtc.Ticks } |
        Sort-Object | Out-String
}

if (-not $Watch) {
    Generate-FileList
    exit 0
}

# Watch loop using polling (robust across PS versions)
Write-Host "Starting watch loop (poll every $PollIntervalSec second(s)) under: $Root"
$prev = Get-Snapshot
Generate-FileList
try {
    while ($true) {
        Start-Sleep -Seconds $PollIntervalSec
        $cur = Get-Snapshot
        if ($cur -ne $prev) {
            Generate-FileList
            $prev = $cur
        }
    }
} catch [System.Exception] {
    Write-Host "Watcher stopped: $($_.Exception.Message)"
}
