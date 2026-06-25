# Architectural and design patterns are essential tools in Flutter and general software development to keep code clean, maintainable, and scalable.

***

# What is architecture and design pattern? Any difference between them?

- The easiest way to understand the difference is to use a building analogy
- Architecture is the blueprint for the entire skyscraper
- while Design Patterns are the interior design solutions used inside individual rooms.

# What is Architecture?

- Software Architecture is the high-level structure of your entire application.
- It defines how the major components, layers, and subsystems interact with each other.
- It sets the rules, constraints, and boundaries for the whole project.
-
- Scope: Global (The entire application).
- Decisions made here: How does data flow? How is the project folder structured? How does the UI
  talk to the database? What state management system (like Bloc or Riverpod) will we use?
- Examples: Clean Architecture, MVVM (Model-View-ViewModel), MVC (Model-View-Controller),
  Microservices.
- Analogy: Choosing whether you are building a suburban house, a massive apartment complex, or a
  shopping mall. You cannot easily change this decision halfway through construction without tearing
  everything down.

# What is a Design Pattern?

- A Design Pattern is a low-level, localized solution to a specific, recurring problem within a
  small part of the code.
- It doesn't care about the whole app; it just solves a local coding puzzle efficiently.
-
- Scope: Local (A few specific classes or modules).
- Decisions made here: How do I create this object dynamically? How do I let this widget know when
  that object changes? How do I simplify this messy API call?
- Examples: Singleton, Factory, Repository, Observer, Facade.
- Analogy: Putting a standard master-key lock system on the doors, or installing a specific type of
  plumbing valve. You can change a design pattern in one room without affecting the structural
  integrity of the rest of the building.

# How They Work Together in Flutter

- They are not enemies; they are partners.
- You implement Design Patterns inside of your Architecture.
-
- Imagine you are building a Flutter app using Clean Architecture (splitting your app into
  Presentation, Domain, and Data layers):
- The Architecture dictates that the Presentation Layer cannot talk directly to the Web API. It must
  go through a middle layer.
- The Design Pattern is how you actually code that middle layer. You implement the Repository
  Pattern to handle the data fetching, and maybe a Factory Pattern to parse the JSON into a Dart
  object.

# Key Differences at a Glance

| Feature              | Architecture                                                        | Design Pattern                                                   |
|:---------------------|:--------------------------------------------------------------------|:-----------------------------------------------------------------|
| **Scale**            | **Macro** (Global blueprint)                                        | **Micro** (Local code solution)                                  |
| **Focus**            | System structure and data flow                                      | Class relationships and object creation                          |
| **Impact of Change** | **High.** Changing architecture usually requires a massive rewrite. | **Low.** Changing a pattern is usually localized to a few files. |
| **Teammate Impact**  | Dictates how *everyone* writes code across the whole app.           | Solves a specific problem for a developer in a specific module.  |
| **Analogy**          | The structural steel skeleton of a building.                        | The layout and wiring of a single kitchen.                       |

# The 3 Core Pillars of App Architecture

Regardless of the specific pattern you choose, most modern app architectures divide code into three
conceptual layers:

1. The Presentation Layer (UI): What the user sees and interacts with (buttons, text, animations).
   It should be "dumb" and only focus on rendering pixels and capturing user inputs.
2. The Domain Layer (Business Logic): The brains of the app. It calculates data, validates rules (
   e.g., "Is this email address valid?"), and decides what happens when a user clicks a button.
3. The Data Layer: The muscle that fetches data. It talks to the internet (APIs), reads from a local
   database, or manages device storage.

# 4 Common Types of App Architecture (With Examples)

Here are the most popular architectural patterns used in mobile development today.

1. MVVM (Model-View-ViewModel)
   This is currently the industry favorite for modern UI frameworks (like Flutter, Jetpack Compose
   on Android, and SwiftUI on iOS).

- The Components:
- View: The UI screen.
- ViewModel: Holds the current "state" of the UI and handles user actions.
- Model: The data and backend logic.
-
- How it works: The View observes the ViewModel. When the ViewModel updates its data, the View
  automatically updates itself.
-
- Real-World Example: Imagine a Weather App.
- The View shows a cloud icon and a temperature.
- When you click "Refresh", the View tells the ViewModel.
- The ViewModel asks the Model for the new weather, updates its internal temperature variable,
  and the View instantly updates to show the new number.
-
- The magic here is Data Binding. The View directly binds itself to properties inside the ViewModel.
  When the user interacts with the View, it updates the ViewModel. When the ViewModel fetches new
  data from the Model, it just updates its own variables. Because the View is "listening" (
  observing), it automatically rewrites itself to show the new data.
- The Flow: A strict one-way dependency chain. The View knows about the ViewModel, and the ViewModel
  knows about the Model. However, the Model has no idea the ViewModel exists, and the ViewModel has
  no idea the View exists.
- The Benefit: Because the ViewModel has zero references to UI components (like buttons or text
  boxes), it is pure logic and can be tested effortlessly with automated unit tests.

2. BLoC (Business Logic Component) / Unidirectional Data Flow (UDF)
   Highly popular in Flutter and similar to Redux in web development. It relies on a strict, one-way
   wheel of data.

- The Components: Events (Inputs)-> BLoC (Processor) -> States (Outputs).
- How it works: The UI cannot change directly. It can only fire an "Event". The BLoC handles that
  event and outputs a brand new "State", which the UI listens to.
- Real-World Example: An E-commerce Shopping Cart.
- You click "Add to Cart". The UI fires an AddToCartEvent.
- The BLoC receives it, calculates the new total price, and emits a CartUpdatedState.
- The UI receives the state and safely updates the cart badge from 0 to 1.

3. Clean Architecture
   Popularized by Robert C. Martin ("Uncle Bob"), this is less of a specific UI pattern and more of
   a strict philosophy for large, enterprise-scale apps. It structures code in concentric circles,
   where the inner circles (business rules) know absolutely nothing about the outer circles (UI,
   Databases, Internet).

- How it works: It uses "Use Cases" or "Interactors" for every single action (e.g.,
  LoginWithEmailUseCase, FetchNewsFeedUseCase).
- Why use it: If you decide to switch your database from Firebase to SQLite, or your UI framework
  from Flutter to Native iOS, you only have to rewrite the outermost layer. The core business logic
  remains completely untouched.

4. MVC (Model-View-Controller)
   The grandfather of architectures. It was dominant for a long time but has largely been phased out
   in modern mobile development.

- The Components: Model (Data), View (UI), and Controller (The brain).
- Why it fell out of favor: In mobile apps, the Controller and the View tend to get tightly glued
  together. This results in what developers jokingly call "Massive View Controllers"—single files
  containing thousands of lines of messy code that are impossible to test.
- The Downside in Mobile: In modern mobile apps, the View and the Controller often become tightly
  coupled into a single file (like an iOS ViewController or an Android Activity). This leads to
  massive, messy files that are incredibly difficult to unit test.

# What are the different design patterns.

Design patterns are generally categorized into three main groups based on the type of problem they
solve: Creational, Structural, and Behavioral.

1. Creational Patterns

- These patterns deal with object creation mechanisms. They try to create objects in a manner
  suitable
  to the situation, helping to make a system independent of how its objects are created, composed,
  and
  represented.

| Pattern              | What It Does                                                                                            | Common Use Case                                                     |
|:---------------------|:--------------------------------------------------------------------------------------------------------|:--------------------------------------------------------------------|
| **Singleton**        | Ensures a class has only one instance and provides a global point of access to it.                      | Database connections, theme managers, shared preferences.           |
| **Factory Method**   | Provides an interface for creating objects but lets subclasses decide which class to instantiate.       | Generating UI widgets based on the OS platform (iOS vs. Android).   |
| **Abstract Factory** | Creates families of related objects without specifying their concrete classes.                          | Switching an entire app's UI kit from Material Design to Cupertino. |
| **Builder**          | Separates the construction of a complex object from its representation, allowing step-by-step creation. | Constructing complex HTTP requests or deep configuration objects.   |
| **Prototype**        | Allows cloning existing objects without making your code dependent on their classes.                    | Creating a copy of a user profile state with minor modifications.   |

2. Structural Patterns
   These patterns explain how to assemble objects and classes into larger structures while keeping
   these structures flexible and efficient. They focus on how classes inherit from each other and
   how they are composed.

Quick Comparison

- Use Facade when you want to wrap multiple complex subsystems into a single, straightforward class.
- Use Adapter when you need to force a single incompatible class (like a third-party plugin) to
  conform to an interface your app already expects.
- Use Repository when you want to manage data operations (network vs. cache) without bleeding
  data-sourcing logic into your UI layer.

| Pattern        | What It Does                                                                                    | Common Use Case                                                                                 |
|:---------------|:------------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------|
| **Facade**     | Provides a simplified, high-level interface to a complex library or subsystem.                  | A single MediaManager class that handles audio, video, and caching libraries behind the scenes. |
| **Adapter**    | Allows objects with incompatible interfaces to collaborate.                                     | Wrapping a 3rd-party payment gateway package so it fits your app's internal payment interface.  |
| **Repository** | Mediates between the domain/business logic and data mapping layers (databases/network).         | Fetching user data from a local cache or a remote API seamlessly.                               |
| **Decorator**  | Dynamically adds new behaviors or responsibilities to an object without altering its structure. | Adding logging or encryption wrappers around a standard network client.                         |
| **Proxy**      | Provides a substitute or placeholder for another object to control access to it.                | Lazy-loading a heavy image or checking user permissions before calling an API.                  |

3. Behavioral Patterns
   These patterns are specifically concerned with communication between objects, how they interact,
   and how responsibilities are distributed among them.

| Pattern             | What It Does                                                                                                                     | Common Use Case                                                                            |
|:--------------------|:---------------------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------|
| **Observer**        | Defines a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing.        | Reactive state management (Streams, ChangeNotifiers, RxDart).                              |
| **Strategy**        | Defines a family of algorithms, encapsulates each one, and makes them interchangeable at runtime.                                | Switching payment methods (PayPal vs. Stripe vs. Apple Pay) at checkout.                   |
| **State**           | Allows an object to alter its behavior when its internal state changes.                                                          | Managing UI states (Loading, Success, Error, Empty).                                       |
| **Command**         | Turns a request or action into a stand-alone object containing all information about the request.                                | Implementing "Undo/Redo" functionality or mapping button clicks to specific actions.       |
| **Template Method** | Defines the skeleton of an algorithm in a superclass but lets subclasses override specific steps without changing its structure. | Creating a base class for data parsers (JSON, CSV, XML) that all follow the same sequence. |