//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by AlexScott on 2019/2/12.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class Gif {
    let url: URL?
    let videoURL: URL?
    let caption: String?
    let gifImage: UIImage?
    var gifData: Data?
    
    init(url: URL, videoURL: URL, caption: String?) {
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString)
        self.gifData = nil
    }
    
    init(name: String) {
        self.gifImage = UIImage.gif(name: name)
        self.url = nil
        self.videoURL = nil
        self.caption = nil
        self.gifData = nil
    }
}
