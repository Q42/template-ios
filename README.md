# Q42 iOS template

This is a template for creating iOS projects at Q42. It has opinionated defaults and boilerplate, based on how we do iOS projects at Q42.

## Using this template

1. Click the green "Use this template" button in the Github repo to create your own repository with this code template.
1. Clone the new repo locally on your machine.
1. Run `python3 ./scripts/rename-project.py` from the project root, to change the project name. The script will ask for your new project name. You can delete the script afterwards.
1. Optional: Configure GitHub Actions for TestFlight and App Store builds. Edit `build.yml` to enable the workflow trigger. Set an App Store Connect API key and signing certificate in your GitHub Actions Secrets as described in this readme under [CI configuration](#ci-configuration).

## Features

Only basic features that almost all projects use, were added in this template:

* SwiftUI using the SwiftUI lifecycle with an AppDelegate
* Implementation of the Clean Architecture
* Dependency injection using the library Factory
* Unit tests and UI tests using Salad
* GitHub Actions CI configuration that runs the tests and submits the app to TestFlight

Xcode 15.3 or higher is required.

## Code style

The Xcode project is configured to use 4 spaces for indentation.
For linting Swift source code, we use [SwiftLint](https://github.com/realm/SwiftLint).
A configuration for [SwiftFormat](http://github.com/nicklockwood/SwiftFormat) is also included.

## App architecture

### Core principles

This app is built using SwiftUI and targets iOS 15 and higher. We use SwiftUI as much as possible, but fall back to UIKit views using view(controller) representables where needed.

We try to stick to the Apple conventions and write idiomatic SwiftUI code. Do things the Apple way. Lean in to the platform instead of fighting it.

Keep it simple. Less is more.

### Architecture patterns

We use the [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) pattern, combined with dependency injection.

#### Clean Architecture layers

- *Features* with SwiftUI views and view models
- *Domain* for domain models, UseCases and other domain logic.
- *Data* for persistent data storage and retrieval using Repositories.

#### Use cases

- Use cases are single-purpose: GetUserUseCase, but also: GetUserWithArticlesUseCase.
- Use cases can call other use-cases.
- Use cases do not have persistent state. They are instantiated, called to perform their function once or multiple times, and are then discarded.

#### Dependency injection

Dependency injection (DI) means that objects don't instantiate the objects or configurations that they require themselves, but they are passed in from the outside.
This is useful, because it makes code easier to test and easier to change. It promotes good separation of concerns.

We use [Factory](https://github.com/hmlongco/Factory) as a DI container.

### Modules & libraries

* Preferably use the Swift Package Manager for dependencies. Use other package managers only if there's no other option.
* Only extract code into a package if there are strong reasons to do so. For example:
    * It is used from at least two different targets/packages, or is a candidate to be extracted to an open-source package.
    * It is completely self-contained.

When choosing a third-party library, prefer libraries that:

* Are written in idiomatic Swift or Objective-C that sticks to best practices.
* Have as few dependencies of its own as possible. Preferably none.
* Aren't too big, in order to keep compile times and bloat in check.

### Testing

* For business logic, we write unit tests.
* For testing the user interface, we write UI tests in a behaviour-driven way using the [Salad](https://github.com/Q42/Salad) library.
* Tests are run on CI (GitHub Actions). Tests must pass before a PR may be merged and before any sort of build is created.

### Views

* Keep views focused (single-responsibility principle from SOLID). When a view becomes large a, split it up into smaller views.
* Every view gets a UI preview if at all possible. The preview should show the view in different states using dummy data.
* We use [custom SF Symbols](https://developer.apple.com/documentation/uikit/uiimage/creating_custom_symbol_images_for_your_app/) whenever a custom icon is needed, so that they render in a consistent manner. 

### Accessibility

* Every new component or control should be audited for basic accessibility support:
    * Dynamic type size support
    * VoiceOver support
* Also consider:
    * Bold text support
    * High contrast support
* Use `accessibilityRepresentation` on custom controls to make them accessible. 

### Localization

String catalogs are used to localize the project. The default languages supported are English and Dutch.

### Async code

* `async`/`await` is preferred over Combine/Promises/etc. to leverage the compiler concurrency checking.
* [Combine](https://developer.apple.com/documentation/combine) can be used when `async`/`await` or `AsyncSequence` fall short, and more complexity is needed to solve the problem at hand.

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
