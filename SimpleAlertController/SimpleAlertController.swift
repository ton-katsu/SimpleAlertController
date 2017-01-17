//
//  SimpleAlertController.swift
//  SimpleAlertController
//
//  Created by ton-katsu on 2015/04/13.
//  Copyright (c) 2015 ton-katsu. All rights reserved.
//

import UIKit

open class SimpleAlertController: UIViewController {
    
    fileprivate var mainWindow: UIWindow!
    fileprivate var contentView: UIView = UIView()
    fileprivate var eventDict: [Int: () -> Void] = [:]
    fileprivate var buttons: [UIButton] = []
    
    fileprivate let buttonHeight: CGFloat = 44
    fileprivate var contentViewWidth: CGFloat = 0
    fileprivate let widthMargin: CGFloat = 50
    fileprivate let margin: CGFloat = 8
    fileprivate let titleHeight: CGFloat = 30
    
    fileprivate var titleLabel: UILabel?
    fileprivate var titleText: String?
    fileprivate var messageLabel: UILabel?
    fileprivate var messageText: String?
    
    open var backgroundColor: UIColor!
    open var alertTableColor: UIColor!
    open var textColor: UIColor?
    fileprivate var destructiveTextColor: UIColor?
    fileprivate var cancelTextColor: UIColor?
    fileprivate var defaultButtonColor: UIColor?
    fileprivate var destructiveButtonColor: UIColor?
    fileprivate var cancelButtonColor: UIColor?

    
    public convenience init(title titleText: String?, message messageText: String?) {
        self.init()
        self.titleText = titleText
        self.messageText = messageText
        setColorScheme(SimpleAlertColorScheme.cloud)
        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        contentViewWidth = mainWindow.frame.size.width - (widthMargin * 2)
    }

    public convenience init(title titleText: String?, message messageText: String?, colorScheme: SimpleAlertColorScheme) {
        self.init()
        self.titleText = titleText
        self.messageText = messageText
        setColorScheme(colorScheme)
        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        contentViewWidth = mainWindow.frame.size.width - (widthMargin * 2)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = backgroundColor
        view.frame = UIScreen.main.bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        mainWindow.addSubview(view)
        setContentView()
        setTitleLabel()
        setMessageLabel()
        layoutContents()
    }
    
    fileprivate func setContentView() {
        contentView.center = mainWindow.center
        contentView.backgroundColor = alertTableColor
        contentView.layer.borderWidth = 0.5
        contentView.backgroundColor = alertTableColor
        contentView.layer.borderColor = alertTableColor.cgColor
        contentView.center = view.center
        view.addSubview(contentView)
    }
    
    fileprivate func setTitleLabel() {
        if titleText == nil {
            return
        }
        titleLabel = UILabel()
        titleLabel!.text = titleText
        titleLabel!.numberOfLines = 1
        titleLabel!.textAlignment = .center
        titleLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel!.textColor = textColor
    }
    
    fileprivate func setMessageLabel() {
        if messageText == nil {
            return
        }
        messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: contentViewWidth, height: CGFloat.greatestFiniteMagnitude))
        messageLabel!.text = messageText
        messageLabel!.textAlignment = .center
        messageLabel!.numberOfLines = 0
        messageLabel!.textColor = textColor
        messageLabel!.sizeToFit()
    }
    
    open func addAction(_ action: SimpleAlertAction) {
        eventDict[action.style.rawValue] = action.handler
        let button = UIButton()
        button.tag = action.style.rawValue
        button.setTitle(action.title, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        switch action.style {
        case SimpleAlertActionStyle.default:
            button.setTitleColor(textColor, for: UIControlState())
            button.backgroundColor = defaultButtonColor
        case SimpleAlertActionStyle.cancel:
            button.setTitleColor(cancelTextColor, for: UIControlState())
            button.backgroundColor = cancelButtonColor
        case SimpleAlertActionStyle.destructive:
            button.setTitleColor(destructiveTextColor, for: UIControlState())
            button.backgroundColor = destructiveButtonColor
        case SimpleAlertActionStyle.reserve:
            button.setTitleColor(textColor, for: UIControlState())
            button.backgroundColor = destructiveButtonColor
        }
        if action.buttonColor != nil {
            button.backgroundColor = action.buttonColor
        }
        if action.buttonTextColor != nil {
            button.setTitleColor(action.buttonTextColor, for: UIControlState())
        }
        button.center = contentView.center
        button.addTarget(self, action: #selector(SimpleAlertController.runAction(_:)), for: .touchUpInside)
        buttons.append(button)
    }
    
    
    open func runAction(_ button: UIButton) {
        closeAlert()
        
        if let possibleHandler = eventDict[button.tag] {
            possibleHandler()
        } else {
            print("Handler is nil or not executable.")
        }
    }
    
    fileprivate func closeAlert() {
        simpleDismissViewControllerAnimated(true)
    }
    
    fileprivate func layoutContents() {
        
        var contentViewHeight: CGFloat = 0
        var y: CGFloat = 0
        
        if titleLabel != nil {
            titleLabel!.frame = CGRect(x: margin, y: y + margin, width: contentViewWidth - (margin * 2), height: titleHeight)
            contentView.addSubview(titleLabel!)
            contentViewHeight += titleHeight + (margin * 2)
            y += titleHeight + (margin * 2)
        }
        
        if messageLabel != nil {
            if titleLabel == nil {
                contentViewHeight += (margin * 2)
                y += (margin * 2)
                messageLabel!.font = UIFont.systemFont(ofSize: 18)
                messageLabel?.sizeToFit()
                messageLabel!.frame = CGRect(x: margin, y: y, width: contentViewWidth - (margin * 2), height: messageLabel!.frame.size.height)
                contentView.addSubview(messageLabel!)
                contentViewHeight += messageLabel!.frame.size.height + (margin * 2)
                y += messageLabel!.frame.size.height + (margin * 2)
            } else {
                messageLabel!.font = UIFont.systemFont(ofSize: 15)
                messageLabel?.sizeToFit()
                messageLabel!.frame = CGRect(x: margin, y: y, width: contentViewWidth - (margin * 2), height: messageLabel!.frame.size.height)
                contentView.addSubview(messageLabel!)
                contentViewHeight += messageLabel!.frame.size.height + margin
                y += messageLabel!.frame.size.height + margin
            }
        }
        
        if buttons.count != 0 {
            for button in buttons {
                button.frame = CGRect(x: 0, y: y, width: contentViewWidth, height: buttonHeight)
                contentView.addSubview(button)
                contentViewHeight += buttonHeight
                y += buttonHeight
            }
        }
        
        contentView.frame = CGRect(x: 0, y: 0, width: contentViewWidth, height: contentViewHeight)
        contentView.center = mainWindow.center
    }
}


extension UIViewController {
    
    public func simplePresentViewController(_ controller: UIViewController, animated: Bool) {
        if (UIDevice.current.systemVersion as NSString).floatValue >= 8.0 {
            controller.simpleSetupTransition()
            present(controller, animated: animated, completion: nil)
        } else {
            simpleSetupTransitionForIOS7()
            if animated {
                let transition = CATransition()
                transition.duration = 0.3
                view.window!.layer.add(transition, forKey: nil)
                present(controller, animated: false, completion: nil)
            } else {
                present(controller, animated: false, completion: nil)
            }
        }
    }
    
    public func simpleDismissViewControllerAnimated(_ animated: Bool) {
        if (UIDevice.current.systemVersion as NSString).floatValue >= 8.0 {
            presentingViewController?.simpleSetupTransition()
        } else {
            simpleSetupTransitionForIOS7()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func simpleSetupTransitionForIOS7() {
        modalPresentationStyle = .currentContext
        modalTransitionStyle = .crossDissolve
    }
    
    fileprivate func simpleSetupTransition() {
        if #available(iOS 8.0, *) {
            modalPresentationStyle = .overCurrentContext
        }
        modalTransitionStyle = .crossDissolve
    }
}

public enum SimpleAlertActionStyle: Int {
    case `default`
    case cancel
    case destructive
    case reserve
}

open class SimpleAlertAction {
    
    fileprivate var title: String
    fileprivate var style: SimpleAlertActionStyle
    fileprivate var handler: (() -> Void)?
    open var buttonColor: UIColor?
    open var buttonTextColor: UIColor?
    
    public init(title: String, style: SimpleAlertActionStyle, handler: (() -> Void)?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}

public enum SimpleAlertColorScheme: Int {
    case cloud
    case lime
    case ocean
    case peach
}

extension SimpleAlertController {
    
    public func setColorScheme(_ colorScheme: SimpleAlertColorScheme) {
        switch colorScheme {
        case .cloud:
            backgroundColor = UIColor(white: 1.0, alpha: 0.7)
            alertTableColor = UIColor(white: 0.4, alpha: 1.0)
            textColor = UIColor.white
            defaultButtonColor = UIColor(white: 0.6, alpha: 1.0)
            destructiveButtonColor = UIColor(white: 0.8, alpha: 1.0)
            destructiveTextColor = UIColor.red
            cancelButtonColor = UIColor.white
            cancelTextColor = alertTableColor
        case .lime:
            backgroundColor = UIColor(white: 1.0, alpha: 0.7)
            alertTableColor = UIColor(red: 27/255, green: 188/255, blue: 155/255, alpha: 1.0)
            textColor = UIColor.white
            defaultButtonColor = UIColor(red: 101/255, green: 198/255, blue: 187/255, alpha: 1.0)
            destructiveButtonColor = UIColor(red: 162/255, green: 222/255, blue: 208/255, alpha: 1.0)
            destructiveTextColor = UIColor.red
            cancelButtonColor = UIColor.white
            cancelTextColor = alertTableColor
        case .ocean:
            backgroundColor = UIColor(red: 89/255, green: 171/255, blue: 227/255, alpha: 0.7)
            alertTableColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
            textColor = UIColor.white
            defaultButtonColor = UIColor(red: 89/255, green: 171/255, blue: 227/255, alpha: 1.0)
            destructiveButtonColor = UIColor(red: 107/255, green: 185/255, blue: 240/255, alpha: 1.0)
            destructiveTextColor = UIColor.red
            cancelButtonColor = UIColor.white
            cancelTextColor = alertTableColor
        case .peach:
            backgroundColor = UIColor(white: 1, alpha: 0.7)
            alertTableColor = UIColor(red: 255/255, green: 164/255, blue: 185/255, alpha: 1.0)
            textColor = UIColor.white
            destructiveTextColor = UIColor.red
            cancelTextColor = alertTableColor
            defaultButtonColor = UIColor(red: 255/255, green: 178/255, blue: 196/255, alpha: 1.0)
            destructiveButtonColor = UIColor(red: 255/255, green: 208/255, blue: 216/255, alpha: 1.0)
            cancelButtonColor = UIColor.white
        }
    }
}







