# Secret Keys

Often keys for configuring analytics or accessing services are required for
an iOS app and these keys are sometimes hard-coded or added to the app's 
Info.plist. Placing these strings into source control, especially for
Open Source projects, exposes these protected configuration values to
more people than you may like.

This sample project demonstrates how to use use a file named Keys.plist
which is changed with a script run with each build to read in values
from a configuration file which is in the user's root directory
which is not managed with source control.

The build script also modifies Keys.plist in the build folder, not the
source folder so the original file is unchanged, meaning you won't have
to ignore changes with source control. You can also freely move between
branches without having to revert changes and reapply them repeatedly.

Once your secret keys are set in your configuration file you can let
the script update Keys.plist with every build and work with source
control as you would normally.

## How It Works

For this sample project a file is placed at `~/.secretkeys` which is 
simply a shell script which exports some variables.

```sh
export GREETING="Hello!"
export SecretCode="1234"
export SecretToken="abc123"
```

In `Keys.plist` there are just default values which are placed with the build.

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

The script `update_keys.sh` which is in the root of the project
directory is run by a build script called `Update Keys` in `Build Phases`
which is placed after `Copy Bundle Resources`.

Placing `update_keys.sh` at the root of the project directory instead
of the `Build Phases` makes it easier to edit as there may be changes
needed from time to time and editing within the Xcode `Build Phases` 
is not ideal for editing shell scripts.

---
Brennan Stehling - 2015
