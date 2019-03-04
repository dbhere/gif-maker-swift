//
//  PreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by AlexScott on 2019/2/3.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    @IBOutlet weak var gifImageView: UIImageView!
    var gif: Gif?
    
    override func viewWillAppear(_ animated: Bool) {
        gifImageView.image = gif?.gifImage
    }
}
