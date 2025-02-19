# Dart + Flutter Onboarding tutorial code

This project contains all code for the forthcoming Flutter and Dart onboarding
experience.
**Googler's see**: go/dash-onboarding-experience

**NOTES! IMPORTANT!**

* The information in this README and the code in this repository is useful for
  organization and planning while DOE is being written. If you aren't reviewing
  the code or referencing the code while writing the tutorial, the source of
  truth for conversation, questions, concerns, etc is the Google Doc at
  go/dash-onboarding-experience (internal only).
* (If you're reading this after DOE has launched) This is not the source of
  truth for the DOE code! The code lives in dart-lang/website and flutter/website (probably).

## Packages

* `/complete` - This dir contains full(er) featured apps. They're built-out
  beyond the initial requirements of the getting stated experiences. Use them as
  a guide that we're building toward.
* `dart_steps` - This dir contains a dart project for every step of Dart's
  getting started experience. See the **Dart** section below for a description
  of the code that's added at each step.
* `flutter_steps` - The same as above, but for Flutter.
* `end` - This dir contains the code as it will be _at the end of the tutorial_.
  It (ideally)
  contains the least possible amount of code while still covering every
  necessary topic and finishing with an interesting, working application.

## Step by step outline

### Dart

#### Dart topic requirements

The agreed upon topics that must appear in the code. In no particular order. (
Googlers see go/dash-onboarding-experience.)

- [x] setup, anatomy
- [x] variables
- [x] functions
- [x] sound typing
- [x] null safety checks
- [x] classes, fields, methods
- [x] control flow: looping
- [x] control flow: branches
- [x] patterns
- [ ] error handling (todo: clean error handling)
- [ ] tests (todo: add more tests)
- [ ] logging (todo: logging)
- [x] libraries and packages
- [x] OOP and class architecture
    - [x] inheritance
    - [x] class modifiers
    - ~~[ ] mixins~~
    - [x] extension types
- [x] enums
- [x] Working with JSON
- [x] Working with YAML
- [x] http
- [x] compile app

#### Part 1 - Intro to Dart

This section is designed to give immediate feedback to the user at every step.
The steps are short, and the topics aren't covered deeply. Its intentionally not
overwhelming and leaves out all extraneous context. For example, the 'async'
step only introduces the `async` and `await` keywords, and ignores theory talk (
event loop) and ignores all other async APIs.

1. Create a Dart project
    * Run `dart create wikipedia_dart`
2. Fundamentals
    * Introduces
        * control flow - if/else
        * Collections (lists, isEmpty, first, for-in loops)
        * variables, const
        * null checks
        * functions and callbacks
        * String interpolation
        * Future.delayed
    * App functionality
        * Reads user input via program arguments
        * prints usage and version
        * When the user enters `wikipedia` and

**Note: Everything below here is a WIP**.

3. Async basics / HTTP
    * Introduces:
        * async / await
        * Future
        * package:http
        * import statements
    * App functionality
        * Now, when the user enters `wikipedia` as an argument, the app will get
          a wikipedia page via it's public API. It will print the response as a
          JSON object.

#### Part 2 - "Real Development"

In this section, the user will start to write "real code" that is
well-architected and written with the future in mind. Topics are covered more
in-depth (if necessary) and code quality alone is one of the payoffs. Not every
lessons needs to end with a dopamine hit payoff (but it should if possible
without forcing.)

1. Libraries and packages
    * "Set's up" the app by properly organizing code and doing a bit of quick
      prep so remaining lessons can stay focused. This lesson might make more
      sense in part 1.
    * Introduces
        * Dart libraries
        * export statements
        * utf8 from dart:convert (Probably gloss over)
        * Streams via stdin.listen (Probably gloss over)
        * imports the shared lib, which contains test data for development
    * App functionality
        * App code is moved into the `lib` folder.
        * The app runs continuously (until exit)
1. Object Oriented Dart
    * Command pattern
    * Introduces
    * App functionality
        * When the user fetches a Wikipedia article, it's printed out in a sane
          way.

Note -- First, use 'Dart' Summary to put something on the screen. Second, use
JSON files Third, use HtTP

### Flutter

#### Flutter topic requirements

The agreed upon topics that must appear in the code. In no particular order. (
Googlers see go/dash-onboarding-experience.)

- [x] setup, anatomy
- [x] Create a `StatelessWidget`
    - [x] `build()`, `setState()`, etc
- [ ] Layout
    - [x] Common layout widgets: Col/Row, `Stack`, `Size`, `Center`, `Scaffold`,
      etc
    - [x] `ListView` (and `ListTile`/`CupertinoListTile`)
    - [x] `Flexible` and `Expanded`
- [x] Composition
    - [x] Build a simple, reusable widget (`RoundedImage`)
- [x] Adaptive design (screen size and platform design system)
    - [x] `MediaQuery`
    - [ ] `LayoutBuilder`
    - [x] `MaterialApp` vs `CupertinoApp`
    - [ ] Create a widget that styles itself based on platform
    - [x] Conditionally show navigation elements that are appropriate for screen
      size (i.e. `NavigationRail` vs `NavigationBar`)
- [x] Theme
    - [x] `TextTheme` and `CupertinoTextTheme`
    - [x] Design consideration when building for Cupertino and Material
- [x] User input
    - [x] Buttons
    - [x] `GestureDetector`
    - [x] `StatefulWidget`
- [x] State management and architecture
    - [x] MVVM
    - [x] Dep Injection (`InheritedWidget`)
    - [x] `ChangeNotifier`, `ListenableBuilder`
- [x] Data and caching
    - [x] In mem data caching (repository classes)
    - [ ] On device persistent caching
- [x] Routing and navigation
    - [x] `Navigator.of(context)`
    - [x] push / pop
    - [x] page routes and default platform transitions
- [ ] Testing and app health
    - [ ] Widget testing
    - [ ] Integration testing?
    - [ ] Logging
    - [ ] IDE and Debugging features
    - [ ] performance measuring
- [ ] Animations
    - [ ] ??? **TODO**
- [ ] Packages and plugins
    - [x] HTTP
    - [x] A local package
    -

Topics to maybe include:

- [x] CustomPainter
- [ ] Scrolling and slivers
    - [ ] `NestedScrollView`
    - [ ] Sliver app bars
- [ ] Concurrency
    - [ ] Isolate.run
    - [ ] Whatever the web equivalent is
- [ ] Platform capabilities
    - [ ] "Direct Platform Interop" ??
- [ ] Publishing Apps
    - [ ] Web (Firebase Hosting)
    - [ ] Mobile ??

#### Part 1 - TODO