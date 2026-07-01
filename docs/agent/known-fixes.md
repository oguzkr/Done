# Known Fixes

Keep this file canonical. Replace stale fixes in place; do not append attempt history.

| Symptom | Current fix | Verify |
|---|---|---|
| Agent assumes Fastlane release support | Treat Fastlane as absent until a `fastlane/Fastfile` is added. | Check repo root and Xcode scheme discovery. |
| Agent wants Firebase current state | Read live Firebase state; do not rely on old local exports. | Cite Firebase CLI/Admin/API source and timestamp. |
