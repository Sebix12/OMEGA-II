set githubdb=https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/db/
set github=https://raw.githubusercontent.com/Sebix12/OMEGA-II/main/
powershell -Command "(New-Object Net.WebClient).DownloadFile('%githubdb%editor.db', 'editor.db')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('%githubdb%ssh.db', 'ssh.db')"
