//
//  PaintingTableViewCellDelegate.swift
//  Lambda Gallery
//
//  Created by Yvette Zhukovsky on 10/3/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

protocol PaintingTableViewCellDelegate: class {
    func tappedLikeButton(on cell: PaintingTableViewCell)
}

