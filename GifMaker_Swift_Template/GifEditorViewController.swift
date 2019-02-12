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
    var gifURL: URL?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let gifURL = gifURL {
            let gifFromRecording = UIImage.gif(url: gifURL.absoluteString)
            gifImageView.image = gifFromRecording
        }
    }
}
