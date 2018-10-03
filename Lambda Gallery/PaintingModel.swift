//
//  PaintingModel.swift
//  Lambda Gallery
//
//  Created by Yvette Zhukovsky on 10/3/18.
//  Copyright © 2018 Yvette Zhukovsky. All rights reserved.
//

import UIKit

class PaintingModel: NSObject, UITableViewDataSource, PaintingTableViewCellDelegate {

    
    var paintings: [Painting] = []
    
    
    weak var tableView: UITableView?
    
    override init() {
        for images in 1...12 {
            let image: String = "painting\(images)"
            guard let UIImage = UIImage(named: image) else {return}
            let painting = Painting(image: UIImage)
            paintings.append(painting)
        }
    }
    
    
    func tappedLikeButton(on cell: PaintingTableViewCell) {
        guard let indexPath = tableView?.indexPath(for: cell) else {
            fatalError("Non Existant Cell")
        }
        
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        weak var tableView: UITableView?
        self.tableView = tableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paintings.count
        
    }
    
    let reuseIdentifier = "cell"
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? PaintingTableViewCell else {
            fatalError("Could not instantiate guaranteed cell type")
        }
        
        cell.delegate = self
     
        return cell
        
}
}
