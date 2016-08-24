//
//  SimpleAlertController.swift
//  SimpleAlertController
//
//  Created by ton-katsu on 2015/04/13.
//  Copyright (c) 2015 ton-katsu. All rights reserved.
//

import UIKit

public class SimpleAlertController: UIViewController {
    
    private var mainWindow: UIWindow!
    private var contentView: UIView = UIView()
    private var eventDict: [Int: () -> Void] = [:]
    private var buttons: [UIButton] = []
    
    private let buttonHeight: CGFloat = 44
    private var contentViewWidth: CGFloat = 0
    private let widthMargin: CGFloat = 50
    private let margin: CGFloat = 8
    private let titleHeight: CGFloat = 30
    
    private var titleLabel: UILabel?
    private var titleText: String?
    private var messageLabel: UILabel?
    private var messageText: String?
    
    public var backgroundColor: UIColor!
    public var alertTableColor: UIColor!
    public var textColor: UIColor?
    private var destructiveTextColor: UIColor?
    private var cancelTextColor: UIColor?
    private var defaultButtonColor: UIColor?
    private var destructiveButtonColor: UIColor?
    private var cancelButtonColor: UIColor?

    
    public convenience init(title titleText: String?, message messageText: String?) {
        self.init()
        self.titleText = titleText
        self.messageText = messageText
        setColorScheme(SimpleAlertColorScheme.Cloud)
        mainWindow = UIApplication.sharedApplication().keyWindow
        contentViewWidth = mainWindow.frame.size.width - (widthMargin * 2)
    }

    public convenience init(title titleText: String?, message messageText: String?, colorScheme: SimpleAlertColorScheme) {
        self.init()
        self.titleText = titleText
        self.messageText = messageText
        setColorScheme(colorScheme)
        mainWindow = UIApplication.sharedApplication().keyWindow
        contentViewWidth = mainWindow.frame.size.width - (widthMargin * 2)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = backgroundColor
        view.frame = UIScreen.mainScreen().bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        mainWindow.addSubview(view)
        setContentView()
        setTitleLabel()
        setMessageLabel()
        layoutContents()
    }
    
    private func setContentView() {
        contentView.center = mainWindow.center
        contentView.backgroundColor = alertTableColor
        contentView.layer.borderWidth = 0.5
        contentView.backgroundColor = alertTableColor
        contentView.layer.borderColor = alertTableColor.CGColor
        contentView.center = view.center
        view.addSubview(contentView)
    }
    
    private func setTitleLabel() {
        if titleText == nil {
            return
        }
        titleLabel = UILabel()
        titleLabel!.text = titleText
        titleLabel!.numberOfLines = 1
        titleLabel!.textAlignment = .Center
        titleLabel!.font = UIFont.boldSystemFontOfSize(20)
        titleLabel!.textColor = textColor
    }
    
    private func setMessageLabel() {
        if messageText == nil {
            return
        }
        messageLabel = UILabel(frame: CGRectMake(0, 0, contentViewWidth, CGFloat.max))
        messageLabel!.text = messageText
        messageLabel!.textAlignment = .Center
        messageLabel!.numberOfLines = 0
        messageLabel!.textColor = textColor
        messageLabel!.sizeToFit()
    }
    
    public func addAction(action: SimpleAlertAction) {
        eventDict[action.style.rawValue] = action.handler
        let button = UIButton()
        button.tag = action.style.rawValue
        button.setTitle(action.title, forState: .Normal)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        switch action.style {
        case SimpleAlertActionStyle.Default:
            button.setTitleColor(textColor, forState: .Normal)
            button.backgroundColor = defaultButtonColor
        case SimpleAlertActionStyle.Cancel:
            button.setTitleColor(cancelTextColor, forState: .Normal)
            button.backgroundColor = cancelButtonColor
        case SimpleAlertActionStyle.Destructive:
            button.setTitleColor(destructiveTextColor, forState: .Normal)
            button.backgroundColor = destructiveButtonColor
        case SimpleAlertActionStyle.Reserve:
            button.setTitleColor(textColor, forState: .Normal)
            button.backgroundColor = destructiveButtonColor
        }
        if action.buttonColor != nil {
            button.backgroundColor = action.buttonColor
        }
        if action.buttonTextColor != nil {
            button.setTitleColor(action.buttonTextColor, forState: .Normal)
        }
        button.center = contentView.center
        button.addTarget(self, action: #selector(SimpleAlertController.runAction(_:)), forControlEvents: .TouchUpInside)
        buttons.append(button)
    }
    
    
    public func runAction(button: UIButton) {
        closeAlert()
        
        if let possibleHandler = eventDict[button.tag] {
            possibleHandler()
        } else {
            print("Handler is nil or not executable.")
        }
    }
    
    private func closeAlert() {
        simpleDismissViewControllerAnimated(true)
    }
    
    private func layoutContents() {
        
        var contentViewHeight: CGFloat = 0
        var y: CGFloat = 0
        
        if titleLabel != nil {
            titleLabel!.frame = CGRectMake(margin, y + margin, contentViewWidth - (margin * 2), titleHeight)
            contentView.addSubview(titleLabel!)
            contentViewHeight += titleHeight + (margin * 2)
            y += titleHeight + (margin * 2)
        }
        
        if messageLabel != nil {
            if titleLabel == nil {
                contentViewHeight += (margin * 2)
                y += (margin * 2)
                messageLabel!.font = UIFont.systemFontOfSize(18)
                messageLabel?.sizeToFit()
                messageLabel!.frame = CGRectMake(margin, y, contentViewWidth - (margin * 2), messageLabel!.frame.size.height)
                contentView.addSubview(messageLabel!)
                contentViewHeight += messageLabel!.frame.size.height + (margin * 2)
                y += messageLabel!.frame.size.height + (margin * 2)
            } else {
                messageLabel!.font = UIFont.systemFontOfSize(15)
                messageLabel?.sizeToFit()
                messageLabel!.frame = CGRectMake(margin, y, contentViewWidth - (margin * 2), messageLabel!.frame.size.height)
                contentView.addSubview(messageLabel!)
                contentViewHeight += messageLabel!.frame.size.height + margin
                y += messageLabel!.frame.size.height + margin
            }
        }
        
        if buttons.count != 0 {
            for button in buttons {
                button.frame = CGRectMake(0, y, contentViewWidth, buttonHeight)
                contentView.addSubview(button)
                contentViewHeight += buttonHeight
                y += buttonHeight
            }
        }
        
        contentView.frame = CGRectMake(0, 0, contentViewWidth, contentViewHeight)
        contentView.center = mainWindow.center
    }
}


extension UIViewController {
    
    public func simplePresentViewController(controller: UIViewController, animated: Bool) {
        if (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0 {
            controller.simpleSetupTransition()
            presentViewController(controller, animated: animated, completion: nil)
        } else {
            simpleSetupTransitionForIOS7()
            if animated {
                let transition = CATransition()
                transition.duration = 0.3
                view.window!.layer.addAnimation(transition, forKey: nil)
                presentViewController(controller, animated: false, completion: nil)
            } else {
                presentViewController(controller, animated: false, completion: nil)
            }
        }
    }
    
    public func simpleDismissViewControllerAnimated(animated: Bool) {
        if (UIDevice.currentDevice().systemVersion as NSString).floatValue >= 8.0 {
            presentingViewController?.simpleSetupTransition()
        } else {
            simpleSetupTransitionForIOS7()
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func simpleSetupTransitionForIOS7() {
        modalPresentationStyle = .CurrentContext
        modalTransitionStyle = .CrossDissolve
    }
    
    private func simpleSetupTransition() {
        if #available(iOS 8.0, *) {
            modalPresentationStyle = .OverCurrentContext
        }
        modalTransitionStyle = .CrossDissolve
    }
}

public enum SimpleAlertActionStyle: Int {
    case Default
    case Cancel
    case Destructive
    case Reserve
}

public class SimpleAlertAction {
    
    private var title: String
    private var style: SimpleAlertActionStyle
    private var handler: (() -> Void)?
    public var buttonColor: UIColor?
    public var buttonTextColor: UIColor?
    
    public init(title: String, style: SimpleAlertActionStyle, handler: (() -> Void)?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}

public enum SimpleAlertColorScheme: Int {
    case Cloud
    case Lime
    case Ocean
    case Peach
}

extension SimpleAlertController {
    
    public func setColorScheme(colorScheme: SimpleAlertColorScheme) {
        switch colorScheme {
        case .Cloud:
            backgroundColor = UIColor(white: 1.0, alpha: 0.7)
            alertTableColor = UIColor(white: 0.4, alpha: 1.0)
            textColor = UIColor.whiteColor()
            defaultButtonColor = UIColor(white: 0.6, alpha: 1.0)
            destructiveButtonColor = UIColor(white: 0.8, alpha: 1.0)
            destructiveTextColor = UIColor.redColor()
            cancelButtonColor = UIColor.whiteColor()
            cancelTextColor = alertTableColor
        case .Lime:
            backgroundColor = UIColor(white: 1.0, alpha: 0.7)
            alertTableColor = UIColor(red: 27/255, green: 188/255, blue: 155/255, alpha: 1.0)
            textColor = UIColor.whiteColor()
            defaultButtonColor = UIColor(red: 101/255, green: 198/255, blue: 187/255, alpha: 1.0)
            destructiveButtonColor = UIColor(red: 162/255, green: 222/255, blue: 208/255, alpha: 1.0)
            destructiveTextColor = UIColor.redColor()
            cancelButtonColor = UIColor.whiteColor()
            cancelTextColor = alertTableColor
        case .Ocean:
            backgroundColor = UIColor(red: 89/255, green: 171/255, blue: 227/255, alpha: 0.7)
            alertTableColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            textColor = UIColor.whiteColor()
            defaultButtonColor = UIColor(red: 89/255, green: 171/255, blue: 227/255, alpha: 1.0)
            destructiveButtonColor = UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1.0)
            destructiveTextColor = UIColor.redColor()
            cancelButtonColor = UIColor.whiteColor()
            cancelTextColor = alertTableColor
        case .Peach:
            backgroundColor = UIColor(white: 1, alpha: 0.7)
            alertTableColor = UIColor(red: 255/255, green: 164/255, blue: 185/255, alpha: 1.0)
            textColor = UIColor.whiteColor()
            destructiveTextColor = UIColor.redColor()
            cancelTextColor = alertTableColor
            defaultButtonColor = UIColor(red: 255/255, green: 178/255, blue: 196/255, alpha: 1.0)
            destructiveButtonColor = UIColor(red: 255/255, green: 208/255, blue: 216/255, alpha: 1.0)
            cancelButtonColor = UIColor.whiteColor()
        }
    }
}







