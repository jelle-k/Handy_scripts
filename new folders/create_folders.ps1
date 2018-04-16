$folder="C:\XML_Server";   # Directory to place the new folders in.
$txtFile="C:\folders.txt"; # File with list of new folder-names
$pattern="\+";             # Pattern that lines must match      


get-content $txtFile | %{

    if($_ -match $pattern)
    {
        mkdir "$folder\$_";
    }
}