# SecureTokenFix
Applescript to fix corrupt Secure Token

Occasionally at my organization we run into users that are unable to run software updates on Apple Silicon. On casual observation the affected user accounts have both Secure Token and Volume Ownership. We have found that removing and re-adding SecureToken to the affected user re-enables their ability to run software updates. This is a short AppleScript to facilitate disabling then re-enabling SecureToken on a macOS user. 
