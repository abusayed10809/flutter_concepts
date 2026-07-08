xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

0. Software engineering principles xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- design patterns

- algo ds

- core computer science, process, threading, concurrency, etc. network layer

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

1. Dart Programming Basics & OOPs xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- Data Types & Sound Null Safety: Null-aware operators (??, ?., !), late initialization

- compile-time (const) vs. runtime (final) constants. Function pass by reference pass by value

- Functions & Keywords: Named vs. positional parameters, arrow syntax (=>), and the difference
  between var, dynamic, and Object.

- Object-Oriented Programming (OOP): Mixins (with), Extensions (adding methods to existing classes)

- Interfaces vs. Abstract classes (implements vs. extends), and Factory constructors.

- Dependency Injection

- Asynchronous Programming: Future, async/await, Stream (Single-subscription vs. Broadcast), and
  handling async errors.

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

2. Flutter Architecture & Internals xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- what is Flutter Engine. how does it have both dart and cpp support?

- how Flutter manages its four core threads (UI, Raster, Platform, IO) across these layers during a
  single render frame?

- Dart Virtual Machine (VM) Heap Memory

- The Three Trees: How the Widget Tree, Element Tree, and RenderObject Tree work together.

- Rendering Pipeline: The Build, Layout, and Paint phases.

- Platform Integration: How MethodChannels, EventChannels, and Pigeon handle communication
  between Dart and native code (Java/Kotlin/Swift/Obj-C).

- Build Modes: Debug (JIT compilation, hot reload), Profile (performance tracing), and Release (
  AOT compilation, optimization).

- Engine Architecture (How Flutter is Built) Flutter operates on a three-tier, layered architecture.
  Each layer depends only on the layer below it.

- Embedder (Platform Layer): Written in platform-specific languages (Java/Kotlin for Android,
  Objective-C/Swift for iOS). It acts as the glue between the host operating system and Flutter,
  handling services like accessibility, thread management, and native user inputs.

- Engine (C/C++ Layer): The heavy lifter. It includes the Dart runtime, the Skia/Impeller
  graphics rendering engine, and text-rendering pipelines. It takes the UI you build and rasterizes
  it into raw pixels.

- Framework (Dart Layer): This is where developers spend 99% of their time. It contains the
  foundational building blocks of the UI, including the Rendering layer, the Widgets layer, and
  design-specific libraries like Material (Android style) and Cupertino (iOS style).

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

3. UI Components & Layouts xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- Widgets: The foundational differences between StatelessWidget and StatefulWidget.

- Lifecycle of a StatefulWidget: Understanding createState, initState, didChangeDependencies,
  build, didUpdateWidget, deactivate, and dispose.

- Keys: When and why to use UniqueKey, ValueKey, ObjectKey, and GlobalKey (especially during list
  reordering or maintaining state).

- Layout Constraint Rule: "Constraints go down. Sizes go up. Parent sets position." Difference
  between Expanded vs. Flexible, and SizedBox vs. Container.

- Advanced UI: Slivers (for custom scroll effects) and the LayoutBuilder widget.

- Context and InheritedWidget

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

4. State Management xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- Episodic/Local State: setState and InheritedWidget (the underlying engine for most state
  management).

- Popular Approaches: • BLoC / Cubit: Separation of UI and business logic using Streams. •
  Riverpod / Provider: Compile-safe dependency injection and state mixing. • GetX / MobX: Reactive
  state management.

- Interview Tip: Be ready to explain why you prefer one over the other for specific project
  sizes.

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

5. Networking, Storage, & Architecture xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- API Integration: Making HTTP requests (dio vs http package), parsing JSON data into Type-Safe
  Dart objects, and interceptors. API Security, API Data Leakage Prevention

- Local Databases: Hive or Isar (NoSQL) vs. sqflite (SQL), and Shared Preferences for simple
  key-value pairs.

- App Architecture: Structuring scalable codebases (e.g., Clean Architecture, Feature-First vs.
  Layer-First structuring).

- Architectural patterns, (Repository pattern, Factory pattern, Facade etc)

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

6. Performance Optimization & Tools xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- LCP & Rendering Pitfalls: Mitigating frequent rebuilds, optimizing heavy ListView.builder
  widgets, and using the const constructor.

- DevTools: Profiling memory leaks, identifying UI jank with the Performance overlay, and
  analyzing network requests.

- Images: Image caching and using Skia / Impeller rendering engines.

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

7. Testing & Deployment xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

- Testing Suite: Differences and implementations of Unit Tests, Widget Tests (using finders and
  testers), and Integration Tests.

- CI/CD & Deployment: Flavors/Environments (Dev, Staging, Prod), Code Obfuscation, App Bundle (
  AAB) vs. APK for Android, and using Fastlane or GitHub Actions.