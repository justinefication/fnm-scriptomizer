# 🚀 FNM × 💻 Your Favorite IDE

FNM boasts a fast and simple Node.js version manager, built in Rust. The one drawback is that it features a session-based environment, which becomes problematic for IDEs that don't support JSON configuration.

## Enter the 🧑‍💻 Scriptomizer

A simple set of Batch and PowerShell scripts used to allow your IDE to use FNM-managed Node.js.

## Configuration

### JetBrains IDE
1. Open the settings window by clicking ```File``` ```>``` ```Settings```
2. Head over to ```Languages & Frameworks``` section and click ```Node.js```
3. In the ```Node interpreter``` select ```Add...``` and then ```Add Local...```
4. In the dialog box that appears, find and select ```fnm-node.bat```
5. Do the same for ```Package manager```, but link it to ```fnm-packagemanager.bat```
6. You should begin to see version numbers alongside the path of the scripts.

**JetBrains IDE can't directly run PowerShell scripts by default**; that's why we have a tiny Batch (```.bat```) wrapper around our PowerShell scripts, and it's important to link to these Batch files instead of the PowerShell scripts.
