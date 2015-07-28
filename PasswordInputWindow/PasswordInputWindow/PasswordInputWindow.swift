//
//  PasswordInputWindow.swift
//  PasswordInputWindow
//
//  Created by jianwei on 15/7/28.
//  Copyright (c) 2015年 Jianwei. All rights reserved.
//

import UIKit

class PasswordInputWindow: UIWindow {
    var textField:UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var label = UILabel(frame: CGRectMake(10, 50, 200, 20))
        label.text = "请输入密码"
        self .addSubview(label)
        
        var textField = UITextField(frame: CGRectMake(10,80,200,20))
        textField.backgroundColor = UIColor.whiteColor()
        textField.secureTextEntry = true
        self.addSubview(textField)
        
        var button = UIButton(frame: CGRectMake(10, 110, 200, 44))
        button.backgroundColor = UIColor.blueColor()
        button.titleLabel?.textColor = UIColor.blackColor()
        button.setTitle("确定", forState: .Normal)
        button.addTarget(self, action: "completeButtonPressed:", forControlEvents: .TouchUpInside)
        self.addSubview(button)
        
        self.backgroundColor = UIColor.yellowColor()
        self.textField = textField
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class var sharedInstance:PasswordInputWindow{
        struct Static {
            static let instance:PasswordInputWindow = PasswordInputWindow(frame:UIScreen.mainScreen().bounds)
        }
        NSLog("shared instance: %@",Static.instance)
        Static.instance.windowLevel = UIWindowLevelAlert
        return Static.instance
    }

    func show(){
        NSLog("show....")
        self.makeKeyWindow()
        self.hidden = false
    }
    
    func completeButtonPressed(sender:UIButton){
        if textField?.text == "jianwei" {
            textField?.resignFirstResponder()
            self.resignKeyWindow()
            self.hidden = true
        }else{
            self.showErrorAlertView()
        }
    }
    
    func showErrorAlertView(){
        var message:String? = "密码错误，正确的密码是jianwei"
        var cancel:String? = "OK"
        var alertView = UIAlertView(title: nil, message: message, delegate: nil, cancelButtonTitle: cancel)
        alertView.show()
    }
    
}
