#This powershell script delete user from the Windows system. 


    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`

        [Security.Principal.WindowsBuiltInRole] "Administrator"))

    {

        Write-Warning "You ar not admin on the system."

        Break

    }
    else
    {
        Write-Host "Enter the username to delete:"
        $user = Read-Host #read username

        NET USER $user /DEL 2>&1> log.txt #create a temporary log file from user delete command output
        $result = Get-Content log.txt #read log file
                   foreach ($j in $result)
                   {
                        
                     
                        if($j.Contains("successfully")) #check user is exits on the system or not
                       {
                            Write-Host "'$user' user Successfully delete from the system"
                            break
                           
                       }
                       else
                       {
                             Write-Warning "user '$user' not exists in the system"
                             break
                       }
                       
                   }
              
           
               Remove-Item log.txt #remove temporary log file
  }
  
    Read-Host "Press any key to continue.........."