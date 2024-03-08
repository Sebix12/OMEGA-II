set github=https://raw.githubusercontent.com/Sebix12/OMEGA-II-plugin-repo/main/
powershell -Command "(New-Object Net.WebClient).DownloadFile('%github%editor.db', 'editor.db')"
if exist editor.db echo downloaded tool - editor
