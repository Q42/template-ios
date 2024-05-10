# Q42 iOS template

This is a template for creating iOS projects at Q42. It has opinionated defaults and boilerplate, based on how we do iOS projects at Q42.

## How to use it

1. In GitHub, press "use this template" to create a new repository.
2. Rename your project using the included Python script.

## Features

Only basic features that almost all projects use, were added in this template:

* SwiftUI using the SwiftUI lifecycle with an AppDelegate
* Dependency injection using Factory
* Unit tests and UI tests using Salad
* GitHub Actions CI configuration that runs the tests and submits the app to TestFlight

Xcode 15.3 or higher is required.

## Code style

The Xcode project is configured to use 4 spaces for indentation.
For linting Swift source code, we use [SwiftLint](https://github.com/realm/SwiftLint).
A configuration for [SwiftFormat](http://github.com/nicklockwood/SwiftFormat) is also included.

## Continuous integration

GitHub Actions is used for continuous integration (CI). The CI runs the automated tests when you make a pull request.
On a push to the `main` branch, it will also run the tests, and if they pass, a build of the app is made and uploaded to TestFlight.

### CI configuration

Five environment secrets are needed for the workflow to run on GitHub Actions.
You may configure these in the repository secret settings on GitHub.

* `BUILD_CERTIFICATE_BASE64` contains a base64-encoded string of the .p12 certificate bundle, used to code sign the app. This bundle needs to contain two certificates: **development** and **distribution**.
* `P12_PASSWORD` contains the password of the certificate bundle.
* `APP_STORE_CONNECT_API_KEY_BASE64` contains a base64-encoded string of the .p8 App Store Connect API key.
* `APP_STORE_CONNECT_API_KEY_ID` contains the key ID of the App Store Connect API key.
* `APP_STORE_CONNECT_API_KEY_ISSUER_ID` contains the issuer ID of the App Store Connect API key.

To create such a certificate bundle, open Keychain Access. Unfold the entries for the development and distribution certificate. Select the certificates and their private keys using shift, then right-click and select "Export 4 items...".

You can encode a file to base64 on the command line like this: `base64 -i ~/Desktop/Certificates.p12 | pbcopy`. This automatically puts the result on your clipboard.
