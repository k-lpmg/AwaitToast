# AwaitToast
[![Build Status](https://travis-ci.org/k-lpmg/AwaitToast.svg?branch=master)](https://travis-ci.org/k-lpmg/AwaitToast)
![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Cocoapods](https://img.shields.io/cocoapods/v/AwaitToast.svg?style=flat)](https://cocoapods.org/pods/AwaitToast)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

🍞 An async waiting toast with basic toast. Inspired by facebook posting toast.

## Introduction
<p float="left">
<img src="https://user-images.githubusercontent.com/15151687/55480707-e1187580-565b-11e9-8922-765f5bede2f4.png" width="400" height="830">
<img src="https://user-images.githubusercontent.com/15151687/55480723-e675c000-565b-11e9-9780-2406e2648ae3.png" width="400" height="830">
</p>
<p float="left">
<img src="https://user-images.githubusercontent.com/15151687/55480760-f4c3dc00-565b-11e9-8bcd-63ae9b5113da.gif" width="400" height="830">
<img src="https://user-images.githubusercontent.com/15151687/55480767-f68d9f80-565b-11e9-8d47-1ed4f1c59be9.gif" width="400" height="830">
</p>

## Usage

#### Default
```swift
let toast: Toast = Toast.default(text: "Toast is started")

// Show
toast.show()

// Dismiss
toast.dismiss()

// Bottom Direction
Toast.default(text: "Toast is started", direction: .bottom)
```

#### Await
```swift
let awaitToast: AwaitToast = AwaitToast.default(initialText: "Toast is started", endText: "Toast is ended")

// Show
awaitToast.show()

// Finish
awaitToast.finish()

// Dismiss
awaitToast.dismiss()
```

#### Dismiss
```swift
// Last toast in queue dismiss
Toast.latestDismiss()
AwaitToast.latestDismiss()

// All toast in queue dismiss
Toast.dismissAll()
AwaitToast.dismissAll()
```

#### Appearance
```swift
// Get singleton appearance object
let defaultAppearance = ToastAppearanceManager.default
let iconAppearance = ToastAppearanceManager.icon

// Update singletone appearance properties
defaultAppearance.height = 128
defaultAppearance.backgroundColor = .white
defaultAppearance.numberOfLines = 1
defaultAppearance.textAlignment = .left
...
```

#### Behavior
```swift
// Get singleton behavior object
let defaultBehavior = ToastBehaviorManager.default
let awaitBehavior = ToastBehaviorManager.await

// Update singletone behavior properties
defaultBehavior.isTappedDismissEnabled = false
defaultBehavior.delay = 3.0
defaultBehavior.showDurarion = 0.3
defaultBehavior.duration = 3.0
defaultBehavior.dismissDuration = 0.3
...
```

#### Self-sizing
<img src="https://user-images.githubusercontent.com/15151687/55480769-f8576300-565b-11e9-9457-79e4b43ad087.gif" width="400" height="830">

```swift
ToastAppearanceManager.default.height = AutomaticDimension
ToastAppearanceManager.icon.height = AutomaticDimension
```

## Installation

#### CocoaPods (iOS 9+)

```ruby
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'AwaitToast'
end
```

#### Carthage (iOS 9+)

```ruby
github "k-lpmg/AwaitToast"
```


## LICENSE

These works are available under the MIT license. See the [LICENSE][license] file
for more info.

[license]: LICENSE
