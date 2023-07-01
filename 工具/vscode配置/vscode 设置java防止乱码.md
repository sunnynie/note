# 设置终端为cmd
# "java.debug.settings.vmArgs": "-Dfile.encoding=UTF-8",
#  setting.json
```
 "terminal.integrated.profiles.windows": {

        "PowerShell": {
            "source": "PowerShell",
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
                "${env:windir}\\Sysnative\\cmd.exe",
                "${env:windir}\\System32\\cmd.exe"
            ],
            "args": ["/K", "chcp", "65001"],
            "icon": "terminal-cmd"
        },
 }
 ```