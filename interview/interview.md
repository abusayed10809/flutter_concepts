# what is flutter

- flutter is google's UI toolkit which is open-source and can be used to build cross platform applications

# why is flutter unique?

- flutter renders the UI itself instead of using native platform UI components
- most cross platform frameworks works from code to call native UI components
- flutter passes it's widgets to the skia/impeller render engine, which outputs the UI element inside the application
  itself, instead of calling native UI components, which gives better performance than other frameworks in terms of
  performance and control by bypassing the bridge UI updates to native components
- then there is the hot reload and hot restart which allows super fast development

# how does flutter code compilation work?

- flutter converts dart code to native arm code using ahead of time (AOT) compilation which ensures near native
  performance

# can you please introduce yourself and tell me a bit about your background?

- hello. my name is sayed. i am a software engineer with 4 years of experience building mobile apps for android and ios
  using flutter. i've worked on different domains, which mostly includes ecommerce, entertainment, logistics, flight
  booking systems, and many others. I've worked with different state management solutions like bloc & getx, along with
  different architecture patterns like clean architecture. In my recent projects, I've been working on developing end to
  end features, integrating backend services, optimizing app performance, and publishing apps to the play store and app
  store. I’ve worked extensively with REST APIs, Firebase services, local databases such as SQLite, push notifications,
  payment integrations, and third-party SDKs. I’ve been involved throughout the development lifecycle, from requirement
  analysis and architecture decisions to deployment and post-release maintenance.Recently, I like to focus on
  deepening my knowledge of Flutter architecture, performance optimization, and Flutter internals to build more
  scalable and maintainable applications. I’m excited about opportunities where I can contribute my experience while
  continuing to grow as a mobile engineer.

# What motivates you to pursue a career specifically in mobile development?

- What initially attracted me to mobile development was the ability to build products that people use every day. Unlike
  many other types of software, mobile applications are highly accessible and have a direct impact on the user
  experience. over time i became particularly interested in flutter because it allowed me to create high quality
  applications for both android and ios from a single codebase while still delivering a native like experience. what
  keeps me motivated is the combination of technical challenges and user impact. i enjoy solving problems related to
  application architecture, performance, scalability and user experience, and it's rewarding to see features i've built
  being used by real users. i also like how quickly the mobile ecosystem evolves. which continuously gives
  me opportunity to learn and improve as an engineer.

# You mentioned working with Flutter for a few years now. Can you walk me through how Flutter's rendering pipeline

# works, from when a widget rebuilds to when pixels appear on the screen?

- flutter's rendering pipeline starts when a widget needs to rebuild due to state changes. when this happens, flutter
  marks the corresponding element as dirty, and schedules a new frame. during the build phase, flutter traverses the
  dirty elements, and calls their build() method to generate a new widget tree.
- flutter then compares the newly built widgets with the existing elements. if the widget type and key matches, flutter
  reuses the existing element and updates it, otherwise, it creates new element.
- once the build phase is complete, flutter moves to the layout phase. the render-object tree is responsible for layout.
  constraints are passed down from parent to child, and sizes are passed back up from child to parent. this determines
  the position and size of each render object.
- after layout, flutter enters the paint phase. the render-objects generate painting commands, which are recorded in a
  layer tree.
- finally, layer tree is handed to flutter's rendering engine, which uses impeller or skia to rasterize the drawing
  commands into pixels and render them on the screen through the GPU

setState()
↓
Element marked dirty
↓
Build Phase
(Widget Tree)
↓
Layout Phase
(RenderObject Tree)
↓
Paint Phase
↓
Layer Tree
↓
Skia/Impeller
↓
GPU
↓
Pixels on Screen

# can you describe what happens when setState is called—specifically, how Flutter decides which widgets to rebuild and how it optimizes that process? Does setState() rebuild the whole app?

- no, setstate marks the associated element as dirty. flutter rebuilds the widgets subtree, not the entire application.
  after rebuilding, flutter determines whether layout and paint are actually needed, and only the affected render
  objects are updated.

# Can you explain how Flutter uses keys to preserve widget state during rebuilds, and when would you choose a GlobalKey versus a ValueKey in a real application

# can you describe how you would structure a Flutter app using Clean Architecture, and explain how data flows from the UI layer through the domain layer to the data layer?

# can you describe a situation where you had to refactor code to follow SOLID principles, and what specific principle helped you solve a design problem

# can you complete that thought and give me a concrete example from your Flutter projects where violating or following that principle made a real difference in your code's maintainability?

# can you explain how Bloc or Cubit handles asynchronous state transitions, and how you would manage error states and loading states in a production feature you've built?

# In a complex feature with multiple simultaneous API calls, how would you handle scenarios where one API fails while others succeed, and how would you ensure your UI remains responsive and doesn't show stale data?

# In a real-world scenario where you need to fetch user profile, notifications, and settings simultaneously at app startup, how would you structure your Bloc to emit intermediate states as each API completes, and what pattern would you use to prevent race conditions?

# Now, when working with Bloc, how do you prevent memory leaks from unclosed streams or subscriptions, and can you describe a debugging experience where you identified and fixed a stream-related performance issue in production?

# Can you explain how you would implement proper stream cancellation in a Bloc's close method, and describe a specific pattern you use to manage multiple StreamSubscriptions within a single Bloc to ensure they're all properly disposed?

# Now, thinking about API integration, can you walk me through how you handle token refresh logic when an API returns a 401 error mid-session, especially when multiple requests fail simultaneously?

# In a scenario where five API calls fail with 401 simultaneously, how do you ensure the refresh token is called only once and all pending requests are queued and retried with the new token?

# 

### things to look into

1. what are the different architectural patterns
2. how to improve app performance
2. app profiling