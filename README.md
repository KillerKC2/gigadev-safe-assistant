# GigaDev AI Agent

Windows desktop starter for GigaChat-assisted Minecraft/software development. This repository contains source code; build the executable on Windows using `build.bat`.

## Features

- GigaChat chat with selected GitHub and local-file context.
- Browse a selected GitHub repository. Proposed file changes can be reviewed and published to a new branch after confirmation; draft PR creation requires separate confirmation. Existing branches are not modified; the app does not merge or force-push.
- Local files are scoped to a configurable workspace. With Automation off, confirm each save; with it on, valid proposals are saved automatically only in the workspace. Replaced files are backed up; deletion is not supported.
- Fabric 1.21.1 / Java 21 starter scaffold.
- JSON prompt plugins in `%APPDATA%\\GigaDevSafeAssistant\\plugins`.
- Changeable workspace folder in Settings.

The app does not run shell commands, builds, tests, or other programs. Paste build errors into chat for advice and review suggested fixes before applying.

## Credentials and safety

Create a fine-grained GitHub token limited to the intended repository with `Contents: Read and write` and `Pull requests: Read and write`. Enter it and your GigaChat Authorization key in Settings. Tokens are stored using the OS credential vault and are not sent to GigaChat. GitHub permissions remain enforced. Workflow/action paths and common secret paths are blocked for generated GitHub changes.

Selected file contents are sent to GigaChat. Do not select secrets or private data unless you accept that disclosure. Review generated changes and GitHub diffs.

## Run and build (Windows, Python 3.11+)

```powershell
py -m venv .venv
.\\.venv\\Scripts\\Activate.ps1
pip install -r requirements.txt
python agent_app.py
```

Run `build.bat` to create `dist\\GigaDevAIAgent.exe`. The app needs internet access to use GigaChat/GitHub. The executable is unsigned; SmartScreen may warn.

Request full-file edits in this format:

```text
---FILE: src/example.java---
complete file contents
```

Example plugin JSON: `{"name":"Fabric conventions","prompt":"Explain target Minecraft version and keep changes focused."}`. Restart after editing plugins. Plugins provide instructions only and are not executable code.
