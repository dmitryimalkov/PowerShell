#list directory that contain files and file size in megabytes (Mb)

Get-ChildItem -Path "C:\Users\dmitr\Documents\EPAM" -Recurse -ErrorAction SilentlyContinue |

#Recurse par tells PowerShell to include subfolders and files
#ErrorAction with the value SilentlyContinue will continue 
#if for whatever reason we cannot read some file

Measure-Object -Property Length -Sum |

#Measure-Object PowerShell CmdLet will do the math for us and calculate the size of folder
#Length property which is the size of the file in bytes
#Sum switch parameter defines the sum-up of the property chosen in the previous parameter

Select-Object @{Name="Size(MB)";Expression={("{0:N2}" -f($_.Sum/1mb))}}, Count

# Select-Object Sum, Count should work but we want data in MB
#Get-ChildItem -Path "C:\Users\dmitr\Documents\EPAM" -Directory -Recurse -Name -Force -ErrorAction SilentlyContinue |
#Select-Object 'Folder path', 'Size(MB)'