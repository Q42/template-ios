Ticket: <!-- ticket link -->

## Description of changes

<!-- Replace this with a short description of the changes made, specifically focused on the choices you have made within those changes. -->

## How to validate the changes

<!-- Describe how to validate the changes that are made. -->

## ✅ Definition of Done

This checklist helps with risk management during software development. 
It is not a mandatory list to fully check off, but a basis for thinking about quality, safety, and best practices. 
Feel free to adapt it for your own project — as long as the risks are consciously managed.

### 📄 Documentation & Knowledge Sharing

* [ ] Code is documented where necessary (especially for public APIs, complex logic)
* [ ] `README.md` or relevant project documentation is updated
* [ ] Any architectural or project-wide decisions are shared (e.g. Notion, Confluence)

### 🧪 Testing & Quality

* [ ] Unit tests are written or updated (if applicable)
* [ ] UI tests are added or updated (if feature affects UI)
* [ ] CI pipeline passes (GitHub Actions, Bitrise, etc.)
* [ ] Manual testing has been performed on real device(s) and/or simulator
* [ ] App builds and runs successfully in both **Debug** and **Release** configurations

### 🧰 App-Specific Checks

* [ ] Feature behaves correctly on different screen sizes (e.g. iPhone SE, iPhone 15 Pro Max)
* [ ] Dark Mode and Light Mode are both tested
* [ ] Localizations are correctly displayed (if applicable)
* [ ] Accessibility traits are verified (VoiceOver, Dynamic Type, etc.)
* [ ] App icons, assets, and Launch Screen remain unaffected (or are updated if needed)
* [ ] No hardcoded strings or layout dimensions — use `String(localized:)` and Auto Layout properly

### 📊 Monitoring & Performance

* [ ] Instruments (Time Profiler, Leaks, etc.) checked if relevant
* [ ] Analytics or crash logging (e.g. Firebase, Sentry) integration is verified
* [ ] Performance and memory impact considered (e.g. lazy loading, image caching)

### 🔐 Security & Privacy

* [ ] The changes comply with our [Secure software development policy](https://www.notion.so/q42/12-Secure-software-development-policy-3be5262f736c4a2a854fa2543d90c8be?pvs=4)
* [ ] No sensitive data is logged
* [ ] Keychain, biometric, or secure storage is used appropriately
* [ ] Input validation, authentication, and authorization are properly handled
* [ ] Network requests are made over HTTPS
* [ ] App Transport Security settings are correctly configured
* [ ] User permissions (camera, location, etc.) have clear intent and fallbacks

### 🧩 Traceability & Readiness

* [ ] A Jira ticket is linked, and the ticket number is included in the PR title
* [ ] No unresolved `TODO`s remain in the code (unless followed up with a Jira ticket)
* [ ] New build settings or entitlements are reviewed and documented

### 🤝 Review & Collaboration

* [ ] Code follows iOS project conventions (naming, file structure, etc.)
* [ ] Code is peer-reviewed by at least one team member
* [ ] Impacted stakeholders or QA have been notified
* [ ] Merge strategy and release timing are agreed upon
