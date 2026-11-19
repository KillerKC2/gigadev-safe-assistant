# GigaDev Safe Assistant

Windows desktop starter app for GigaChat-assisted Minecraft mod development. It includes a chat UI, a Fabric mod starter, safe import of public GitHub repositories, selected local-file context, and declarative prompt plugins.

## Safety boundaries

- The assistant does **not** get unrestricted control of your PC. It does not execute shell commands, run builds, install software, delete files, or browse arbitrary folders.
- File proposals are constrained to the selected workspace. With **Automation** off, review the response and confirm before files are written. With it on, valid model-generated file blocks are written automatically **only inside that workspace**. Existing files are backed up as `*.gigadev-backup`.
- Use a dedicated project folder for automated writes. Keep Automation off if you want to inspect every change.
- Local files you attach and your prompts are sent to GigaChat. Do not send secrets or private source without reviewing your provider's terms.
- GitHub import is HTTPS and public-repository only; it has a 30 MB download limit, rejects path traversal, and will not overwrite existing files.
- Plugins are JSON prompt extensions only. Python plugins and executable extensions are deliberately not loaded.

## Run from source

1. Install Python 3.11+ for Windows.
2. In PowerShell, from this folder:

   ```powershell
   py -m venv .venv
   .\.venv\Scripts\Activate.ps1
   pip install -r requirements.txt
   python app.py
   ```

3. On **Настройки и плагины**, enter your GigaChat Authorization key and OAuth scope (`GIGACHAT_API_PERS` is the default). The key is stored using Windows Credential Manager through `keyring`.
4. Choose a dedicated workspace directory.

The API key is never included in the repository. HTTPS certificate verification stays enabled.

## Build a Windows executable

Run `build.bat` on Windows with Python and the dependencies installed. The output is `dist\GigaDevSafeAssistant.exe`. The executable is not signed; Windows SmartScreen may show a warning for locally built binaries.

## Use

- **Чат**: ask for help with Java, Fabric, errors, or mod ideas. Ask explicitly for file blocks if you want a file proposal.
- **Проект**: create a starter Fabric 1.21.1 / Java 21 project, import a public GitHub repository, and inspect workspace file names.
- **Добавить локальные файлы в контекст**: select files to send as context; an extra confirmation is required for files outside the workspace.
- **Настройки и плагины**: enable bounded automation and open `%APPDATA%\GigaDevSafeAssistant\plugins`.

A plugin is a JSON file such as:

```json
{
  "name": "Fabric conventions",
  "prompt": "For Fabric code, prefer small classes and explain registry lifecycle."
}
```

Restart the app after adding or editing a plugin. Plugin instructions are model context, not executable code.

## Notes

The Fabric scaffold is a minimal starter, not a guarantee of build success. Review the generated version numbers against Fabric's current documentation. Network/API failures are shown in the chat. The app does not automatically diagnose or execute compiler output; paste an error into chat to get suggestions.
