add-content -path C:\Users\HP\.ssh\config -value @"

Host dev-node
  HostName ${hostname}
  User ${user}
  IdentityFile ${identityfile}
"@