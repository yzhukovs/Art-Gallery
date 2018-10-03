//
//  Painting.swift
//  Lambda Gallery
//
//  Created by Yvette Zhukovsky on 10/3/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

struct Painting {
    var isLiked: Bool
    let image: UIImage
    

    init(image:UIImage, isLiked: Bool = false) {
        self.image = image
        self.isLiked = isLiked
    }
    


}
