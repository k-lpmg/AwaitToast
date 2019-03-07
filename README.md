# AwaitToast
[![Cocoapods](https://img.shields.io/cocoapods/v/AwaitToast.svg?style=flat)](https://cocoapods.org/pods/AwaitToast)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift](https://img.shields.io/badge/Swift-4.2-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://raw.githubusercontent.com/k-lpmg/AwaitToast/master/LICENSE)

🍞 Basic toast as well as async waiting toast.
Inspired by facebook posting toast.

## Introduction
<p float="left">
<img src="https://user-images.githubusercontent.com/15151687/53893472-9a8e2600-4071-11e9-8c0f-5150376a76f5.gif" width="375" height="812">
<img src="https://user-images.githubusercontent.com/15151687/53893489-a24dca80-4071-11e9-9670-900247bda80d.gif" width="375" height="812">
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
let iconBehavior = ToastBehaviorManager.icon

// Update singletone behavior properties
defaultBehavior.isTappedDismissEnabled = false
defaultBehavior.delay = 3.0
defaultBehavior.showDurarion = 0.3
defaultBehavior.duration = 3.0
defaultBehavior.dismissDuration = 0.3
...
```

## Installation

#### CocoaPods (iOS 9+)

```ruby
platform :ios, '9.0'
use_frameworks!

target 'MyApp' do
    pod 'AwaitToast'
end
```

### Carthage (iOS 9+)

```ruby
github "k-lpmg/AwaitToast"
```


## LICENSE

These works are available under the MIT license. See the [LICENSE][license] file
for more info.

[license]: LICENSE
