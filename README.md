Simple Alert View Controller
============================

Very simple alert view controller.

API similar to `UIAlertController`, compatible to iOS 7


![Movie](https://raw.githubusercontent.com/wiki/ton-katsu/SimpleAlertController/images/SimpleAlertViewController.gif)

### Usage

#### Use color scheme

```swift
let alert = SimpleAlertController(title: "SimpleAlert", message: "It's simple!", colorScheme: SimpleAlertColorScheme.Peach)

let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, color: UIColor.whiteColor(), handler: {() -> Void in println("cancel")})
let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, color: UIColor.hexStr(Constants.mainColorHex, alpha: 1.0), handler: {() -> Void in println("moved")})
let destructive = SimpleAlertAction(title: "Destructive", style: SimpleAlertActionStyle.Destructive, color: UIColor.hexStr(Constants.subColorHex, alpha: 1.0), handler: nil)

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

let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in println("Cancelled")})
cancel.buttonColor = UIColor.whiteColor()
cancel.buttonTextColor = UIColor(red: 51/255, green: 188/255, blue: 255/255, alpha: 1.0)


alert.addAction(move)
alert.addAction(destructive)
alert.addAction(cancel)
simplePresentViewController(alert, animated: true)
```

#### Menu only

`nil` in title and message.

```swift
let alert = SimpleAlertController(title: nil, message: nil, colorScheme: SimpleAlertColorScheme.Peach)

let move = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, handler: {() -> Void in self.tabBarController?.selectedIndex = 2})
let destructive = SimpleAlertAction(title: "Destrctive", style: SimpleAlertActionStyle.Destructive, handler: nil)
let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, handler: {() -> Void in println("Cancelled")})

alert.addAction(move)
alert.addAction(destructive)
alert.addAction(cancel)
simplePresentViewController(alert, animated: true)
```

### Installation

Add the `SimpleAlertController.swift` in to your project.

### Reuirements

* iOS 7.0+
* Swift 1.2+


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

