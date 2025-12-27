# SwiftUITimerDemo

#⏱ SwiftUI Stopwatch App

##Overview

This project is a simple, production-ready stopwatch built using SwiftUI and Combine, designed with clean state management and background-safe behavior. It demonstrates best practices for timers, lifecycle handling, and UI updates in a modern iOS app.

##The stopwatch supports:

- Start
- Stop
- Reset

#Accurate time tracking

Safe handling when the app moves to background or foreground

#Tech Stack

Language: Swift

UI Framework: SwiftUI

State Management: ObservableObject, @StateObject

Concurrency: Main thread updates via SwiftUI

Lifecycle Handling: @Environment(\.scenePhase)

Timer Source: Timer.publish (Combine)

#Architecture

- The app follows a simple MVVM-style separation:
- View (StopWatchTimer)
- Displays time
- Handles user interactions
- Observes state changes from the ViewModel
- ViewModel (StopWatch)
- Owns stopwatch logic
- Manages timer lifecycle
- Publishes elapsed time
- Handles app background/foreground transitions
- This separation keeps UI logic clean and business logic testable.

#Key Design Decisions

1. Combine-based Timer

Instead of Timer.scheduledTimer, the app uses:

Timer.publish(every: 1, on: .main, in: .common).autoconnect()


Why?

##Avoids retain cycles

Integrates naturally with SwiftUI

Automatically stops when view deallocates

Safer for production apps

##2. Background Safety

The stopwatch listens to app lifecycle changes using:

@Environment(\.scenePhase)

This ensures:

Timer pauses when app goes to background

Time stays accurate when app resumes

No unnecessary CPU usage while backgrounded

##3. Main-Thread Safety

All UI updates happen on the main thread, which is required for SwiftUI rendering.
The timer publishes on .main, avoiding race conditions and UI crashes.

#Features

⏯ Start / Stop timer

🔄 Reset timer

🧠 Accurate minute/second formatting

📴 Safe handling of background transitions

🧹 Clean, readable, maintainable code

#How to Run

- Open the project in Xcode 14+

- Select an iOS Simulator or device

- Build & Run (Cmd + R)

- No additional setup required.

#Possible Improvements

- Persist elapsed time using AppStorage or CoreData

- Support lap tracking

- Add unit tests for timer logic

- Replace Timer with ContinuousClock (iOS 17+)

#Learning Outcomes

This project demonstrates:

- Correct timer usage in SwiftUI

- Scene lifecycle management

- ObservableObject best practices

- Avoiding common SwiftUI timer bugs

- Writing production-safe SwiftUI code

#License

This project is for learning and demonstration purposes.
