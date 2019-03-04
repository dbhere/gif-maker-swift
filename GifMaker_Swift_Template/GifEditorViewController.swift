//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by AlexScott on 2019/2/3.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    var gif: Gif?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captionTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        subscribeToKeyboardNotifications()
        
        gifImageView.image = gif?.gifImage
    }
}

// MARK: - TextFieldDelegate methods
extension GifEditorViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Keyboard notification
extension GifEditorViewController {
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: Notification) {
        self.view.frame.origin.y = 0 - getKeyboardHeight(notification: notification)
        
    }
    
    func keyboardWillHide(notification: Notification) {
        self.view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(notification: Notification) -> CGFloat {
        let keyboardFrameEnd = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect
        return keyboardFrameEnd?.height ?? 0
    }
}
