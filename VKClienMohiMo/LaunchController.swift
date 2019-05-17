//
//  LaunchController.swift
//  VKClienMohiMo
//
//  Created by Михаил Мохнач on 17/05/2019.
//  Copyright © 2019 Михаил Мохнач. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var Usernametextfield: UITextField!
    @IBOutlet weak var Passwordtextfield: UITextField!
    
    
    @IBAction func LoginButtonPress(_ sender: UIButton) {
        
        if Usernametextfield.text == "name", Passwordtextfield.text == "qwerty" {
            print("Успешный вход")
        } else {
            print("Неверный логин или пароль")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let hidekeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
      scrollView?.addGestureRecognizer(hidekeyboardGesture)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
  @objc func keyboardWasShown(notification: Notification) {
            
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
            
            self.scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
        }
        
    @objc func keyboardWillbeHidden(nofication: Notification) {
            
            let contentInsets = UIEdgeInsets.zero
            scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
        }

    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }
    
    }
    


