# iTask Live Ops

## First Read

- Start with `docs/agent/README.md`, `project.md`, this file, and `known-fixes.md`.
- Treat repo docs as routing context only.

## Firebase

- Firebase project: `done-507cd`.
- Reads such as project/app discovery are safe.
- Firestore writes, Auth changes, Remote Config writes, and deploys are mutating; state target collection/config and readback plan first.

## App Store Connect and Release

- No Fastlane lane is configured.
- ASC app id is not configured in repo; verify live before metadata, pricing, build, or review-submission work.

## Do Not Store

- Do not commit Firebase exports, generated analytics reports, IPA/dSYM files, or credential files.
