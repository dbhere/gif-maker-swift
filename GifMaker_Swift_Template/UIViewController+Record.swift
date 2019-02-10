//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by AlexScott on 2019/2/10.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import MobileCoreServices

extension UIViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func launchVideoCamera(sender: AnyObject) {
        let recordVideoController = UIImagePickerController()
        
        //set sourceType, mediaTypes, allowsEditing, delegate
        recordVideoController.sourceType = .camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
}
