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
    
    // MARK: - Share gif
    @IBAction func shareGif(_ sender: AnyObject) {
        guard let gif = gif, let animatedGif = try? Data(contentsOf: gif.url) else {
            return
        }
        
        let shareController = UIActivityViewController(activityItems: [animatedGif], applicationActivities: nil)
        shareController.completionWithItemsHandler = { activity, success, items, error in
            if success {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        present(shareController, animated: true, completion: nil)
    }

}
