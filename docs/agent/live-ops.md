# iTask Operations

Shared live-ops workflow and official references live at
`$HOME/.agents/skills/mobile-live-ops/`. Use `project.md` for stable
service pointers and read current values from the source system.

## Firebase

- The Firebase project is `done-507cd`.
- Read project/app state live. Firestore, Auth, Remote Config, and deploy changes
  are mutations and require a scoped readback plan.

## App Store Connect

Fastlane and an ASC app id are not configured in the repo. Verify the app live
before metadata, pricing, build, or review-submission work.

Keep Firebase exports, analytics reports, build artifacts, and credentials
outside the repo.
