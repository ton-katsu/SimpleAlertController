Simple Alert Controller
============================

Very simple alert controller.

API similar to `UIAlertController`, compatible to iOS 8+


![Movie](https://raw.githubusercontent.com/wiki/ton-katsu/SimpleAlertController/images/SimpleAlertViewController.gif)

### Class Reference

#### SimpleAlertController (UIAlertController)

Creating an Alert Controller

```swift
public convenience init(title titleText: String?,
                 message messageText: String?)

public convenience init(title titleText: String?,
                 message messageText: String?,
                 colorScheme: SimpleAlertColorScheme)
```
Controller's Attributes

```swift
backgroundColor: UIColor!
alertTableColor: UIColor!
textColor: UIColor?
```


#### SimpleAlertAction (UIAlertAction)

Creating an Alert Action

```swift
public init(title: String,
     style: SimpleAlertActionStyle,
     handler: (() -> Void)?)
```

Action's Attributes

```swift
title: String
style: SimpleAlertActionStyle
handler: (() -> Void)?
buttonColor: UIColor?
buttonTextColor: UIColor?
```

#### SimpleAlertActionStyle (UIAlertActionStyle)

```swift
enum SimpleAlertActionStyle: Int {
    case Default
    case Cancel
    case Destructive
}
```

### Usage

#### Use color scheme

Set color scheme.

`enum SimpleAlertColorScheme`

* Cloud
* Lime
* Ocean
* Peach

```swift
let alert = SimpleAlertController(title: "SimpleAlert", message: "It's simple!", colorScheme: SimpleAlertColorScheme.Peach)

let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("cancel")})
let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in print("moved")})
let destructive = SimpleAlertAction(title: "Destructive", style: SimpleAlertActionStyle.Destructive, handler: nil)

alert.addAction(move)
alert.addAction(destructive)
alert.addAction(cancel)

simplePresentViewController(alert, animated: true)
```

#### Custom Color

Set AlertView color.

* backgroundColor
* alertTableColor
* textColor

Set button color

* buttonColor
* buttonTextColor

```swift
let alert = SimpleAlertController(title: "Pop color", message: "custom color alert")
alert.backgroundColor = UIColor(red: 255/255, green: 90/255, blue: 211/255, alpha: 0.7)
alert.alertTableColor = UIColor(red: 51/255, green: 188/255, blue: 255/255, alpha: 1.0)
alert.textColor = UIColor.whiteColor()

let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
move.buttonColor = UIColor(red: 100/255, green: 255/255, blue: 165/255, alpha: 1.0)
move.buttonTextColor = UIColor.whiteColor()

let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
destructive.buttonColor = UIColor(red: 193/255, green: 255/255, blue: 6/255, alpha: 1.0)
destructive.buttonTextColor = UIColor.redColor()

let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Canceled")})
cancel.buttonColor = UIColor.whiteColor()
cancel.buttonTextColor = UIColor(red: 51/255, green: 188/255, blue: 255/255, alpha: 1.0)


alert.addAction(move)
alert.addAction(destructive)
alert.addAction(cancel)
tabBarController?.simplePresentViewController(alert, animated: true)
```

#### Only Menu

`nil` in title and message.

```swift
let alert = SimpleAlertController(title: nil, message: nil, colorScheme: SimpleAlertColorScheme.Peach)

let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in print("Canceled")})

alert.addAction(move)
alert.addAction(destructive)
alert.addAction(cancel)
tabBarController?.simplePresentViewController(alert, animated: true)
```

### Installation

#### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SimpleAlertController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SimpleAlertController', '~> 0.2.2'
end
```

Then, run the following command:

```bash
$ pod install
```

### Reuirements

* iOS 8.0+
* Swift 2.2


## License

    The MIT License (MIT)

    Copyright (c) 2015 ton-katsu

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
