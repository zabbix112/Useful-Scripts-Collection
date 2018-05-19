#this script backup system inportants file 
  
    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`

        [Security.Principal.WindowsBuiltInRole] "Administrator"))

    {

        Write-Warning "You are not admin user on the system."

        Break

    }
    else
    {
                  
                 
                Write-Output "Temp files being deleting...................."
                #delete temporary files.
               $InternetTempPath = "C:\Users\$env:USERNAME\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"
               rm -Recurse -Force $InternetTempPath
               rm -Recurse -Force C:\Windows\Temp\*
               rm -Recurse -Force C:\Users\$env:USERNAME\Recent
              
              
              
               Write-Output "Temp files deletion completed."
   
        
            
    }
    
    Read-Host "Press any key to continue.........."