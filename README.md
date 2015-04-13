Simple Alert View Controller
============================

Very simple alert view controller.
API is UIAlertController like.

### Usage

##### Basic color
```swift
let alert = SimpleAlertController(title: "SimpleAlert", message: "It's simple!")
let cancel = SimpleAlertAction(title: "Cancel", style: SimpleAlertActionStyle.Cancel, color: UIColor.whiteColor(), handler: {() -> Void in println("cancel")})
let moveTab = SimpleAlertAction(title: "Move", style: SimpleAlertActionStyle.Default, color: UIColor.hexStr(Constants.mainColorHex, alpha: 1.0), handler: {() -> Void in self.tabBarController?.selectedIndex = 0})
let destructive = SimpleAlertAction(title: "Destructive", style: SimpleAlertActionStyle.Destructive, color: UIColor.hexStr(Constants.subColorHex, alpha: 1.0), handler: {() -> Void in println("destructive")})

alert.addAction(moveTab)
alert.addAction(destructive)
alert.addAction(cancel)

tabBarController?.cocoroPresentViewController(alert, animated: true)
```

##### Select Color Style


##### Custom Color


### Installation

Add the `SimpleAlertController.swift` in to your project.

### Reuirements

- Xcode 6.3+
- iOS 7.0+
- Swift 1.2+


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

