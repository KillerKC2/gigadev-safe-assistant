# GigaDev AI Agent

Windows desktop agent for GigaChat-assisted software and Minecraft mod development. This repository contains the source and build script; it does not contain a prebuilt Windows executable.

## Features

- Desktop chat UI using GigaChat.
- Browse a selected GitHub repository and branch; double-click files to add them to model context.
- Select local files to add to context. Selected content is sent to GigaChat; do not include secrets or private data unless you accept that disclosure.
- Ask for file changes. The agent displays proposed files; after an explicit confirmation, it creates a **new branch and commit**. It does not change existing branches, delete files, force-push, or merge.
- A second confirmation creates an optional draft pull request.
- Changeable local project folder is saved in settings. The current agent does not execute local commands or builds.

## GitHub setup and permissions

Create a fine-grained GitHub token limited to the intended repository. Grant only `Contents: Read and write` and `Pull requests: Read and write`. Enter it in Settings. The GitHub token stays local in the OS credential vault and is never sent to GigaChat. GitHub's permission checks remain in force; this app cannot bypass them. GitHub Actions/workflow paths and common secret paths are blocked for generated edits.

## Run and build on Windows

Install Python 3.11+, then from PowerShell in this folder:

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
python agent_app.py
```

Enter your GigaChat Authorization key and GitHub token under **Настройки**. Set repository owner/name and base branch, then click **Загрузить**. Double-click repository files to add context. Ask for changes using this format:

```text
---FILE: src/example.java---
complete file contents
```

Review the proposed file list and assistant response. **Опубликовать изменения…** creates a timestamped branch only after confirmation; creating a draft PR requires a separate confirmation. Review the GitHub diff and checks yourself before merging.

Run `build.bat` on Windows to create `dist\GigaDevAIAgent.exe`. The executable is unsigned; SmartScreen may show a warning. The agent runs on the PC and connects to GitHub while open.

## Security

The app does not provide unrestricted PC access, execute arbitrary shell commands, run builds, automatically merge, delete files, or bypass GitHub permissions. Use a repository-scoped token and review every proposed diff. Model output may be incorrect. The OS credential vault stores tokens; revoke the GitHub token in GitHub settings when no longer needed.
