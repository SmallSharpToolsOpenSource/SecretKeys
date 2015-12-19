# Secret Keys

Often keys are required for configuring analytics or accessing services
for an iOS app and these keys are sometimes hard-coded or added to the 
app's Info.plist. Placing these strings into source control, especially 
for Open Source projects, exposes these protected configuration values to
more people than you may like.

## How It Works

For this sample project a file is placed at `~/.secretkeys` which is 
simply a shell script which exports some variables.

```sh
export Greeting="Hello!"
export SecretCode="1234"
export SecretToken="abc123"
```

In the app a file named `Keys.plist` has default values which are replaced 
when the build is run.

```xml
<plist version="1.0">
<dict>
        <key>Greeting</key>
        <string>DEFAULT</string>
        <key>SecretCode</key>
        <string>DEFAULT</string>
        <key>SecretToken</key>
        <string>DEFAULT</string>
</dict>
</plist>
```

The script named `update_keys.sh` in the root of the project
directory is run by a build script called `Update Keys` in `Build Phases`
which is placed after `Copy Bundle Resources` so it modifies `Keys.plist`
after it is copied to the build output folder.

Placing `update_keys.sh` at the root of the project directory instead
of the `Build Phases` makes it easier to edit as there may be changes
needed from time to time and editing within the Xcode `Build Phases` 
is not ideal for editing shell scripts.

---
Brennan Stehling - 2015
