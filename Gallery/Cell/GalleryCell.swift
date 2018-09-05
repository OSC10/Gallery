//
//  GalleryCell.swift
//  Gallery
//
//  Created by Owen Cahyadi on 05/09/18.
//  Copyright © 2018 Owen Cahyadi. All rights reserved.
//

import UIKit

class GalleryCell: UITableViewCell {

    @IBOutlet var galleryImage: UIImageView!
    
    func fillCell(image:String) {
        galleryImage.image = UIImage(named: image)
    }
    
}
