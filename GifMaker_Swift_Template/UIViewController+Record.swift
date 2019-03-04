//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by AlexScott on 2019/2/10.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import MobileCoreServices

// Regift constants
let frameCount = 16
let delayTime  = Float(0.2)
let loopCount  = 0    // 0 means loop forever

extension UIViewController {
    // MARK: - 录制按钮
    //录制按钮提供三种选择：相册，拍摄，取消
    @IBAction func presentVideoOptions(_ sender: AnyObject) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            launchPhotoLibrary()
            return
        }
        
        //呈现alertVC
        let newGifActionSheet = UIAlertController(title: "创建新gif", message: nil, preferredStyle: .actionSheet)
        let recordVideoAction = UIAlertAction(title: "录像", style: .default) { (action) in
            self.launchVideoCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "相册", style: .default) { (action) in
            self.launchPhotoLibrary()
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        newGifActionSheet.addAction(recordVideoAction)
        newGifActionSheet.addAction(chooseFromLibraryAction)
        newGifActionSheet.addAction(cancelAction)
        
        present(newGifActionSheet, animated: true, completion: nil)
        newGifActionSheet.view.tintColor = UIColor(red: 255.0/255.0, green: 65.0/255.0, blue: 112.0/255.0, alpha: 1.0)
    }
    
    func launchVideoCamera() {
        pickerControllerWithSource(sourceType: .camera)
    }
    
    func launchPhotoLibrary() {
        pickerControllerWithSource(sourceType: .photoLibrary)
    }
    
    // MARK: - Utilities
    func pickerControllerWithSource(sourceType: UIImagePickerController.SourceType) {
        let recordVideoController = UIImagePickerController()
        
        //set sourceType, mediaTypes, allowsEditing, delegate
        recordVideoController.sourceType = sourceType
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        
        present(recordVideoController, animated: true, completion: nil)
    }
    
    // MARK: - gif conversion
    func convertVideoToGif(videoURL: URL) {
        let regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        let gifURL = regift.createGif()
        let gif = Gif(url: gifURL!, videoURL: videoURL, caption: nil)
        displayGif(gif)
    }
    
    func displayGif(_ gif: Gif) {
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gif = gif
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}

// MARK: - UIViewController: UINavigationControllerDelegate
extension UIViewController: UINavigationControllerDelegate {}

// MARK: - UIViewController: UIImagePickerControllerDelegate
extension UIViewController: UIImagePickerControllerDelegate {
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String {
            let videoURL = info[UIImagePickerControllerMediaURL] as! URL
            //UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
            convertVideoToGif(videoURL: videoURL)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
